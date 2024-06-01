package com.loginRecord.model;

import java.util.List;

public interface LoginRecordService {
    void addLoginRecord(LoginRecordVO loginRecord);
    void updateLoginRecord(LoginRecordVO loginRecord);
    void deleteLoginRecord(Integer number);
    LoginRecordVO getLoginRecordByNumber(Integer number);
    List<LoginRecordVO> getAllLoginRecords();
    List<LoginRecordVO> getLoginRecordsByUserNumber(Integer userNumber); // 添加这个方法
}
