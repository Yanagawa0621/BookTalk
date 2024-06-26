package com.user.model;

import java.util.List;

public interface UserDAO_interface {
	
	List<UserVO> findByEmail(String email);
    void save(UserVO user);
    void update(UserVO user);
    void delete(Integer number);
    UserVO findByNumber(Integer number);
    UserVO findByAccount(String account);
    List<UserVO> getAll();
    List<UserVO> getUsersByRole(int role); // 新增此方法聲明
    boolean isFieldDuplicate(String fieldName, String value, Integer userId);
    boolean isAccessNumberValid(Integer accessNumber); // 新增方法
}
