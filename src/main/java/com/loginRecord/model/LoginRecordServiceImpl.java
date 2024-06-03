package com.loginRecord.model;

import java.util.List;

public class LoginRecordServiceImpl implements LoginRecordService {

    private LoginRecordDAO_interface loginRecordDAO;

    public LoginRecordServiceImpl(LoginRecordDAO_interface loginRecordDAO) {
        this.loginRecordDAO = loginRecordDAO;
    }

    @Override
    public void addLoginRecord(LoginRecordVO loginRecord) {
        loginRecordDAO.save(loginRecord);
    }

    @Override
    public void updateLoginRecord(LoginRecordVO loginRecord) {
        loginRecordDAO.update(loginRecord);
    }

    @Override
    public void deleteLoginRecord(Integer number) {
        loginRecordDAO.delete(number);
    }

    @Override
    public LoginRecordVO getLoginRecordByNumber(Integer number) {
        return loginRecordDAO.findByPrimaryKey(number);
    }

    @Override
    public List<LoginRecordVO> getAllLoginRecords() {
        return loginRecordDAO.getAll();
    }

    @Override
    public List<LoginRecordVO> getLoginRecordsByUserNumber(Integer userNumber) {
        return loginRecordDAO.findByUserNumber(userNumber);
    }
}