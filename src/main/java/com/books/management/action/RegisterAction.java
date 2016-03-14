package com.books.management.action;

import java.util.Date;

import org.apache.log4j.Logger;

import com.books.management.constants.BookManagementConstants;
import com.books.management.entity.UserEntity;
import com.books.management.service.dao.BookManagementService;
import com.books.management.service.daoImpl.BookManagementServiceImpl;
import com.opensymphony.xwork2.ActionSupport;

public class RegisterAction extends ActionSupport {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String username;
	private String password;
	private String emailId;
	private String name;
	private String mobilenumber;
	private String gender;
	private boolean isValidationSuccess;
	BookManagementService bookManagementService;
	
	private static Logger LOG = Logger.getLogger(RegisterAction.class);
	
	public RegisterAction(){
		bookManagementService = new BookManagementServiceImpl();
		isValidationSuccess=true;
	}
	@Override
	public void validate() {
		if (bookManagementService.isEmailExists(getEmailId())){
			addActionMessage("EmailId Already Exists");
			isValidationSuccess=false;
		}
		if (bookManagementService.isMobileNumberExists(getMobilenumber())){
			addActionMessage("MobileNumber Already Exists");
			isValidationSuccess=false;
		}
		if (bookManagementService.isUsernameExists(getUsername())){
			addActionMessage("Username already exists!");
			isValidationSuccess=false;
		}
	}

	public String userRegister(){
		if(isValidationSuccess){
		UserEntity userEntity = new UserEntity();
		userEntity.setEmailId(emailId);
		userEntity.setGender(gender);
		userEntity.setUsername(username);
		userEntity.setPassword(password);
		userEntity.setMobilenumber(mobilenumber);
		userEntity.setName(name);
		userEntity.setUsertype(BookManagementConstants.USER);
		userEntity.setCreatedDate(new Date());
		userEntity.setModifiedDate(new Date());
		bookManagementService.registerNewUser(userEntity);
		this.addActionMessage("User registered successfully");
		LOG.info("**Suceessfully registerd user***");
		return "success";
		}else{
			return "error";
		}
		
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

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public String getMobilenumber() {
		return mobilenumber;
	}

	public void setMobilenumber(String mobilenumber) {
		this.mobilenumber = mobilenumber;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
}
