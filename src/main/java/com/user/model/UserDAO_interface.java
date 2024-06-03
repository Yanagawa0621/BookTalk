package com.user.model;

import java.util.List;

public interface UserDAO_interface {
    void save(UserVO user);
    void update(UserVO user);
    void delete(Integer number);
    UserVO findByNumber(Integer number);
    UserVO findByAccount(String account);
    List<UserVO> getAll();
    boolean isFieldDuplicate(String fieldName, String value, Integer userId);
    boolean isAccessNumberValid(Integer accessNumber); // 新增方法
}
