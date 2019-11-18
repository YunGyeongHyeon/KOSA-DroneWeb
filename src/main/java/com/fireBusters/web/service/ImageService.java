package com.fireBusters.web.service;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.util.Date;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import javax.annotation.PreDestroy;
import javax.servlet.ServletContext;

import org.eclipse.paho.client.mqttv3.IMqttDeliveryToken;
import org.eclipse.paho.client.mqttv3.MqttCallback;
import org.eclipse.paho.client.mqttv3.MqttClient;
import org.eclipse.paho.client.mqttv3.MqttMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fireBusters.web.dao.AdminDao;

@Service
public class ImageService {
	@Autowired
    private ServletContext application;

	private MqttClient client;
	private byte[] images;
	private ExecutorService threadPool = Executors.newFixedThreadPool(1);
	private int rno;
	
	@Autowired
	private AdminDao adminDao;

	// --------------------------------------------
	public ImageService() {
		mqttConnect();
	}	
	
	private void mqttConnect() {
		try {
			client = new MqttClient("tcp://106.253.56.124:1885", MqttClient.generateClientId(), null);
			client.connect();
			receiveImageMessage();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void mqttDisconnect() {
		try {
			threadPool.shutdownNow();
			client.disconnectForcibly(1);
			client.close(true);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}	
	
	@PreDestroy
	public void destroy() {
		mqttDisconnect();
	}	

	public void receiveImageMessage() throws Exception {
		client.setCallback(new MqttCallback() {
			boolean takePicture = false;
			Thread thread;
			
			@Override
			public void connectionLost(Throwable throwable) {

			}
			@Override
			public void messageArrived(String s, MqttMessage mqttMessage) throws Exception {
				if(s.equals("/drone/cam0/rno")) {
					rno = Integer.parseInt(new String(mqttMessage.getPayload()));
	
				}
				if(s.equals("/drone/cam0/gcs")) {					
					System.out.println("sendMessage: "+new String(mqttMessage.getPayload()));
					String onOff = new String(mqttMessage.getPayload());
					if(onOff.equals("on")) {
						takePicture = true;
					} else {
						takePicture = false;
					}
				} else if(s.equals("/drone/cam0/pub")) {
					if(takePicture) {
						images = mqttMessage.getPayload();
						if(thread == null) {
							thread = new Thread() {
								@Override
								public void run() {
									while(takePicture) {
										try {
											saveFile();
											Thread.sleep(1000);
										} catch(Exception e) {}
									}
								}
							};
							thread.start();
						}
					} else {
						thread = null;
					}
				}
			}

			@Override
			public void deliveryComplete(IMqttDeliveryToken iMqttDeliveryToken) {

			}
		});
		client.subscribe("/drone/cam0/+");
	}
	// ----------------------------------------------------

	private void saveFile() {
		Runnable runnable = new Runnable() {
			@Override
			public void run() {
				try {
					if (images != null) {
						int reportNo = 100;
						Date now = new Date();
						String fileName = "" + reportNo + "_" + now.getTime() + ".jpg";
						String realPath = application.getRealPath("/resources/image/OneStar_photo/")+ fileName;
						FileOutputStream fos = new FileOutputStream(realPath);
						BufferedOutputStream bos = new BufferedOutputStream(fos);
						bos.write(images);
						bos.flush();
						bos.close();
					 	savePic(rno, fileName);
					}
				} catch (Exception e) {
					e.printStackTrace();
				}

			}
		};
		threadPool.submit(runnable);
	}
	
	public void savePic(int rno, String fileName) {
		try {
			adminDao.saveFile(rno, fileName);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}	
	
	public void sendMessage(String topic, String message) {
		try {
			client.publish(topic, message.getBytes(), 0, false);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}	
	 
}
