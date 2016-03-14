package com.books.management.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;

import com.books.management.entity.BookOrderEntity;
import com.books.management.entity.BooksEntity;
import com.books.management.service.dao.BookManagementService;
import com.books.management.service.daoImpl.BookManagementServiceImpl;
import com.opensymphony.xwork2.ActionSupport;

public class BookOrderAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String bookId;
	private String bookname;
	private Double price;
	private Integer quantity;
	private Double totalAmount;
	private String address;
	private String paymentMode;
	BookManagementService bookManagementService;
	SessionAction sessionAction;
	List<BooksEntity> bookDetailsList= new ArrayList<BooksEntity>();
	//List<BookOrderEntity> bookOrderEntity = new ArrayList<BookOrderEntity>();
	private static Logger LOG= Logger.getLogger(BookOrderAction.class);
	public BookOrderAction(){
	 bookManagementService = new BookManagementServiceImpl();
	 sessionAction = new SessionAction();
	}
	
	public String orderBookdetails(){
		if(!sessionAction.isValidSession()){
			return "sessionError";
		}
		System.out.println("quantity value:::"+quantity);
		bookDetailsList=new ArrayList<BooksEntity>();
		bookDetailsList=null;
		bookDetailsList = bookManagementService.getBookDetailsById(id);
		bookManagementService = new BookManagementServiceImpl();
		for(BooksEntity book:bookDetailsList){
			if(quantity > book.getNumberOfbooks()){
				this.addActionMessage("Number of books available only:"+book.getNumberOfbooks());
				LOG.info("****Number of books availiable only*******:"+book.getNumberOfbooks());
				return "error";
			}else{
				BooksEntity booksEntity = new BooksEntity();
				booksEntity.setId(id);
				booksEntity.setNumberOfbooks(book.getNumberOfbooks()- quantity);
				bookManagementService.updateBookStock(booksEntity);
				/*Adding Sales details*/
				BookOrderEntity bookOrderEntity = new BookOrderEntity();
				sessionAction.getUsernameBySession();
				bookOrderEntity.setUserName(sessionAction.getUsernameBySession());
				bookOrderEntity.setAddress(address);
				bookOrderEntity.setBookId(bookId);
				bookOrderEntity.setBookname(bookname);
				bookOrderEntity.setPaymentMode(paymentMode);
				bookOrderEntity.setPrice(price);
				bookOrderEntity.setQuantity(quantity);
				bookOrderEntity.setTotalAmount(totalAmount);
				bookOrderEntity.setCreatedDate(new Date());
				bookOrderEntity.setModifiedDate(new Date());
				bookManagementService.addBookOrderDetails(bookOrderEntity);
				//this.addActionMessage("Book ordered details added successfully");
				return "success";
			}
		}
		return "success";
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

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public Double getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(Double totalAmount) {
		this.totalAmount = totalAmount;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPaymentMode() {
		return paymentMode;
	}

	public void setPaymentMode(String paymentMode) {
		this.paymentMode = paymentMode;
	}

	public BookManagementService getBookManagementService() {
		return bookManagementService;
	}

	public void setBookManagementService(BookManagementService bookManagementService) {
		this.bookManagementService = bookManagementService;
	}

	public SessionAction getSessionAction() {
		return sessionAction;
	}

	public void setSessionAction(SessionAction sessionAction) {
		this.sessionAction = sessionAction;
	}

	public List<BooksEntity> getBookDetailsList() {
		return bookDetailsList;
	}

	public void setBookDetailsList(List<BooksEntity> bookDetailsList) {
		this.bookDetailsList = bookDetailsList;
	}



	
}
