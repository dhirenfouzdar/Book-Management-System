package com.books.management.action;

import org.apache.log4j.Logger;

import com.books.management.service.dao.BookManagementService;
import com.books.management.service.daoImpl.BookManagementServiceImpl;
import com.opensymphony.xwork2.ActionSupport;

public class ForgotPasswordAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String username;
	private String newPassword;
    BookManagementService bookManagementService;
	
	private static Logger LOG= Logger.getLogger(ForgotPasswordAction.class);
	
	public ForgotPasswordAction(){
		bookManagementService = new BookManagementServiceImpl();
	}
	public String validateUsername(){
		  if(bookManagementService.isUsernameExists(username)){
			  bookManagementService.resetPassword(username, newPassword);
			  this.addActionMessage("Password updated successfully");
			  LOG.info("**Password updated successfully**");
			  return "success";
		  }else{
			  LOG.info("**username invalid**");
			  this.addActionMessage("Username not valid !");
			  return "error";
		  }
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getNewPassword() {
		return newPassword;
	}
	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}
	
	

}
