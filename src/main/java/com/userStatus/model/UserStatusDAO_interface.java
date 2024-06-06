package com.userStatus.model;

import java.util.List;

public interface UserStatusDAO_interface {
    void save(UserStatusVO userStatus);
    void update(UserStatusVO userStatus);
    void delete(Integer number);
    UserStatusVO findByPrimaryKey(Integer number);
    List<UserStatusVO> getAll();
}
