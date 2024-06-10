package com.user.model;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import util.HibernateUtil;
import java.util.List;

public class UserDAO implements UserDAO_interface {
    private SessionFactory sessionFactory;

    public UserDAO() {
        this.sessionFactory = HibernateUtil.getSessionFactory();
    }

    @Override
    public void save(UserVO user) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            session.save(user);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }

    @Override
    public void update(UserVO user) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            session.merge(user);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }

    @Override
    public void delete(Integer number) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            UserVO user = session.byId(UserVO.class).load(number);
            if (user != null) {
                session.delete(user);
            }
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }

    @Override
    public UserVO findByNumber(Integer number) {
        try (Session session = sessionFactory.openSession()) {
            return session.get(UserVO.class, number);
        }
    }

    @Override
    public UserVO findByAccount(String account) {
        try (Session session = sessionFactory.openSession()) {
            return session.createQuery("FROM UserVO WHERE account = :account", UserVO.class)
                          .setParameter("account", account)
                          .uniqueResult();
        }
    }

    @Override
    public List<UserVO> getAll() {
        try (Session session = sessionFactory.openSession()) {
            return session.createQuery("FROM UserVO", UserVO.class).list();
        }
    }

    @Override
    public List<UserVO> getUsersByRole(int role) {
        try (Session session = sessionFactory.openSession()) {
            return session.createQuery("FROM UserVO WHERE accessNumber = :role", UserVO.class)
                          .setParameter("role", role)
                          .list();
        }
    }
    
    @Override
    public List<UserVO> findByEmail(String email) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            String hql = "FROM UserVO WHERE eMail = :email";
            Query<UserVO> query = session.createQuery(hql, UserVO.class);
            query.setParameter("email", email);
            return query.list();
        }
    }

    @Override
    public boolean isFieldDuplicate(String fieldName, String value, Integer userId) {
        try (Session session = sessionFactory.openSession()) {
            String queryString = "SELECT COUNT(*) FROM UserVO WHERE " + fieldName + " = :value";
            if (userId != null) {
                queryString += " AND number != :userId";
            }
            var query = session.createQuery(queryString);
            query.setParameter("value", value);
            if (userId != null) {
                query.setParameter("userId", userId);
            }
            Long count = (Long) query.uniqueResult();
            return count > 0;
        }
    }

    @Override
    public boolean isAccessNumberValid(Integer accessNumber) {
        try (Session session = sessionFactory.openSession()) {
            Long count = session.createQuery("SELECT COUNT(*) FROM AccessVO WHERE accessNumber = :accessNumber", Long.class)
                                .setParameter("accessNumber", accessNumber)
                                .uniqueResult();
            return count > 0;
        }
    }
}
