package com.administrator.model;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;

public class AdministratorDAO implements AdministratorDAO_interface {

	public AdministratorDAO() {
		// 無參數構造函數
	}

	@Override
	public void save(AdministratorVO admin) {
		Transaction transaction = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			transaction = session.beginTransaction();
			session.save(admin);
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
	}

	@Override
	public void update(AdministratorVO admin) {
		Transaction transaction = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			transaction = session.beginTransaction();
			session.update(admin);
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
	}

	@Override
	public void delete(String account) {
		Transaction transaction = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			transaction = session.beginTransaction();
			AdministratorVO admin = session.get(AdministratorVO.class, account);
			if (admin != null) {
				session.delete(admin);
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
	public AdministratorVO getByAccount(String account) {
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			return session.get(AdministratorVO.class, account);
		}
	}

	@Override
	public List<AdministratorVO> getAll() {
	    try (Session session = HibernateUtil.getSessionFactory().openSession()) {
	        List<AdministratorVO> adminList = session.createQuery("FROM AdministratorVO", AdministratorVO.class).list();
	        System.out.println("DAO - Fetched Admin List Size: " + adminList.size()); // Add this line for debugging
	        return adminList;
	    }
	}
}
