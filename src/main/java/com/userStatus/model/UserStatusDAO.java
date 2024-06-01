package com.userStatus.model;


import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class UserStatusDAO implements UserStatusDAO_interface {

    private SessionFactory sessionFactory;

    public UserStatusDAO(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void save(UserStatusVO userStatus) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        session.save(userStatus);
        tx.commit();
        session.close();
    }

    @Override
    public void update(UserStatusVO userStatus) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        session.update(userStatus);
        tx.commit();
        session.close();
    }

    @Override
    public void delete(Integer userStatus) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        UserStatusVO userStatusVO = session.get(UserStatusVO.class, userStatus);
        if (userStatusVO != null) {
            session.delete(userStatusVO);
        }
        tx.commit();
        session.close();
    }

    @Override
    public UserStatusVO findByPrimaryKey(Integer userStatus) {
        Session session = sessionFactory.openSession();
        UserStatusVO userStatusVO = session.get(UserStatusVO.class, userStatus);
        session.close();
        return userStatusVO;
    }

    @Override
    public List<UserStatusVO> getAll() {
        Session session = sessionFactory.openSession();
        Query<UserStatusVO> query = session.createQuery("FROM UserStatusVO", UserStatusVO.class);
        List<UserStatusVO> list = query.list();
        session.close();
        return list;
    }
}

