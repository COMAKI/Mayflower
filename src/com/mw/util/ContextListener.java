package com.mw.util;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import org.springframework.beans.factory.annotation.Autowired;

@WebListener
public class ContextListener implements ServletContextListener {
	// ���ø����̼� ����� �ڵ����� ����ǵ��� ����

	/// �� �����̳ʰ� ó�� ������ �� ����Ǵ� �޼ҵ�
	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		// TODO db table create , insert data.go.kr API into DB

		System.out.println("run context");

	}

	// �� �����̳ʰ� ����� �� ����Ǵ� �޼ҵ�
	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO truncate and drop table from DB
		System.out.println("destroy context");
	}

}
