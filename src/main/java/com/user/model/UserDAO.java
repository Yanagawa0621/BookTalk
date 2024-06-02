package com.user.model;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import util.HibernateUtil;

public class UserDAO implements UserDAO_interface {
    private SessionFactory sessionFactory;

    public UserDAO(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    private Session getSession() {
        return sessionFactory.getCurrentSession();
    }

    @Override
    public void save(UserVO user) {
        Transaction tx = null;
        try {
            Session session = getSession();
            tx = session.beginTransaction();
            session.save(user);
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            throw e;
        }
    }

    @Override
    public void update(UserVO user) {
        Transaction tx = null;
        try {
            Session session = getSession();
            tx = session.beginTransaction();
            session.update(user);
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            throw e;
        }
    }

    @Override
    public void delete(Integer number) {
        Transaction tx = null;
        try {
            Session session = getSession();
            tx = session.beginTransaction();
            UserVO user = session.get(UserVO.class, number);
            if (user != null) {
                session.delete(user);
            }
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            throw e;
        }
    }

    @Override
    public UserVO findByNumber(Integer number) {
        return getSession().get(UserVO.class, number);
    }

    @Override
    public UserVO findByAccount(String account) {
        Query<UserVO> query = getSession().createQuery("FROM UserVO WHERE account = :account", UserVO.class);
        query.setParameter("account", account);
        return query.uniqueResult();
    }

    @Override
    public List<UserVO> getAll() {
        Query<UserVO> query = getSession().createQuery("FROM UserVO", UserVO.class);
        return query.list();
    }

    @Override
    public boolean isFieldDuplicate(String fieldName, String value, Integer userId) {
        String hql = "FROM UserVO WHERE " + fieldName + " = :value";
        if (userId != null) {
            hql += " AND number != :userId";
        }
        Query<UserVO> query = getSession().createQuery(hql, UserVO.class);
        query.setParameter("value", value);
        if (userId != null) {
            query.setParameter("userId", userId);
        }
        return !query.list().isEmpty();
    }

    @Override
    public boolean isAccessNumberValid(Integer accessNumber) {
        Query<Long> query = getSession().createQuery("SELECT COUNT(*) FROM AccessVO WHERE accessNumber = :accessNumber", Long.class);
        query.setParameter("accessNumber", accessNumber);
        long count = query.uniqueResult();
        return count > 0;
    }
}
