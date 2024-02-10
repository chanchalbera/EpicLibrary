package com.cb.librarymanagementsystem;

import javax.persistence.EntityManager;
import java.util.List;

public class AdminDao {

    private EntityManager entityManager;

    public AdminDao(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    public void saveAdmin(Admin admin) {
        entityManager.getTransaction().begin();
        entityManager.persist(admin);
        entityManager.getTransaction().commit();
    }

    public Admin getAdminById(Long id) {
        return entityManager.find(Admin.class, id);
    }

    public List<Admin> getAdminByEmail(String email) {
        String jpql = "SELECT a FROM Admin a WHERE a.email = :email";
        return entityManager.createQuery(jpql, Admin.class)
                .setParameter("email", email)
                .getResultList();
    }

    public List<Admin> getAllAdmins() {
        String jpql = "SELECT a FROM Admin a";
        return entityManager.createQuery(jpql, Admin.class)
                .getResultList();
    }

    public void updateAdmin(Admin admin) {
        entityManager.getTransaction().begin();
        entityManager.merge(admin);
        entityManager.getTransaction().commit();
    }

    public void deleteAdmin(Admin admin) {
        entityManager.getTransaction().begin();
        entityManager.remove(admin);
        entityManager.getTransaction().commit();
    }
}

