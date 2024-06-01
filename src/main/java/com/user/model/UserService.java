package com.user.model;

import java.util.List;

public interface UserService {
    void addUser(UserVO user) throws DuplicateFieldException;
    void updateUser(UserVO user) throws DuplicateFieldException;
    void deleteUser(Integer number);
    UserVO getUserByNumber(Integer number);
    UserVO getUserByAccount(String account);
    List<UserVO> getAllUsers();
    boolean isFieldDuplicate(String fieldName, String value, Integer userId);
    boolean isAccessNumberValid(Integer accessNumber); // 新增方法
}
