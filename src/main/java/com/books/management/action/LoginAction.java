package com.books.management.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;

import com.books.management.constants.BookManagementConstants;
import com.books.management.entity.BooksEntity;
import com.books.management.service.dao.BookManagementService;
import com.books.management.service.daoImpl.BookManagementServiceImpl;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport implements SessionAware {
	private static final long serialVersionUID = 1L;
	private String username;
	private String password;
	
	private BookManagementService bookManagementService;
	
	private static Logger LOG = Logger.getLogger(LoginAction.class);
	HttpServletRequest request = ServletActionContext.getRequest();
	SessionMap<String, String> sessionmap;
	List<BooksEntity> bookDetailsList= new ArrayList<BooksEntity>();

	public LoginAction() {
		bookManagementService = new BookManagementServiceImpl();
	}

	@Override
	public String execute() {
		LOG.info("****USN:****"+getUsername());
		LOG.info("*****PASSWORD****"+getPassword());

		int userType = 0;
		if (getUsername() != null && getPassword() != null) {
			userType = bookManagementService.validateUser(username.toUpperCase(),password);
		}else{
			return "error";
		}
		if (userType == BookManagementConstants.IS_ADMIN) {
			sessionmap.put("login", "true");
			sessionmap.put("username", username);
			return "adminsuccess";
		} else if (userType == BookManagementConstants.IS_USER) {
			sessionmap.put("login", "true");
			sessionmap.put("username", username);
			bookDetailsList = bookManagementService.getBookDetailsList();
			return "userSuccess";
		}
		else {
			this.addActionMessage("Invalid usn or password");
			return "error";
		}
	}
	public SessionMap<String, String> getSessionmap() {
		return sessionmap;
	}

	public void setSessionmap(SessionMap<String, String> sessionmap) {
		this.sessionmap = sessionmap;
	}


	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public void setSession(Map map) {
		sessionmap = (SessionMap) map;
		sessionmap.put("login", "true");
	}

	public List<BooksEntity> getBookDetailsList() {
		return bookDetailsList;
	}

	public void setBookDetailsList(List<BooksEntity> bookDetailsList) {
		this.bookDetailsList = bookDetailsList;
	}
}
