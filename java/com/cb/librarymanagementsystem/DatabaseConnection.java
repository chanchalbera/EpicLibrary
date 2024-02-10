package com.cb.librarymanagementsystem;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;

public class DatabaseConnection {
	
	public static EntityManager getEntityManager() {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory("library");
		return factory.createEntityManager();
	}
	
	public static EntityTransaction getEntityTransaction() {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory("library");
		EntityManager manager = factory.createEntityManager();
		return manager.getTransaction();

	}

}
