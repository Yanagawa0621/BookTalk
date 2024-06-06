package com.userStatus.model;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import util.HibernateUtil;

public class UserStatusDAO implements UserStatusDAO_interface {
    private SessionFactory sessionFactory;

    public UserStatusDAO() {
        this.sessionFactory = HibernateUtil.getSessionFactory();
    }

    private Session getSession() {
        return sessionFactory.getCurrentSession();
    }

    @Override
    public void save(UserStatusVO userStatus) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            session.save(userStatus);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
        }
    }

    @Override
    public void update(UserStatusVO userStatus) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            session.update(userStatus);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
        }
    }

    @Override
    public void delete(Integer number) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            UserStatusVO userStatus = session.get(UserStatusVO.class, number);
            if (userStatus != null) {
                session.delete(userStatus);
                transaction.commit();
            }
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
        }
    }

    @Override
    public UserStatusVO findByPrimaryKey(Integer number) {
        UserStatusVO userStatus = null;
        try (Session session = sessionFactory.openSession()) {
            userStatus = session.get(UserStatusVO.class, number);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return userStatus;
    }

    @Override
    public List<UserStatusVO> getAll() {
        List<UserStatusVO> userStatusList = null;
        try (Session session = sessionFactory.openSession()) {
            Query<UserStatusVO> query = session.createQuery("FROM UserStatusVO", UserStatusVO.class);
            userStatusList = query.list();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return userStatusList;
    }
}
