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
public class MqttService2 { //Subscriber //==UserService
	
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
			System.out.println("MqttService2 MQTT Broker 연결 끊기 성공");
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
            public void messageArrived(String s, MqttMessage mqttMessage) throws Exception { //메시지를 수신했을 때 자동으로 메소드 실행된다
                System.out.println("메시지를 수신했습니다.");
                System.out.println(new String(mqttMessage.getPayload())); //getPayload()는 바이트배열을 리턴하므로 문자로 만들어 출력
            	//코드작성
                byte[] bytes = mqttMessage.getPayload(); 
                String json = new String(bytes);
                JSONObject jsonObject = new JSONObject(json);
                System.out.println("제이슨왔따따따"+json);
                double lat = jsonObject.getDouble("lat");
                double lon = jsonObject.getDouble("lon");
                System.out.println("제이슨에서 위도경도 뺐따다다"+"lat"+lat+","+"lon"+lon);
                
                Thread thread = new Thread() {
                	@Override
                	public void run() {
                		try {
                			System.out.println("스레드다다다다");
                			complete(lat, lon);
	                		JSONObject jsonObject = new JSONObject();
	                		jsonObject.put("result", "ok");
	                		String json = jsonObject.toString();
	                		client.publish("/drone/service2/sub", json.getBytes(), 0, false);
                		} catch(Exception e) {
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

        client.subscribe("/drone/service2/pub"); //MqttPublisher 클래스의 클라이언트가 보낸 토픽과 같아야 한다 (client.publish()에 작성된 topic)
        
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
			if ((double)aLatLon.get(i).getFire_lat() < lat && lat < (double)aLatLon.get(i + 2).getFire_lat()
					&& (double)aLatLon.get(i).getFire_lon() < lon && lon < (double)aLatLon.get(i + 2).getFire_lon()) {          
					rows = writeLocation(lat, lon, (int)aLatLon.get(i).getFire_station_id());
					n = 1;
			}
		}
		System.out.println("엠큐티티서비스");
		if(n == 0) {
			return "/user/exception";
		}
		return "/user/complete";
	}	

}
