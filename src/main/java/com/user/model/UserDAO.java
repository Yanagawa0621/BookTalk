package com.user.model;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class UserDAO implements UserDAO_interface {
    private SessionFactory sessionFactory;

    public UserDAO(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void save(UserVO user) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        session.save(user);
        tx.commit();
        session.close();
    }

    @Override
    public void update(UserVO user) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        session.update(user);
        tx.commit();
        session.close();
    }

    @Override
    public void delete(Integer number) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        UserVO user = session.get(UserVO.class, number);
        if (user != null) {
            session.delete(user);
        }
        tx.commit();
        session.close();
    }

    @Override
    public UserVO findByNumber(Integer number) {
        Session session = sessionFactory.openSession();
        UserVO user = session.get(UserVO.class, number);
        session.close();
        return user;
    }

    @Override
    public UserVO findByAccount(String account) {
        Session session = sessionFactory.openSession();
        Query<UserVO> query = session.createQuery("FROM UserVO WHERE account = :account", UserVO.class);
        query.setParameter("account", account);
        UserVO user = query.uniqueResult();
        session.close();
        return user;
    }

    @Override
    public List<UserVO> getAll() {
        Session session = sessionFactory.openSession();
        Query<UserVO> query = session.createQuery("FROM UserVO", UserVO.class);
        List<UserVO> userList = query.list();
        session.close();
        return userList;
    }

    @Override
    public boolean isFieldDuplicate(String fieldName, String value, Integer userId) {
        Session session = sessionFactory.openSession();
        String hql = "FROM UserVO WHERE " + fieldName + " = :value";
        if (userId != null) {
            hql += " AND number != :userId";
        }
        Query<UserVO> query = session.createQuery(hql, UserVO.class);
        query.setParameter("value", value);
        if (userId != null) {
            query.setParameter("userId", userId);
        }
        boolean isDuplicate = !query.list().isEmpty();
        session.close();
        return isDuplicate;
    }

    @Override
    public boolean isAccessNumberValid(Integer accessNumber) {
        Session session = sessionFactory.openSession();
        Query<Long> query = session.createQuery("SELECT COUNT(*) FROM AccessVO WHERE accessNumber = :accessNumber", Long.class);
        query.setParameter("accessNumber", accessNumber);
        long count = query.uniqueResult();
        session.close();
        return count > 0;
    }
}
