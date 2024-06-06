package com.loginRecord.model;

import java.util.List;

public interface LoginRecordDAO_interface {
    void save(LoginRecordVO loginRecord);
    void update(LoginRecordVO loginRecord);
    void delete(Integer number);
    LoginRecordVO findByPrimaryKey(Integer number);
    List<LoginRecordVO> getAll();
    List<LoginRecordVO> findByUserNumber(Integer userNumber);
}
