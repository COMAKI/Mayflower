package com.mw.controller;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
	int cnt = 0;
	int world_cnt = 0;
	
	@RequestMapping("/requestAPI.mw")
	public void requestAPI(HttpServletRequest request, HttpServletResponse response) {
		if(cnt!=0)	world_cnt += cnt;
		else		world_cnt += 100;
		cnt = 0;
		response.setContentType("text/json; charset=EUC-KR");
		JSONObject jo = new JSONObject();
		// checkData exist
		HttpSession session = request.getSession();
		if(session.getAttribute("groupid").toString().equals("1")) {
			configData(new Spot());
			System.out.println("success");
			jo.put("status", "pass");
			jo.put("count", cnt);
		} else {
			jo.put("status", "fail");
		}
		try {
			PrintWriter out = response.getWriter();
			out.println(jo);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
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
		String maxCount = world_cnt+"2000";
		try {
			StringBuilder urlBuilder = new StringBuilder("http://api.data.go.kr/openapi/pblic-toilet-std"); /* URL */
			urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "="
					+ key); /* Service Key */
			urlBuilder.append("&" + URLEncoder.encode("s_page", "UTF-8") + "="
					+ URLEncoder.encode("1", "UTF-8")); /* 페이지 번호 */
			urlBuilder.append("&" + URLEncoder.encode("s_list", "UTF-8") + "="
					+ URLEncoder.encode(maxCount, "UTF-8")); /* 페이지 크기 */
			urlBuilder.append("&" + URLEncoder.encode("type", "UTF-8") + "="
					+ URLEncoder.encode(type, "UTF-8")); /* XML/JSON 여부 */
			URL url = new URL(urlBuilder.toString());

			// connect API
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");

			BufferedReader rd = null;
			JSONArray data = null;

			if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {

				resultCode = conn.getResponseCode();
				System.out.println("Response code: " + resultCode);

				rd = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));

				data = (JSONArray) new JSONParser().parse(rd.readLine());

				Iterator<JSONArray> iterator = data.iterator();
				ArrayList<Spot> list = new ArrayList<>();

			} 
//			else {
//				//// TODO default data input
//				rd = new BufferedReader(new InputStreamReader(new FileInputStream("data1.json"), "UTF8"));
//
//				JSONObject jsonObject = (JSONObject) new JSONParser().parse(rd);
//
//				// property setting
//				String columnName = "fields";
//				String rowName = "records";
//
//				// loop array
//				JSONArray columns = (JSONArray) jsonObject.get(columnName);
//				data = (JSONArray) jsonObject.get(rowName);
//				Iterator<JSONObject> iterator = data.iterator();
//			}

			// input data
			
			for (int idx = world_cnt; idx < data.size(); idx++) {
				// data type mapping
				Spot value = mappingSpotData((JSONObject) data.get(idx), idx);
				if (value == null)
					continue;
				if(mapper.select(value.getId())!=null) {
					continue;
				}
				// TODO : test code erase
				// result.add(mappingSpotData((JSONObject) data.get(i)));
				cnt++;
				mapper.insert(value);
				if (idx % 100 == 0)
					Thread.sleep(2000);
			}

			// end
			rd.close();
			conn.disconnect();

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(cnt);
		}

		return result;
	}

	private Spot mappingSpotData(JSONObject value, int id) {
		Spot spot = new Spot();

		// String[] columns = {"화장실명", "category", "구분", "소재지도로명주소", "소재지지번주소",
		// "개방시간", "전화번호"};
		String defaultValue = "추후 업데이트..";
		Object lat = value.get("위도");
		Object lng = value.get("경도");

		// not valuable data
		if (lat == null || lng == null)
			return null;

		spot.setId(String.valueOf(id));
		spot.setName(value.get("화장실명").toString());
		spot.setCategory_id("화장실");
		spot.setSubcategory_id(getJSONObjectValue(value.get("구분").toString(), defaultValue));
		spot.setAddress1(getJSONObjectValue(value.get("소재지도로명주소"), defaultValue));
		spot.setAddress2(getJSONObjectValue(value.get("소재지지번주소"), defaultValue));
		spot.setPhone(getJSONObjectValue(value.get("전화번호"), defaultValue));

		spot.setLat(Double.parseDouble(lat.toString()));
		spot.setLng(Double.parseDouble(lng.toString()));
		spot.setRegdate(new Date().toString());

		// TODO : all data insert and check null
		spot.setImage_id(defaultValue);
		spot.setAvg_rating("0.0");
		spot.setOphour(getJSONObjectValue(value.get("개방시간"), defaultValue));
		spot.setProperties(defaultValue);
		// TODO get login user id
		spot.setUser_id("admin");

		return spot;
	}

	private String getJSONObjectValue(Object value, String defaultValue) {
		return value == null ? defaultValue == null ? " " : defaultValue : value.toString();
	}
}
