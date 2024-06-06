package com.user.model;

import java.util.List;

public interface UserService {
    void addUser(UserVO user) throws DuplicateFieldException;
    void updateUser(UserVO user) throws DuplicateFieldException;
    void deleteUser(Integer number);
    UserVO getUserByNumber(Integer number);
    UserVO getUserByAccount(String account);
    List<UserVO> getAllUsers();
    List<UserVO> getUsersByRole(int role); // 新增方法
    boolean isFieldDuplicate(String fieldName, String value, Integer userId);
    boolean isAccessNumberValid(Integer accessNumber);
    void updateUserRole(UserVO user) throws DuplicateFieldException; // 新增的方法
}
