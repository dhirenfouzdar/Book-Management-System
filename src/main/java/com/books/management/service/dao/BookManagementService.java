package com.books.management.service.dao;

import java.util.List;

import com.books.management.entity.BookOrderEntity;
import com.books.management.entity.BooksEntity;
import com.books.management.entity.UserEntity;

public interface BookManagementService {
	public int validateUser(String usn,String password);
	public boolean isUsernameExists(String username);
	public boolean isEmailExists(String emailId);
	public boolean isMobileNumberExists(String mobileNumber);
	public void registerNewUser(UserEntity userEntity);
	public void resetPassword(String username,String password);
	public void addBookDetails(BooksEntity booksEntity);
	public boolean isBookIdExists(String bookId);
	public List<BooksEntity> getBookDetailsList();
	public void updateBookDetails(BooksEntity booksEntity);
	public void deleteBookById(Integer id);
	public Integer getIdByUsername(String username);
	public boolean isCurrentPasswordValid(String username,String password);
	public void resetPassword(Integer id,String newPassword);
	public List<BooksEntity> getBookDetailsByCategory(String category);
	public List<BooksEntity> getBookDetailsByYear(String year);
	public List<BooksEntity> getBookDetailsByName(String bookname);
	public List<BooksEntity> getBooksCategoryByYear(String category,String year);
	public List<BooksEntity> getBookDetailsById(Integer id);
	public void updateBookStock(BooksEntity booksEntity);
	public void addBookOrderDetails(BookOrderEntity bookOrderEntity);
	public List<BookOrderEntity> getDisplaySalesDetails();
	public List<BooksEntity> getOutOfStockList();
	public List<BooksEntity> getStockDetailsList();
	public List<BookOrderEntity> getpurchaseList(String userName);

}
