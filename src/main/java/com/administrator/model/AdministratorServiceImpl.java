package com.administrator.model;

import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;
import com.user.model.UserVO;
import com.user.model.UserDAO; // 添加此行
import java.util.List;

public class AdministratorServiceImpl implements AdministratorService {
    private UserDAO userDAO;

    public AdministratorServiceImpl() {
        this.userDAO = new UserDAO(); // 初始化 UserDAO
    }

    @Override
    public void addAdministrator(AdministratorVO admin) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            session.save(admin);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    @Override
    public void updateAdministrator(AdministratorVO admin) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            session.update(admin);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    @Override
    public void deleteAdministrator(String account) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            AdministratorVO admin = session.get(AdministratorVO.class, account);
            if (admin != null) {
                session.delete(admin);
                transaction.commit();
            }
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    @Override
    public AdministratorVO getAdministratorByAccount(String account) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            return session.get(AdministratorVO.class, account);
        } finally {
            session.close();
        }
    }

    @Override
    public List<AdministratorVO> getAllAdministrators() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            return session.createQuery("from AdministratorVO", AdministratorVO.class).list();
        } finally {
            session.close();
        }
    }

    @Override
    public UserVO getUserByNumber(int number) {
        return userDAO.findByNumber(number);
    }
}
