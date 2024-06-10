package com.user.model;

import java.util.List;
import org.hibernate.Session;

public interface UserService {
    
    boolean checkEmailExists(String email);
    void addUser(UserVO user) throws DuplicateFieldException;
    void updateUser(UserVO user) throws DuplicateFieldException;
    void deleteUser(Integer number);
    UserVO getUserByNumber(Integer number);
    UserVO getUserByAccount(String account);
    List<UserVO> getAllUsers();
    List<UserVO> getUsersByRole(int role); // 新增方法
    boolean isFieldDuplicate(String fieldName, String value, Integer userId);
    boolean isAccessNumberValid(Integer accessNumber);
    void updateUserRole(UserVO user) throws DuplicateFieldException; // 新增方法
    
    UserVO login(String account, String passcode, Session session); // 新增login方法
    UserVO getUserByEmail(String email, Session session); // 新增getUserByEmail方法
    void updateUser(UserVO user, Session session) throws DuplicateFieldException; // 修改updateUser方法
    
}
