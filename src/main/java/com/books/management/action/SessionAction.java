package com.books.management.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.log4j.Logger;

public class SessionAction {
	private static Logger LOG = Logger.getLogger(SessionAction.class);

	public boolean isValidSession() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();

		String s = (String) session.getAttribute("login");
		String username = (String) session.getAttribute("username");
		LOG.info("session value :: " + s);
		LOG.info("session username value :: " + username);
		if (s != null && username != null) {
			return true;
		} else {
			return false;
		}
	}
	
	public String getUsernameBySession() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();

		String s = (String) session.getAttribute("login");
		String username = (String) session.getAttribute("username");
		LOG.info("session value :: " + s);
		LOG.info("session username value :: " + username);
		if (s != null && username != null) {
			return username;
		} else {
			return null;
		}
	}

}
