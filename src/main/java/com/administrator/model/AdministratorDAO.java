package com.administrator.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class AdministratorDAO implements AdministratorDAO_interface {

    private SessionFactory sessionFactory;

    public AdministratorDAO(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void save(AdministratorVO admin) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        session.save(admin);
        tx.commit();
        session.close();
    }

    @Override
    public void update(AdministratorVO admin) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        session.update(admin);
        tx.commit();
        session.close();
    }

    @Override
    public void delete(AdministratorVO admin) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        session.delete(admin);
        tx.commit();
        session.close();
    }

    @Override
    public AdministratorVO findByAccount(String account) {
        Session session = sessionFactory.openSession();
        Query<AdministratorVO> query = session.createQuery("FROM AdministratorVO WHERE account = :account", AdministratorVO.class);
        query.setParameter("account", account);
        AdministratorVO admin = query.uniqueResult();
        session.close();
        return admin;
    }

    @Override
    public List<AdministratorVO> findAll() {
        Session session = sessionFactory.openSession();
        Query<AdministratorVO> query = session.createQuery("FROM AdministratorVO", AdministratorVO.class);
        List<AdministratorVO> adminList = query.list();
        session.close();
        return adminList;
    }
}
