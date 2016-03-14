package com.books.management.action;


	import javax.servlet.http.HttpServletRequest;

	import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.SessionMap;

import com.books.management.service.dao.BookManagementService;
import com.books.management.service.daoImpl.BookManagementServiceImpl;
import com.opensymphony.xwork2.ActionSupport;

import org.apache.log4j.Logger;

	public class ResetPasswordAction extends ActionSupport  {

		/**
		 * 
		 */
		private static final long serialVersionUID = 1L;
		private String currentPassword;
		private String newPassword;
		private String confirmPassword;
		SessionAction sessionAction;
		BookManagementService bookManagementService;
		private static Logger LOG = Logger.getLogger(ResetPasswordAction.class);

		HttpServletRequest request = ServletActionContext.getRequest();
		SessionMap<String, String> sessionmap;

		public ResetPasswordAction() {
			sessionAction = new SessionAction();
			bookManagementService = new BookManagementServiceImpl();
		}
		public String execute() {
			return "success";
		}


		public String updatenewpassword() {
			String username= sessionAction.getUsernameBySession();
			LOG.info("empId :: " + username);
			LOG.info("Current password::"+currentPassword);
			if (!bookManagementService.isCurrentPasswordValid(username, currentPassword)){
				this.addActionMessage("Invalid current password");
				return "error";
			}
			Integer id = bookManagementService.getIdByUsername(username);
			bookManagementService.resetPassword(id, newPassword);
			this.addActionMessage("Password Updated Successfully");
			LOG.info("**Password updated successfully**");
			return "success";
		}

		public String getCurrentPassword() {
			return currentPassword;
		}

		public void setCurrentPassword(String currentPassword) {
			this.currentPassword = currentPassword;
		}

		public String getNewPassword() {
			return newPassword;
		}

		public void setNewPassword(String newPassword) {
			this.newPassword = newPassword;
		}

		public String getConfirmPassword() {
			return confirmPassword;
		}

		public void setConfirmPassword(String confirmPassword) {
			this.confirmPassword = confirmPassword;
		}

		public SessionMap<String, String> getSessionmap() {
			return sessionmap;
		}

		public void setSessionmap(SessionMap<String, String> sessionmap) {
			this.sessionmap = sessionmap;
		}
		
	}


