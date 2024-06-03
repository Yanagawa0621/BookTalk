package com.access.model;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import util.HibernateUtil;

public class AccessDAO implements AccessDAO_interface {
    private SessionFactory sessionFactory;

    public AccessDAO() {
        this.sessionFactory = HibernateUtil.getSessionFactory();
    }

    private Session getSession() {
        return sessionFactory.getCurrentSession();
    }

    @Override
    public void save(AccessVO access) {
        getSession().save(access);
    }

    @Override
    public void update(AccessVO access) {
        getSession().update(access);
    }

    @Override
    public void delete(Integer accessNumber) {
        AccessVO access = getSession().get(AccessVO.class, accessNumber);
        if (access != null) {
            getSession().delete(access);
        }
    }

    @Override
    public AccessVO findByPrimaryKey(Integer accessNumber) {
        return getSession().get(AccessVO.class, accessNumber);
    }

    @Override
    public List<AccessVO> getAll() {
        Query<AccessVO> query = getSession().createQuery("FROM AccessVO", AccessVO.class);
        return query.list();
    }
}
