package com.books.management.action;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;

import com.books.management.entity.BooksEntity;
import com.books.management.service.dao.BookManagementService;
import com.books.management.service.daoImpl.BookManagementServiceImpl;
import com.opensymphony.xwork2.ActionSupport;

public class BookCategoryAction extends ActionSupport{
/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

BookManagementService bookManagementService;
private String bookname;
private String category;
private String year;
private String id;
List<BooksEntity> bookDetailsList= new ArrayList<BooksEntity>();
	
	private static Logger LOG= Logger.getLogger(BookAction.class);
	
	public BookCategoryAction(){
		bookManagementService = new BookManagementServiceImpl();
	}
	public String getAllBookDetails(){
		bookDetailsList = bookManagementService.getBookDetailsList();
		if(bookDetailsList == null || bookDetailsList.size() ==0){
			this.addActionMessage("BookDetails list empty");
		}
		return "success";
	}
	public String getBookByName(){
		bookDetailsList = bookManagementService.getBookDetailsByName(bookname);
		if(bookDetailsList == null || bookDetailsList.size() ==0){
			this.addActionMessage("BookDetails list empty");
		}
		return "success";
	}
	public String getBookByCategory(){
		bookDetailsList = bookManagementService.getBookDetailsByCategory(category);
		if(bookDetailsList == null || bookDetailsList.size() ==0){
			this.addActionMessage("BookDetails list empty");
		}
		return "success";
	}
	public String getBookByYear(){
		bookDetailsList = bookManagementService.getBookDetailsByYear(year);
		if(bookDetailsList == null || bookDetailsList.size() ==0){
			this.addActionMessage("BookDetails list empty");
		}
		return "success";
	}
	public String getBookCategoryByYear(){
		bookDetailsList = bookManagementService.getBooksCategoryByYear(category, year);
		if(bookDetailsList == null || bookDetailsList.size() ==0){
			this.addActionMessage("BookDetails list empty");
		}
		return "success";
	}
	 
	public String getBuyBook(){
		LOG.info("******************************************");
		LOG.info("book id:::::"+getId());
		bookDetailsList=new ArrayList<BooksEntity>();
		bookDetailsList=null;
		//bookDetailsList = bookManagementService.getBookDetailsById(id);
		if(bookDetailsList == null || bookDetailsList.size() ==0){
			this.addActionMessage("BookDetails list empty");
		}
		return "success";
	}
	public List<BooksEntity> getBookDetailsList() {
		return bookDetailsList;
	}
	public void setBookDetailsList(List<BooksEntity> bookDetailsList) {
		this.bookDetailsList = bookDetailsList;
	}
	public String getBookname() {
		return bookname;
	}
	public void setBookname(String bookname) {
		this.bookname = bookname;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
}
