package com.user.model;

import java.util.List;

public class UserServiceImpl implements UserService {
    private final UserDAO_interface userDAO;

    public UserServiceImpl(UserDAO_interface userDAO) {
        this.userDAO = userDAO;
    }

    @Override
    public void addUser(UserVO user) throws DuplicateFieldException {
        checkDuplicateFields(user, null);
        if (!isAccessNumberValid(user.getAccessNumber())) {
            throw new DuplicateFieldException("accessNumber", "無效的權限編號.");
        }
        System.out.println("Saving user: " + user);
        userDAO.save(user);
    }

    @Override
    public void updateUser(UserVO user) throws DuplicateFieldException {
        checkDuplicateFields(user, user.getNumber());
        if (!isAccessNumberValid(user.getAccessNumber())) {
            throw new DuplicateFieldException("accessNumber", "無效的權限編號.");
        }
        userDAO.update(user);
    }

    private void checkDuplicateFields(UserVO user, Integer userId) throws DuplicateFieldException {
        checkDuplicateField("account", user.getAccount(), userId);
        checkDuplicateField("name", user.getName(), userId);
        checkDuplicateField("eMail", user.geteMail(), userId);
        checkDuplicateField("nationalIdNumber", user.getNationalIdNumber(), userId);
        checkDuplicateField("telephoneNumber", user.getTelephoneNumber(), userId);
    }

    private void checkDuplicateField(String fieldName, String value, Integer userId) throws DuplicateFieldException {
        if (isFieldDuplicate(fieldName, value, userId)) {
            throw new DuplicateFieldException(fieldName, "這個" + fieldName + "已有人使用、請試試其他" + fieldName + ".");
        }
    }

    @Override
    public void deleteUser(Integer number) {
        userDAO.delete(number);
    }

    @Override
    public UserVO getUserByNumber(Integer number) {
        return userDAO.findByNumber(number);
    }

    @Override
    public UserVO getUserByAccount(String account) {
        return userDAO.findByAccount(account);
    }

    @Override
    public List<UserVO> getAllUsers() {
        return userDAO.getAll();
    }

    @Override
    public boolean isFieldDuplicate(String fieldName, String value, Integer userId) {
        boolean isDuplicate = userDAO.isFieldDuplicate(fieldName, value, userId);
        System.out.println("Checking duplicate for " + fieldName + ": " + value + " - Duplicate: " + isDuplicate);
        return isDuplicate;
    }

    @Override
    public boolean isAccessNumberValid(Integer accessNumber) {
        boolean isValid = userDAO.isAccessNumberValid(accessNumber);
        System.out.println("Checking access number validity: " + accessNumber + " - Valid: " + isValid);
        return isValid;
    }
}
