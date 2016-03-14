package com.books.management.action;

import java.util.Date;

import org.apache.log4j.Logger;

import com.books.management.constants.BookManagementConstants;
import com.books.management.entity.BooksEntity;
import com.books.management.service.dao.BookManagementService;
import com.books.management.service.daoImpl.BookManagementServiceImpl;
import com.opensymphony.xwork2.ActionSupport;

public class BookAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String bookId;
	private String bookname;
	private String category;
	private String author;
	private Double price;
	private Integer numberOfbooks;
	private String publishedDate;
	private String oper;
	BookManagementService bookManagementService;
	
	private static Logger LOG= Logger.getLogger(BookAction.class);
	
	public BookAction(){
		bookManagementService = new BookManagementServiceImpl();
	}
	
	/*@Override
	public void validate() {
		if (bookManagementService.isBookIdExists(bookId)){
			addActionMessage("Book ISBN already exists !");
			isValidationSuccess=false;
		}
	}*/

	
	@SuppressWarnings("deprecation")
	public String addBookDetails(){
		if (bookManagementService.isBookIdExists(bookId)){
			addActionMessage("Book ISBN already exists !");
			return "error";
		}
		if(price != null){
		System.out.println("Category:::::"+getCategory());
		BooksEntity booksEntity = new BooksEntity();
		booksEntity.setAuthor(author);
		booksEntity.setBookId(bookId);
		booksEntity.setBookname(bookname);
		booksEntity.setCategory(category);
		booksEntity.setNumberOfbooks(numberOfbooks);
		booksEntity.setPrice(price);
		booksEntity.setPublishedDate(publishedDate);
		booksEntity.setCreatedDate(new Date());
		booksEntity.setModifiedDate(new Date());
		bookManagementService.addBookDetails(booksEntity);
		this.addActionMessage("Book Details added successfully");
		return "success";
		}else{
			return "error";
		}
	}
	
	@SuppressWarnings("deprecation")
	public String updateBookDetails(){
		try {
			System.out.println("=====oper value ====="+ getOper());
			if (oper.equalsIgnoreCase(BookManagementConstants.GRID_EDIT)) {
				BooksEntity booksEntity = new BooksEntity();
				booksEntity.setId(id);
				booksEntity.setAuthor(author);
				booksEntity.setBookId(bookId);
				booksEntity.setBookname(bookname);
				booksEntity.setCategory(category);
				booksEntity.setNumberOfbooks(numberOfbooks);
				booksEntity.setPrice(price);
				booksEntity.setPublishedDate(publishedDate);
				booksEntity.setModifiedDate(new Date());
				bookManagementService.updateBookDetails(booksEntity);
				this.addActionMessage("User Details Updated Successfully.!");
				LOG.info("***book details updated successfully  ***");
			}
			else if(oper.equalsIgnoreCase(BookManagementConstants.GRID_DELETE)){
				System.out.println("======oper value ===="+getOper());
				bookManagementService.deleteBookById(id);
				this.addActionMessage("Deleted book details successfully");
				LOG.info("*** book details deleted successfully **");
			}
			} catch (Exception e) {
				LOG.error("Error while editing branch details ::" + e);
			}
		return "success";
	}
	public BookManagementService getBookManagementService() {
		return bookManagementService;
	}

	public void setBookManagementService(BookManagementService bookManagementService) {
		this.bookManagementService = bookManagementService;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getBookId() {
		return bookId;
	}
	public void setBookId(String bookId) {
		this.bookId = bookId;
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
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	
	public Integer getNumberOfbooks() {
		return numberOfbooks;
	}

	public void setNumberOfbooks(Integer numberOfbooks) {
		this.numberOfbooks = numberOfbooks;
	}

	public String getPublishedDate() {
		return publishedDate;
	}

	public void setPublishedDate(String publishedDate) {
		this.publishedDate = publishedDate;
	}

	public String getOper() {
		return oper;
	}

	public void setOper(String oper) {
		this.oper = oper;
	}
}
