package com.loginRecord.model;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class LoginRecordDAO implements LoginRecordDAO_interface {

    private SessionFactory sessionFactory;

    public LoginRecordDAO(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void save(LoginRecordVO loginRecord) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        session.save(loginRecord);
        tx.commit();
        session.close();
    }

    @Override
    public void update(LoginRecordVO loginRecord) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        session.update(loginRecord);
        tx.commit();
        session.close();
    }

    @Override
    public void delete(Integer number) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        LoginRecordVO loginRecord = session.get(LoginRecordVO.class, number);
        if (loginRecord != null) {
            session.delete(loginRecord);
        }
        tx.commit();
        session.close();
    }

    @Override
    public LoginRecordVO findByPrimaryKey(Integer number) {
        Session session = sessionFactory.openSession();
        LoginRecordVO loginRecord = session.get(LoginRecordVO.class, number);
        session.close();
        return loginRecord;
    }

    @Override
    public List<LoginRecordVO> getAll() {
        Session session = sessionFactory.openSession();
        Query<LoginRecordVO> query = session.createQuery("FROM LoginRecordVO", LoginRecordVO.class);
        List<LoginRecordVO> list = query.list();
        session.close();
        return list;
    }

    @Override
    public List<LoginRecordVO> findByUserNumber(Integer userNumber) {
        Session session = sessionFactory.openSession();
        Query<LoginRecordVO> query = session.createQuery("FROM LoginRecordVO WHERE user.number = :userNumber", LoginRecordVO.class);
        query.setParameter("userNumber", userNumber);
        List<LoginRecordVO> list = query.list();
        session.close();
        return list;
    }
}
