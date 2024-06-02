package com.user.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class UserDAO implements UserDAO_interface {
    private SessionFactory sessionFactory;

    public UserDAO(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    // Helper method to get the current session
    private Session getSession() {
        return sessionFactory.getCurrentSession();
    }

    @Override
    public void save(UserVO user) {
        Session session = getSession();
        session.save(user);
    }

    @Override
    public void update(UserVO user) {
        Session session = getSession();
        session.update(user);
    }

    @Override
    public void delete(Integer number) {
        Session session = getSession();
        UserVO user = session.byId(UserVO.class).load(number);
        if (user != null) {
            session.delete(user);
        }
    }

    @Override
    public UserVO findByNumber(Integer number) {
        Session session = getSession();
        return session.get(UserVO.class, number);
    }

    @Override
    public UserVO findByAccount(String account) {
        Session session = getSession();
        return session.createQuery("FROM UserVO WHERE account = :account", UserVO.class)
                      .setParameter("account", account)
                      .uniqueResult();
    }

    @Override
    public List<UserVO> getAll() {
        Session session = getSession();
        return session.createQuery("FROM UserVO", UserVO.class).list();
    }

    @Override
    public boolean isFieldDuplicate(String fieldName, String value, Integer userId) {
        Session session = getSession();
        // Implement field duplicate check logic
        // This is a placeholder, update it with your logic
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

    @Override
    public boolean isAccessNumberValid(Integer accessNumber) {
        Session session = getSession();
        // Implement access number validity check logic
        // This is a placeholder, update it with your logic
        Long count = session.createQuery("SELECT COUNT(*) FROM AccessVO WHERE accessNumber = :accessNumber", Long.class)
                            .setParameter("accessNumber", accessNumber)
                            .uniqueResult();
        return count > 0;
    }
}
