package com.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import util.HibernateUtil;

public class OpenSessionInViewFilter implements Filter {
    private SessionFactory sessionFactory;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        sessionFactory = HibernateUtil.getSessionFactory();
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        Session session = null;
        Transaction tx = null;
        try {
            session = sessionFactory.getCurrentSession();
            tx = session.beginTransaction();
            chain.doFilter(request, response);
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            throw new ServletException(e);
        } finally {
            if (session != null && session.isOpen()) {
                session.close();
            }
        }
    }

    @Override
    public void destroy() {
    }
}
