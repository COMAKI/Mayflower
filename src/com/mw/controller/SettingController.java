package com.mw.controller;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mw.dao.mapper.SpotMapper;
import com.mw.vo.Spot;

@Controller
public class SettingController {

	@Autowired
	SpotMapper mapper;

	@RequestMapping("/callAPI")
	public String callAPI() {
		// checkData exist
		configData(new Spot());

		System.out.println("success");
		return "main"; // main.jsp
	}

	private void configData(Object target) {
		// TODO Call target API
		if (target instanceof Spot) {
			ArrayList<Spot> spots = dataLoad("json");
			// for (int i = 0; i < spots.size(); i++) {
			// mapper.insert(spots.get(i));
			// }

		}

	}

	private ArrayList<Spot> dataLoad(String type) {
		int resultCode = 0;
		ArrayList<Spot> result = new ArrayList<>();

		String key = "UtE%2B%2BpVIVK2RQksQsXFcWWWHEqj7TZDaE46kR3l9fY64c%2BMx7n13gZSOJp%2BpeXBvIKDj1nt7nZuQLRUFqrU1ZQ%3D%3D";
		String maxCount = "2000";
		try {
			StringBuilder urlBuilder = new StringBuilder("http://api.data.go.kr/openapi/pblic-toilet-std"); /* URL */
			urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "="
					+ key); /* Service Key */
			urlBuilder.append("&" + URLEncoder.encode("s_page", "UTF-8") + "="
					+ URLEncoder.encode("1", "UTF-8")); /* ������ ��ȣ */
			urlBuilder.append("&" + URLEncoder.encode("s_list", "UTF-8") + "="
					+ URLEncoder.encode(maxCount, "UTF-8")); /* ������ ũ�� */
			urlBuilder.append("&" + URLEncoder.encode("type", "UTF-8") + "="
					+ URLEncoder.encode(type, "UTF-8")); /* XML/JSON ���� */
			URL url = new URL(urlBuilder.toString());

			// connect API
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");

			BufferedReader rd;
			JSONArray data;

			if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {

				resultCode = conn.getResponseCode();
				System.out.println("Response code: " + resultCode);

				rd = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));

				data = (JSONArray) new JSONParser().parse(rd.readLine());

				Iterator<JSONArray> iterator = data.iterator();
				ArrayList<Spot> list = new ArrayList<>();

			} else {
				//// TODO default data input
				rd = new BufferedReader(new InputStreamReader(new FileInputStream("data1.json"), "UTF8"));

				JSONObject jsonObject = (JSONObject) new JSONParser().parse(rd);

				// property setting
				String columnName = "fields";
				String rowName = "records";

				// loop array
				JSONArray columns = (JSONArray) jsonObject.get(columnName);
				data = (JSONArray) jsonObject.get(rowName);
				Iterator<JSONObject> iterator = data.iterator();
			}

			// input data
			int cnt = 0;
			for (int idx = 0; idx < data.size(); idx++) {
				// data type mapping
				Spot value = mappingSpotData((JSONObject) data.get(idx), idx);
				if (value == null)
					continue;
				// TODO : test code erase
				// result.add(mappingSpotData((JSONObject) data.get(i)));
				mapper.insert(value);

				if (idx % 100 == 0)
					Thread.sleep(2000);
			}

			// end
			rd.close();
			conn.disconnect();

		} catch (Exception e)

		{
			e.printStackTrace();
		}

		return result;
	}

	private Spot mappingSpotData(JSONObject value, int id) {
		Spot spot = new Spot();

		// String[] columns = {"ȭ��Ǹ�", "category", "����", "���������θ��ּ�", "�����������ּ�",
		// "����ð�", "��ȭ��ȣ"};
		String defaultValue = "���� ������Ʈ..";
		Object lat = value.get("����");
		Object lng = value.get("�浵");

		// not valuable data
		if (lat == null || lng == null)
			return null;

		spot.setId(String.valueOf(id));
		spot.setName(value.get("ȭ��Ǹ�").toString());
		spot.setCategory_id("ȭ���");
		spot.setSubcategory_id(getJSONObjectValue(value.get("����").toString(), defaultValue));
		spot.setAddress1(getJSONObjectValue(value.get("���������θ��ּ�"), defaultValue));
		spot.setAddress2(getJSONObjectValue(value.get("�����������ּ�"), defaultValue));
		spot.setPhone(getJSONObjectValue(value.get("��ȭ��ȣ"), defaultValue));

		spot.setLat(Double.parseDouble(lat.toString()));
		spot.setLng(Double.parseDouble(lng.toString()));
		spot.setRegdate(new Date().toString());

		// TODO : all data insert and check null
		spot.setImage_id(defaultValue);
		spot.setAvg_rating("0.0");
		spot.setOphour(getJSONObjectValue(value.get("����ð�"), defaultValue));
		spot.setProperties(defaultValue);
		// TODO get login user id
		spot.setUser_id("admin");

		return spot;
	}

	private String getJSONObjectValue(Object value, String defaultValue) {
		return value == null ? defaultValue == null ? " " : defaultValue : value.toString();
	}
}
