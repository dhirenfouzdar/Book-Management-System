package com.books.management.action;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.criterion.DetachedCriteria;

import com.books.management.entity.BookOrderEntity;
import com.books.management.entity.BooksEntity;
import com.books.management.service.dao.BookManagementService;
import com.books.management.service.daoImpl.BookManagementServiceImpl;
import com.opensymphony.xwork2.ActionSupport;

public class JqGridDisplayAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer rows;
	private Integer page;
	private String sord;
	private String sidx;
	private String searchField;
	private String searchString;
	private String searchOper;
	private Integer total;
	private Integer records;
	private String branch;
	private String year;
	private String yearOfPassing;
	private String graduationType;
	SessionAction sessionAction;
	List<BooksEntity> booksList = new ArrayList<BooksEntity>();
	List<BookOrderEntity> salesDetailsList = new ArrayList<BookOrderEntity>();
	List<BooksEntity> outOffStockList = new ArrayList<BooksEntity>();
	List<BookOrderEntity> purchaseDetailsList = new ArrayList<BookOrderEntity>();
	BookManagementService bookManagementService;
	private static Logger LOG = Logger.getLogger(JqGridDisplayAction.class);
	public JqGridDisplayAction() {
		sessionAction = new SessionAction();
		this.rows = 0;
		this.page = 0;
		this.sord = "asc";
		this.total = 0;
		this.records = 0;
		bookManagementService = new BookManagementServiceImpl();
	}

	public String execute() throws Exception {
		return SUCCESS;
	}

	
	@SuppressWarnings("unused")
	public String getBookDetailsList(){
		LOG.info("****************Getting logs in books list in jqgrid:********");
		booksList=null;
		
		try {
			int to = (rows * page);
			int from = to - rows;
			DetachedCriteria criteria = DetachedCriteria
					.forClass(BooksEntity.class);
			criteria.setProjection(null);
			criteria.setResultTransformer(Criteria.ROOT_ENTITY);
			booksList = bookManagementService.getStockDetailsList();
			LOG.info("booksList size :::" +booksList.size());
			if(booksList != null && booksList.size() != 0){
			records = booksList.size();
			total = (int) Math.ceil((double) records / (double) rows);
			LOG.info("size::" + booksList.size());
			}
		} catch (Throwable e) {
			// System.out.println("Runtime Error::");
			LOG.error("Exception occurred while displaying branch JqGrid{}", e);
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	public String getOrderList() {
		if(!sessionAction.isValidSession()){
			return "sessionError";
		}
		salesDetailsList = bookManagementService.getDisplaySalesDetails();
		if(salesDetailsList == null || salesDetailsList.size() <=0){
			this.addActionMessage("no records found");
			return "error";
		}
			
		return "success";
	}
	public String getBooksOutList(){
		if(!sessionAction.isValidSession()){
			return "sessionError";
		}
		outOffStockList =  bookManagementService.getOutOfStockList();
		if(outOffStockList == null || outOffStockList.size() <=0){
			this.addActionMessage("no records found");
			return "error";
		}
		return "success";
	}
	
	public String getUserSalesData(){
		if(!sessionAction.isValidSession()){
			return "sessionError";
		}
		purchaseDetailsList =  bookManagementService.getpurchaseList(sessionAction.getUsernameBySession());
		if(purchaseDetailsList == null || purchaseDetailsList.size() <=0){
			this.addActionMessage("no records found");
			return "error";
		}
		return "success";
	}

	public Integer getRows() {
		return rows;
	}

	public void setRows(Integer rows) {
		this.rows = rows;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public String getSord() {
		return sord;
	}

	public void setSord(String sord) {
		this.sord = sord;
	}

	public String getSidx() {
		return sidx;
	}

	public void setSidx(String sidx) {
		this.sidx = sidx;
	}

	public String getSearchField() {
		return searchField;
	}

	public void setSearchField(String searchField) {
		this.searchField = searchField;
	}

	public String getSearchString() {
		return searchString;
	}

	public void setSearchString(String searchString) {
		this.searchString = searchString;
	}

	public String getSearchOper() {
		return searchOper;
	}

	public void setSearchOper(String searchOper) {
		this.searchOper = searchOper;
	}

	public Integer getTotal() {
		return total;
	}

	public void setTotal(Integer total) {
		this.total = total;
	}

	public Integer getRecords() {
		return records;
	}

	public void setRecords(Integer records) {
		this.records = records;
	}

	public String getBranch() {
		return branch;
	}

	public void setBranch(String branch) {
		this.branch = branch;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getYearOfPassing() {
		return yearOfPassing;
	}

	public void setYearOfPassing(String yearOfPassing) {
		this.yearOfPassing = yearOfPassing;
	}


	public String getGraduationType() {
		return graduationType;
	}

	public void setGraduationType(String graduationType) {
		this.graduationType = graduationType;
	}

	public List<BooksEntity> getBooksList() {
		return booksList;
	}

	public void setBooksList(List<BooksEntity> booksList) {
		this.booksList = booksList;
	}

	public SessionAction getSessionAction() {
		return sessionAction;
	}

	public void setSessionAction(SessionAction sessionAction) {
		this.sessionAction = sessionAction;
	}

	public BookManagementService getBookManagementService() {
		return bookManagementService;
	}

	public void setBookManagementService(BookManagementService bookManagementService) {
		this.bookManagementService = bookManagementService;
	}

	public List<BookOrderEntity> getSalesDetailsList() {
		return salesDetailsList;
	}

	public void setSalesDetailsList(List<BookOrderEntity> salesDetailsList) {
		this.salesDetailsList = salesDetailsList;
	}

	public void setOutOffStockList(List<BooksEntity> outOffStockList) {
		this.outOffStockList = outOffStockList;
	}

	public List<BooksEntity> getOutOffStockList() {
		return outOffStockList;
	}

	public List<BookOrderEntity> getPurchaseDetailsList() {
		return purchaseDetailsList;
	}

	public void setPurchaseDetailsList(List<BookOrderEntity> purchaseDetailsList) {
		this.purchaseDetailsList = purchaseDetailsList;
	}
	

}
