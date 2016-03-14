package com.books.management.service.daoImpl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.books.management.entity.BookOrderEntity;
import com.books.management.entity.BooksEntity;
import com.books.management.entity.UserEntity;
import com.books.management.listener.HibernateListener;
import com.books.management.service.dao.BookManagementService;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 * (C) SVARKS corporation
 *
 * File: AIMSServiceDaoImpl.java
 *Project Title: Books Management System
 * @version: 1.0 
 * Purpose: To facilitate the automation of Books Managament
 * @author: Rajesh K 
 * Start Date: 23-08-2015
 * End Date: 
 * Limitations: 
 * Bug Id: 
 * Changes: 
 * Changed by: 
 * Changed on:
 *
 */

public class BookManagementServiceImpl implements BookManagementService{
	private static Logger LOG = Logger.getLogger(BookManagementServiceImpl.class);
	private Session session = HibernateListener.getSessionFactory()
			.openSession();
	Transaction transaction = null;

	@Override
	public int validateUser(String username, String password) {
		

		LOG.info("Getting into validateUser method in DAOImpl");
		LOG.info("****USN:****"+username);
		try {
			transaction = session.beginTransaction();
			Query query = session
					.createQuery("from UserEntity u where u.username = :username  and u.password = :pass");
			query.setParameter("username", username);
			query.setParameter("pass", password);
			LOG.info(query);
			@SuppressWarnings("unchecked")
			List<UserEntity> userlist = query.list();
			if (userlist.size() > 0) {
				for (UserEntity userEntity : userlist) {
					if (userEntity.getUsertype().equals("admin"))
						return 1;
					else
						return 2;
				}
			}
			return 0;
		} catch (Exception e) {
			LOG.error("Exception while validating username and password:" + e);
			return 0;
		} 
	}

	@SuppressWarnings("unchecked")
	@Override
	public boolean isUsernameExists(String username) {
		LOG.info("Getting into isUsnExistsInUserEntity method in DAOImpl");
		List<UserEntity> list = null;
		try {
			transaction = session.beginTransaction();
			Query query = session.createQuery("from UserEntity u where u.username = :username");
			query.setParameter("username", username);
			list = query.list();
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null)
				transaction.rollback();
			LOG.error("Exception occured while searching USN :" + e);
		} 
		if (list.size() > 0)
			return true;
		else
			return false;
	}

	@SuppressWarnings("unchecked")
	@Override
	public boolean isEmailExists(String emailId) {
		LOG.info("Getting into isEmailExists method in DAOImpl");
		List<UserEntity> list = null;
		try {
			transaction = session.beginTransaction();
			Query query = session.createQuery("from UserEntity s where s.emailId = :email");
			query.setParameter("email", emailId);
			list = query.list();
			transaction.commit();
			if (list.size() > 0)
				return true;
			else
				return false;
		} catch (Exception e) {
			if (transaction != null)
				transaction.rollback();
			LOG.error("Exception occured in updateStudent:" + e);
			return false;
		} 
	}

	@SuppressWarnings("unchecked")
	@Override
	public boolean isMobileNumberExists(String mobileNumber) {
		LOG.info("Getting into isMobileNumberExists method in DAOImpl");
		try {
			transaction = session.beginTransaction();
			Query query = session.createQuery("from UserEntity s where s.mobilenumber = :mobileNum");
			query.setParameter("mobileNum", mobileNumber);
			List<UserEntity> list = query.list();
			transaction.commit();
			if (list.size() > 0)
				return true;
			else
				return false;
		} catch (Exception e) {
			if (transaction != null)
				transaction.rollback();
			LOG.error("Exception occured in updateStudent:" + e);
			return false;
		} 
	}

	@Override
	public void registerNewUser(UserEntity userEntity) {
		try {
			transaction = session.beginTransaction();
			session.save(userEntity);
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null)
				transaction.rollback();
			LOG.error("Exception while registering new details:" + e);
		}
		
	}

	@Override
	public void resetPassword(String username, String password) {
		LOG.info("Getting into resetPassword method in DAOImpl");
		try {
			LOG.info("Updating password..");
			transaction = session.beginTransaction();
			UserEntity userEntity = (UserEntity) session.get(UserEntity.class,username);
			if (userEntity != null) {
				userEntity.setPassword(password);
				session.update(userEntity);
				LOG.info("Password Updated Successfully:");
				transaction.commit();
			}
		}catch (Exception e) {
			if (transaction != null)
				transaction.rollback();
			LOG.error("Exception occured in updateStudent ::" + e);
		}
		
	}

	@Override
	public void addBookDetails(BooksEntity booksEntity) {
		try {
			   transaction = session.beginTransaction();
			   session.save(booksEntity);
			   transaction.commit();
			  } catch (Exception e) {
			   if (transaction != null)
			    transaction.rollback();
			   LOG.error("Exception while adding book details:" + e);
			  }
		
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public boolean isBookIdExists(String bookId) {
		LOG.info("Getting into isBookIdExists method in DAOImpl");
		try {
			transaction = session.beginTransaction();
			Query query = session.createQuery("from BooksEntity b where b.bookId = :bookId");
			query.setParameter("bookId", bookId);
			List<UserEntity> list = query.list();
			transaction.commit();
			if (list.size() > 0)
				return true;
			else
				return false;
		} catch (Exception e) {
			LOG.error("Exception occured is book exists:" + e);
			return false;
		} 
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<BooksEntity> getBookDetailsList() {
		List<BooksEntity> booksEntityList = null;
		try {
			transaction = session.beginTransaction();
			Query query = session.createQuery("from BooksEntity b where b.numberOfbooks > 0 order by b.category");
			booksEntityList = query.list();
		} catch (Exception e) {
			if (transaction != null)
				transaction.rollback();
			LOG.error("Exception while Getting branch details:" + e);
		}
		return booksEntityList;
	}

	@Override
	public void updateBookDetails(BooksEntity booksEntity) {
		LOG.info("Getting info updating book details");
		try {
			LOG.info("Admin updating Company Profile");
			transaction = session.beginTransaction();
			BooksEntity book = (BooksEntity) session.get(BooksEntity.class, booksEntity.getId());
			LOG.info("**Emp Id updating***" + book.getId());
			if (book != null) {
				
				book.setAuthor(booksEntity.getAuthor());
				book.setBookId(booksEntity.getBookId());
				book.setBookname(booksEntity.getBookname());
				book.setCategory(booksEntity.getCategory());
				book.setNumberOfbooks(booksEntity.getNumberOfbooks());
				book.setPrice(booksEntity.getPrice());
				book.setPublishedDate(booksEntity.getPublishedDate());
				book.setModifiedDate(new Date());
				session.update(book);
				transaction.commit();
				LOG.info("User Details Updated Successfully for:"+book.getId());

			}
		}catch (Exception e) {
			/*if(transaction != null)
				transaction.rollback();*/
			LOG.error("Exception occured in updating book details ::" + e);
		}
		
	}

	@Override
	public void deleteBookById(Integer id) {
		LOG.info("Deleting book details by id::"+id);
		try {
			transaction = session.beginTransaction();
			BooksEntity bookEntity = (BooksEntity) session.get(
					BooksEntity.class, id);
			if (bookEntity != null) {
				session.delete(bookEntity);
				LOG.info("**Deleted book successfully::**" + bookEntity.getBookId());
				transaction.commit();
			}
		}catch (Exception e) {
			if(transaction != null)
				transaction.commit();
			LOG.error("Exception occured in deleting book by id::" + e);
		}
		
	}

	@Override
	public Integer getIdByUsername(String username) {
		LOG.info("Getting into getIdByUsername method in DAOImpl");
	    try{
	  	  transaction = session.beginTransaction();
	  	  Query query = session.createQuery("from UserEntity u where u.username = :username");
			query.setParameter("username", username);
		@SuppressWarnings("unchecked")
		List<UserEntity> list = query.list();
		transaction.commit();
		if (list.size() > 0) {
			LOG.info("Getting Id by empId id::"+list.get(0).getId());
			return list.get(0).getId();
		} else
			return null;
	    }catch (Exception e) {
			LOG.error("Exception while finding empId Id ::" + e);
			return null;
		}
	}

	@Override
	public boolean isCurrentPasswordValid(String username, String password) {
		LOG.info("Getting into validatePassword method in DAOImpl");
		try {
			transaction = session.beginTransaction();
			Query query = session.createQuery("from UserEntity u where u.username = :username  and u.password = :pass");
			query.setParameter("username", username);
			query.setParameter("pass", password);
			LOG.info(query);
			@SuppressWarnings("unchecked")
			List<UserEntity> list = query.list();
		if (list.size() > 0) {
			LOG.info("Old password matches");
			return true;
		} else{
			LOG.info("Old password not matched");
			return false;
		}
		} catch (Exception e) {
			LOG.error("Exception occured while checking current password valid ::" + e);
		}
		return false;
	}

	@Override
	public void resetPassword(Integer id, String newPassword) {
		LOG.info("Getting into resetPassword method in DAOImpl");
		try {
			LOG.info("Updating password..");
			transaction = session.beginTransaction();
			UserEntity userEntity = (UserEntity) session.get(UserEntity.class,id);
			if (userEntity != null) {
				userEntity.setPassword(newPassword);
				session.update(userEntity);
				LOG.info("Password Updated Successfully:");
				transaction.commit();
			}
		}catch (Exception e) {
			if (transaction != null)
				transaction.rollback();
			LOG.error("Exception occured in update password ::" + e);
		}
		
	}

	@Override
	public List<BooksEntity> getBookDetailsByCategory(String category) {
		List<BooksEntity> booksEntityList = null;
		try {
			transaction = session.beginTransaction();
			Query query = session.createQuery("from BooksEntity b where b.category=:category");
			query.setParameter("category", category);
			booksEntityList = query.list();
		} catch (Exception e) {
			if (transaction != null)
				transaction.rollback();
			LOG.error("Exception while Getting branch details:" + e);
		}
		return booksEntityList;
	}

	@Override
	public List<BooksEntity> getBookDetailsByYear(String year) {
		List<BooksEntity> booksEntityList = null;
		try {
			transaction = session.beginTransaction();
			Query query = session.createQuery("from BooksEntity b where b.publishedDate=:publishedDate");
			query.setParameter("publishedDate", year);
			booksEntityList = query.list();
		} catch (Exception e) {
			if (transaction != null)
				transaction.rollback();
			LOG.error("Exception while Getting branch details:" + e);
		}
		return booksEntityList;
	}

	@Override
	public List<BooksEntity> getBookDetailsByName(String bookname) {
		List<BooksEntity> booksEntityList = null;
		try {
			transaction = session.beginTransaction();
			Query query = session.createQuery("from BooksEntity b where b.bookname=:bookname");
			query.setParameter("bookname", bookname);
			booksEntityList = query.list();
		} catch (Exception e) {
			if (transaction != null)
				transaction.rollback();
			LOG.error("Exception while Getting branch details:" + e);
		}
		return booksEntityList;
	}

	@Override
	public List<BooksEntity> getBooksCategoryByYear(String category, String year) {
		List<BooksEntity> booksEntityList = null;
		try {
			transaction = session.beginTransaction();
			Query query = session.createQuery("from BooksEntity b where b.category=:category and b.publishedDate=:publishedDate");
			query.setParameter("category", year);
			query.setParameter("publishedDate", category);
			booksEntityList = query.list();
		} catch (Exception e) {
			if (transaction != null)
				transaction.rollback();
			LOG.error("Exception while Getting branch details:" + e);
		}
		return booksEntityList;
	}

	@Override
	public List<BooksEntity> getBookDetailsById(Integer id) {
		List<BooksEntity> booksEntityList = null;
		try {
			transaction = session.beginTransaction();
			Query query = session.createQuery("from BooksEntity b where b.id=:id");
			query.setParameter("id", id);
			booksEntityList = query.list();
		} catch (Exception e) {
			if (transaction != null)
				transaction.rollback();
			LOG.error("Exception while Getting branch details:" + e);
		}
		return booksEntityList;
	}

	@Override
	public void updateBookStock(BooksEntity booksEntity) {
		LOG.info("Getting info updating book details");
		try {
			LOG.info("Admin updating Company Profile");
			transaction = session.beginTransaction();
			BooksEntity book = (BooksEntity) session.get(BooksEntity.class, booksEntity.getId());
			LOG.info("**Emp Id updating***" + book.getId());
			if (book != null) {
				book.setNumberOfbooks(booksEntity.getNumberOfbooks());
				book.setModifiedDate(new Date());
				session.update(book);
				transaction.commit();
				LOG.info("User Details Updated Successfully for:"+book.getId());

			}
		}catch (Exception e) {
			/*if(transaction != null)
				transaction.rollback();*/
			LOG.error("Exception occured in updating book details ::" + e);
		}
		
	}

	@Override
	public void addBookOrderDetails(BookOrderEntity bookOrderEntity) {
		try {
			   transaction = session.beginTransaction();
			   session.save(bookOrderEntity);
			   transaction.commit();
			  } catch (Exception e) {
			   if (transaction != null)
			    transaction.rollback();
			   LOG.error("Exception while adding book details:" + e);
			  }
		
	}

	@Override
	public List<BookOrderEntity> getDisplaySalesDetails() {
		List<BookOrderEntity> booksOrderList = null;
		try {
			transaction = session.beginTransaction();
			Query query = session.createQuery("from BookOrderEntity b order by b.createdDate desc");
			booksOrderList = query.list();
		} catch (Exception e) {
			if (transaction != null)
				transaction.rollback();
			LOG.error("Exception while Getting getDisplaySalesDetails:" + e);
		}
		return booksOrderList;
}

	@Override
	public List<BooksEntity> getOutOfStockList() {
		List<BooksEntity> outOfStockList = new ArrayList<BooksEntity>();
		outOfStockList=null;
		try {
			transaction = session.beginTransaction();
			Query query = session.createQuery("from BooksEntity b where b.numberOfbooks <= :numberOfBooks");
			query.setParameter("numberOfBooks", 0);
			outOfStockList = query.list();
			if(outOfStockList != null && outOfStockList.size()!=0){
				LOG.info("The size of outoff stock List " + outOfStockList.size());
			}
		} catch (Exception e) {
			if (transaction != null)
				transaction.rollback();
			LOG.error("Exception while Getting getOutOfStockList:" + e);
		}
		return outOfStockList;
}

	@Override
	public List<BooksEntity> getStockDetailsList() {
		List<BooksEntity> booksEntityList = null;
		try {
			transaction = session.beginTransaction();
			Query query = session.createQuery("from BooksEntity b order by b.category");
			booksEntityList = query.list();
		} catch (Exception e) {
			if (transaction != null)
				transaction.rollback();
			LOG.error("Exception while Getting branch details:" + e);
		}
		return booksEntityList;
	}

	@Override
	public List<BookOrderEntity> getpurchaseList(String userName) {
		List<BookOrderEntity> booksPurchaseList = null;
		try {
			transaction = session.beginTransaction();
			Query query = session.createQuery("from BookOrderEntity b where b.userName=:userName");
			query.setParameter("userName", userName);
			booksPurchaseList = query.list();
		} catch (Exception e) {
			if (transaction != null)
				transaction.rollback();
			LOG.error("Exception while Getting getDisplaySalesDetails:" + e);
		}
		return booksPurchaseList;
	}
}