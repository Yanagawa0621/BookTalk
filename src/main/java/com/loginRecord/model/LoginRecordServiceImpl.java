package com.loginRecord.model;

import java.util.List;
import org.hibernate.SessionFactory;
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
}
