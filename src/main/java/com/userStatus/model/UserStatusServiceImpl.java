package com.userStatus.model;

import java.util.List;

public class UserStatusServiceImpl implements UserStatusService {

    private UserStatusDAO_interface userStatusDAO;

    public UserStatusServiceImpl(UserStatusDAO_interface userStatusDAO) {
        this.userStatusDAO = userStatusDAO;
    }

    @Override
    public void addUserStatus(UserStatusVO userStatus) {
        userStatusDAO.save(userStatus);
    }

    @Override
    public void updateUserStatus(UserStatusVO userStatus) {
        userStatusDAO.update(userStatus);
    }

    @Override
    public void deleteUserStatus(Integer userStatus) {
        userStatusDAO.delete(userStatus);
    }

    @Override
    public UserStatusVO getUserStatusByNumber(Integer userStatus) {
        return userStatusDAO.findByPrimaryKey(userStatus);
    }

    @Override
    public List<UserStatusVO> getAllUserStatuses() {
        return userStatusDAO.getAll();
    }
}

