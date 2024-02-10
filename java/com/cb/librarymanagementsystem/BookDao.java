package com.cb.librarymanagementsystem;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

@Transactional
public class BookDao {

	EntityManager entityManager = DatabaseConnection.getEntityManager();

	public long getBookCount() {
			Query query = entityManager.createQuery("SELECT COUNT(id) FROM Book");
			return (long) query.getSingleResult();
	}

	public void updateBook(Book book) {
			entityManager.getTransaction().begin();
			entityManager.merge(book);
			entityManager.getTransaction().commit();
	}
	public void deleteBook(Book book) {
			entityManager.getTransaction().begin();
			entityManager.remove(book);
			entityManager.getTransaction().commit();
	}

	public void saveBook(Book book) {
			entityManager.getTransaction().begin();
			entityManager.persist(book);
			entityManager.getTransaction().commit();
	}

	public List<Book> getAllBooks() {
			TypedQuery<Book> query = entityManager.createQuery("SELECT b FROM Book b", Book.class);
			return query.getResultList();
	}

	public Book getBookById(long bookId) {
			return entityManager.find(Book.class, bookId);
	}
}
