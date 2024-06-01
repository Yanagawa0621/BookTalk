package com.userStatus.model;

import java.util.List;

public interface UserStatusDAO_interface {
    void save(UserStatusVO userStatus);
    void update(UserStatusVO userStatus);
    void delete(Integer userStatus);
    UserStatusVO findByPrimaryKey(Integer userStatus);
    List<UserStatusVO> getAll();
}

