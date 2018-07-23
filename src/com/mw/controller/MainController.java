package com.mw.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.URL;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mw.frame.Service;
import com.mw.vo.Spot;
import com.mw.vo.User;


@Controller
public class MainController {
	
	@RequestMapping("/main.mw")
	public String main() {
		System.out.println("received a main.mw");
		return "main"; // main.jsp
	}
	
	@RequestMapping("/weather.mw")
	public ModelAndView weather() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("main");
		mv.addObject("centerpage", "weather");
		return mv; // login.jsp
	}
	
	@RequestMapping("/weatherimpl.mw")
	@ResponseBody
	public void weatherimpl(HttpServletResponse response) throws IOException {
		response.setContentType("text/xml;charset=euc-kr");
		PrintWriter out = response.getWriter();
		
		// Yahoo 날씨 정보 요청
		String str = "https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22seoul%22)%20%20and%20u%3D%27c%27&format=xml&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys";
		URL url = new URL(str);
		InputStreamReader isr = new InputStreamReader(url.openStream(),"UTF-8");
		BufferedReader br = new BufferedReader(isr); // buffer에 Line을 넣고 처리
		
		StringBuffer sb = new StringBuffer();
		String temp = null;
		while(true) {
			temp = br.readLine();
			if(temp==null) {
				break;
			}
			sb.append(temp);
		}
		
		out.println(sb.toString());
		br.close();
		out.close();
	}
}
