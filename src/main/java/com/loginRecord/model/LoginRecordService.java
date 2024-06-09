package com.loginRecord.model;

import java.util.List;

public interface LoginRecordService {
    void addLoginRecord(LoginRecordVO loginRecord);
    void updateLoginRecord(LoginRecordVO loginRecord);
    void deleteLoginRecord(Integer number);
    LoginRecordVO getLoginRecord(Integer number);
    List<LoginRecordVO> getAllLoginRecords();
    List<LoginRecordVO> getLoginRecordsByUserNumber(Integer userNumber);
    List<LoginRecordVO> searchLoginRecords(String userName, String userType, String timeRange, String customDaysStr); // 添加这个方法
}
