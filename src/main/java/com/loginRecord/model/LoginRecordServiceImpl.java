package com.loginRecord.model;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import util.HibernateUtil;

public class LoginRecordServiceImpl implements LoginRecordService {

    private LoginRecordDAO_interface dao;

    public LoginRecordServiceImpl() {
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        dao = new LoginRecordDAO(sessionFactory);
    }

    @Override
    public void addLoginRecord(LoginRecordVO loginRecord) {
        dao.save(loginRecord);
    }

    @Override
    public void updateLoginRecord(LoginRecordVO loginRecord) {
        dao.update(loginRecord);
    }

    @Override
    public void deleteLoginRecord(Integer number) {
        dao.delete(number);
    }

    @Override
    public LoginRecordVO getLoginRecord(Integer number) {
        return dao.findByPrimaryKey(number);
    }

    @Override
    public List<LoginRecordVO> getAllLoginRecords() {
        return dao.getAll();
    }

    @Override
    public List<LoginRecordVO> getLoginRecordsByUserNumber(Integer userNumber) {
        return dao.findByUserNumber(userNumber);
    }

    @Override
    public List<LoginRecordVO> searchLoginRecords(String userName, String userType, String timeRange, String customDaysStr) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            StringBuilder hql = new StringBuilder("SELECT lr FROM LoginRecordVO lr LEFT JOIN lr.user u LEFT JOIN lr.admin a");
            boolean hasCondition = false;

            if (userName != null && !userName.isEmpty()) {
                hql.append(" WHERE (u.name LIKE :userName OR a.name LIKE :userName)");
                hasCondition = true;
            }

            if (userType != null && !userType.isEmpty()) {
                if (hasCondition) {
                    hql.append(" AND");
                } else {
                    hql.append(" WHERE");
                    hasCondition = true;
                }
                hql.append(" lr.userType = :userType");
            }

            LocalDate customDate = null;
            if (timeRange != null && !timeRange.isEmpty()) {
                if (timeRange.equals("today")) {
                    customDate = LocalDate.now();
                } else if (timeRange.equals("7days")) {
                    customDate = LocalDate.now().minusDays(7);
                } else if (timeRange.equals("custom")) {
                    if (customDaysStr != null && !customDaysStr.isEmpty()) {
                        int customDays = Integer.parseInt(customDaysStr);
                        customDate = LocalDate.now().minusDays(customDays);
                    }
                }
            }

            if (customDate != null) {
                if (hasCondition) {
                    hql.append(" AND");
                } else {
                    hql.append(" WHERE");
                }
                hql.append(" lr.loginTime >= :customDate");
            }

            Query<LoginRecordVO> query = session.createQuery(hql.toString(), LoginRecordVO.class);

            if (userName != null && !userName.isEmpty()) {
                query.setParameter("userName", "%" + userName + "%");
            }

            if (userType != null && !userType.isEmpty()) {
                query.setParameter("userType", userType);
            }

            if (customDate != null) {
                query.setParameter("customDate", java.sql.Date.valueOf(customDate));
            }

            List<LoginRecordVO> resultList = query.list();
            System.out.println("查詢結果: " + resultList); // 打印查詢結果
            return resultList;
        }
    }

}