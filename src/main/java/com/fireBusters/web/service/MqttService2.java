package com.fireBusters.web.service;

import java.util.List;

import javax.annotation.PreDestroy;

import org.eclipse.paho.client.mqttv3.IMqttDeliveryToken;
import org.eclipse.paho.client.mqttv3.MqttCallback;
import org.eclipse.paho.client.mqttv3.MqttClient;
import org.eclipse.paho.client.mqttv3.MqttMessage;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fireBusters.web.dao.UserDao;
import com.fireBusters.web.dto.AdminLatLon;

@Service
public class MqttService2 { // Subscriber //==UserService

	@Autowired
	UserDao userDao;

	private MqttClient client;

	public MqttService2() throws Exception {
		client = new MqttClient("tcp://localhost:1885", MqttClient.generateClientId(), null);
		client.connect();
		receiveMessage();
	}

	private void mattDisconnect() {
		try {
			// MQTT client를 죽이는 코드 작성
			client.disconnectForcibly(1);
			client.close(true);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@PreDestroy
	public void destroy() {
		mattDisconnect();
	}

	public void receiveMessage() throws Exception {
		client.setCallback(new MqttCallback() {
			@Override
			public void connectionLost(Throwable throwable) {

			}

			@Override
			public void messageArrived(String s, MqttMessage mqttMessage) throws Exception {
				// 코드작성
				byte[] bytes = mqttMessage.getPayload();
				String json = new String(bytes);
				JSONObject jsonObject = new JSONObject(json);
				double lat = jsonObject.getDouble("lat");
				double lon = jsonObject.getDouble("lon");

				Thread thread = new Thread() {
					@Override
					public void run() {
						try {
							complete(lat, lon);
							JSONObject jsonObject = new JSONObject();
							jsonObject.put("result", "ok");
							String json = jsonObject.toString();
							client.publish("/drone/service2/sub", json.getBytes(), 0, false);
						} catch (Exception e) {
							e.printStackTrace();
						}
					}
				};
				thread.start();
			}

			@Override
			public void deliveryComplete(IMqttDeliveryToken iMqttDeliveryToken) {

			}
		});

		client.subscribe("/drone/service2/pub");

	}

	public int writeLocation(double lat, double lon, int fire_station_id) {
		int rows = userDao.insert(lat, lon, fire_station_id);
		return rows;
	}

	@Autowired
	private AdminService adminService;

	public String complete(double lat, double lon) throws Exception {
		List<AdminLatLon> aLatLon = adminService.selectPoint();
		int n = 0;
		int rows = 0;
		for (int i = 0; i < ((int) aLatLon.size()); i += 4) {
			if ((double) aLatLon.get(i).getFire_lat() < lat && lat < (double) aLatLon.get(i + 2).getFire_lat()
					&& (double) aLatLon.get(i).getFire_lon() < lon && lon < (double) aLatLon.get(i + 2).getFire_lon()) {
				rows = writeLocation(lat, lon, (int) aLatLon.get(i).getFire_station_id());
				n = 1;
			}
		}
		if (n == 0) {
			return "/user/exception";
		}
		return "/user/complete";
	}

}
