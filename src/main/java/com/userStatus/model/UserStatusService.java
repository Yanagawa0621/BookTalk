package com.userStatus.model;

import java.util.List;

public interface UserStatusService {
    void addUserStatus(UserStatusVO userStatus);
    void updateUserStatus(UserStatusVO userStatus);
    void deleteUserStatus(Integer userStatus);
    UserStatusVO getUserStatusByNumber(Integer userStatus);
    List<UserStatusVO> getAllUserStatuses();
}
