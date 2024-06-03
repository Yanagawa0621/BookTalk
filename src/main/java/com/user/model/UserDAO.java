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
        getSession().save(user);
    }

    @Override
    public void update(UserVO user) {
        getSession().merge(user);
    }

    @Override
    public void delete(Integer number) {
        UserVO user = getSession().byId(UserVO.class).load(number);
        if (user != null) {
            getSession().delete(user);
        }
    }

    @Override
    public UserVO findByNumber(Integer number) {
        return getSession().get(UserVO.class, number);
    }

    @Override
    public UserVO findByAccount(String account) {
        return getSession().createQuery("FROM UserVO WHERE account = :account", UserVO.class)
                           .setParameter("account", account)
                           .uniqueResult();
    }

    @Override
    public List<UserVO> getAll() {
        return getSession().createQuery("FROM UserVO", UserVO.class).list();
    }

    @Override
    public boolean isFieldDuplicate(String fieldName, String value, Integer userId) {
        String queryString = "SELECT COUNT(*) FROM UserVO WHERE " + fieldName + " = :value";
        if (userId != null) {
            queryString += " AND number != :userId";
        }
        var query = getSession().createQuery(queryString);
        query.setParameter("value", value);
        if (userId != null) {
            query.setParameter("userId", userId);
        }
        Long count = (Long) query.uniqueResult();
        return count > 0;
    }

    @Override
    public boolean isAccessNumberValid(Integer accessNumber) {
        Long count = getSession().createQuery("SELECT COUNT(*) FROM AccessVO WHERE accessNumber = :accessNumber", Long.class)
                                 .setParameter("accessNumber", accessNumber)
                                 .uniqueResult();
        return count > 0;
    }
}
