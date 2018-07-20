package com.mw.util;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import org.springframework.beans.factory.annotation.Autowired;

@WebListener
public class ContextListener implements ServletContextListener {
	// 어플리케이션 실행시 자동으로 실행되도록 지정

	/// 웹 컨테이너가 처음 구동될 때 실행되는 메소드
	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		// TODO db table create , insert data.go.kr API into DB

		System.out.println("run context");

	}

	// 웹 컨테이너가 종료될 때 실행되는 메소드
	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO truncate and drop table from DB
		System.out.println("destroy context");
	}

}
