package com.cb.librarymanagementsystem;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;
import javax.transaction.Transactional;

@Transactional
public class UserDao {

    public long getUserCount() {
        EntityManager entityManager = DatabaseConnection.getEntityManager();
        try {
            Query query = entityManager.createQuery("SELECT COUNT(id) FROM User");
            return (long) query.getSingleResult();
        } finally {
            closeEntityManager(entityManager);
        }
    }

    public void saveUser(User user) {
        EntityManager entityManager = DatabaseConnection.getEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();
        try {
            transaction.begin();
            entityManager.persist(user);
            transaction.commit();
        } catch (Exception e) {
            handleException(transaction, e);
        } finally {
            closeEntityManager(entityManager);
        }
    }

    public void updateUser(User user) {
        EntityManager entityManager = DatabaseConnection.getEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();
        try {
            transaction.begin();
            entityManager.merge(user);
            transaction.commit();
        } catch (Exception e) {
            handleException(transaction, e);
        } finally {
            closeEntityManager(entityManager);
        }
    }

    public boolean deleteUser(Long id) {
        EntityManager entityManager = DatabaseConnection.getEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();
        try {
            User user = entityManager.find(User.class, id);
            if (user != null) {
                transaction.begin();
                entityManager.remove(user);
                transaction.commit();
                return true;
            }
            return false;
        } catch (Exception e) {
            handleException(transaction, e);
            return false;
        } finally {
            closeEntityManager(entityManager);
        }
    }

    public User getUser(Long id) {
        EntityManager entityManager = DatabaseConnection.getEntityManager();
        try {
            return entityManager.find(User.class, id);
        } finally {
            closeEntityManager(entityManager);
        }
    }

    private void handleException(EntityTransaction transaction, Exception e) {
        if (transaction != null && transaction.isActive()) {
            transaction.rollback();
        }
        e.printStackTrace(); // Log or handle the exception as needed
    }

    private void closeEntityManager(EntityManager entityManager) {
        if (entityManager != null && entityManager.isOpen()) {
            entityManager.close();
        }
    }
}
