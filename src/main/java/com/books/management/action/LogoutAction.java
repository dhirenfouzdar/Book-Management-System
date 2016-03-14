package com.books.management.action;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import org.apache.log4j.Logger;

public class LogoutAction extends ActionSupport {

	private static Logger LOG = Logger.getLogger(LogoutAction.class);

	private static final long serialVersionUID = 1L;

	@SuppressWarnings("rawtypes")
	public String execute() {
		Map session = ActionContext.getContext().getSession();
		String login = (String) session.get("login");
		String username = (String) session.get("username");
		LOG.info("logout session values::" + login);
		LOG.info("logout session username::" + username);
		session.remove("login");
		session.remove("username");
		return "success";
	}
	@SuppressWarnings("rawtypes")
	public void logoutManually(){
		Map session = ActionContext.getContext().getSession();
		String login = (String) session.get("login");
		String username = (String) session.get("username");
		LOG.info("logout session values::" + login);
		LOG.info("logout session username::" + username);
		session.remove("login");
		session.remove("username");
		
	}
	
	
}