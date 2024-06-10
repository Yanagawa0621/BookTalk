package com.access.model;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import util.HibernateUtil;

public class AccessDAO implements AccessDAO_interface {
    private SessionFactory sessionFactory;

    public AccessDAO() {
        this.sessionFactory = HibernateUtil.getSessionFactory();
    }

    private Session getSession() {
        return sessionFactory.openSession();
    }

    @Override
    public void save(AccessVO access) {
        Session session = getSession();
        Transaction tx = session.beginTransaction();
        try {
            session.save(access);
            tx.commit();
        } catch (Exception e) {
            tx.rollback();
            throw e;
        } finally {
            session.close();
        }
    }

    @Override
    public void update(AccessVO access) {
        Session session = getSession();
        Transaction tx = session.beginTransaction();
        try {
            session.update(access);
            tx.commit();
        } catch (Exception e) {
            tx.rollback();
            throw e;
        } finally {
            session.close();
        }
    }

    @Override
    public void delete(Integer accessNumber) {
        Session session = getSession();
        Transaction tx = session.beginTransaction();
        try {
            AccessVO access = session.get(AccessVO.class, accessNumber);
            if (access != null) {
                session.delete(access);
            }
            tx.commit();
        } catch (Exception e) {
            tx.rollback();
            throw e;
        } finally {
            session.close();
        }
    }

    @Override
    public AccessVO findByPrimaryKey(Integer accessNumber) {
        Session session = getSession();
        try {
            return session.get(AccessVO.class, accessNumber);
        } finally {
            session.close();
        }
    }

    @Override
    public List<AccessVO> getAll() {
        Session session = getSession();
        try {
            Query<AccessVO> query = session.createQuery("FROM AccessVO", AccessVO.class);
            return query.list();
        } finally {
            session.close();
        }
    }
}
