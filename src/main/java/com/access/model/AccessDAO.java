package com.access.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class AccessDAO implements AccessDAO_interface {

    private SessionFactory sessionFactory;

    public AccessDAO(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void save(AccessVO access) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        session.save(access);
        tx.commit();
        session.close();
    }

    @Override
    public void update(AccessVO access) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        session.update(access);
        tx.commit();
        session.close();
    }

    @Override
    public void delete(Integer accessNumber) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        AccessVO access = session.get(AccessVO.class, accessNumber);
        if (access != null) {
            session.delete(access);
        }
        tx.commit();
        session.close();
    }

    @Override
    public AccessVO findByPrimaryKey(Integer accessNumber) {
        Session session = sessionFactory.openSession();
        AccessVO access = session.get(AccessVO.class, accessNumber);
        session.close();
        return access;
    }

    @Override
    public List<AccessVO> getAll() {
        Session session = sessionFactory.openSession();
        Query<AccessVO> query = session.createQuery("FROM AccessVO", AccessVO.class);
        List<AccessVO> list = query.list();
        session.close();
        return list;
    }
}
