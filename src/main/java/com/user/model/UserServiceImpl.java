package com.user.model;

import com.administrator.model.AdministratorService;
import com.administrator.model.AdministratorServiceImpl;
import com.administrator.model.AdministratorVO;
import java.util.List;

public class UserServiceImpl implements UserService {
    private final UserDAO_interface userDAO;
    private final AdministratorService adminService;

    public UserServiceImpl() {
        this.userDAO = new UserDAO(); // 使用預設構造方法
        this.adminService = new AdministratorServiceImpl();
    }

    public UserServiceImpl(UserDAO_interface userDAO) {
        this.userDAO = userDAO;
        this.adminService = new AdministratorServiceImpl();
    }

    @Override
    public void addUser(UserVO user) throws DuplicateFieldException {
        checkDuplicateFields(user, null);
        if (!isAccessNumberValid(user.getAccessNumber())) {
            throw new DuplicateFieldException("accessNumber", "無效的權限編號.");
        }
        userDAO.save(user);

        // 如果新權限是 "後台管理員"
        if (user.getAccessNumber() == 2) {
            AdministratorVO admin = new AdministratorVO();
            admin.setAccount(user.getAccount());
            admin.setName(user.getName());
            admin.setPasscode(user.getPasscode());
            adminService.addAdministrator(admin);
        }
    }

    @Override
    public void updateUser(UserVO user) throws DuplicateFieldException {
        checkDuplicateFields(user, user.getNumber());
        if (!isAccessNumberValid(user.getAccessNumber())) {
            throw new DuplicateFieldException("accessNumber", "無效的權限編號.");
        }

        // 獲取原始使用者信息
        UserVO originalUser = userDAO.findByNumber(user.getNumber());
        Integer originalAccessNumber = originalUser.getAccessNumber();

        userDAO.update(user);

        // 如果原始權限是 "一般會員" 並且新權限是 "後台管理員"
        if (originalAccessNumber == 1 && user.getAccessNumber() == 2) {
            AdministratorVO admin = new AdministratorVO();
            admin.setAccount(user.getAccount());
            admin.setName(user.getName());
            admin.setPasscode(user.getPasscode());
            adminService.addAdministrator(admin);
        } else if (originalAccessNumber == 2 && user.getAccessNumber() != 2) { // 如果從 "後台管理員" 變更為其他角色
            adminService.deleteAdministrator(user.getAccount());
        } else if (user.getAccessNumber() == 2) { // 如果新權限是 "後台管理員"
            AdministratorVO admin = adminService.getAdministratorByAccount(user.getAccount());
            if (admin == null) {
                admin = new AdministratorVO();
                admin.setAccount(user.getAccount());
                admin.setPasscode(user.getPasscode());
                admin.setName(user.getName());
                adminService.addAdministrator(admin);
            } else {
                admin.setPasscode(user.getPasscode());
                admin.setName(user.getName());
                adminService.updateAdministrator(admin);
            }
        }
    }

    @Override
    public void updateUserRole(UserVO user) throws DuplicateFieldException {
        // 調用更新用戶方法
        updateUser(user);
    }

    @Override
    public void deleteUser(Integer number) {
        // 獲取要刪除的用戶信息
        UserVO user = userDAO.findByNumber(number);
        if (user.getAccessNumber() == 2) {
            // 刪除後台管理員對應的記錄
            adminService.deleteAdministrator(user.getAccount());
        }
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
    public List<UserVO> getUsersByRole(int role) {
        return userDAO.getUsersByRole(role);
    }

    @Override
    public boolean isFieldDuplicate(String fieldName, String value, Integer userId) {
        return userDAO.isFieldDuplicate(fieldName, value, userId);
    }

    @Override
    public boolean isAccessNumberValid(Integer accessNumber) {
        return userDAO.isAccessNumberValid(accessNumber);
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
            throw new DuplicateFieldException(fieldName, "這個" + fieldName + "已有人使用，請試試其他" + fieldName + "。");
        }
    }
}