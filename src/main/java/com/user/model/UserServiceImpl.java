package com.user.model;

import com.administrator.model.AdministratorService;
import com.administrator.model.AdministratorServiceImpl;
import com.administrator.model.AdministratorVO;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.query.Query;

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
        updateUser(user, null);
    }

    @Override
    public void updateUser(UserVO user, Session session) throws DuplicateFieldException {
        checkDuplicateFields(user, user.getNumber());
        if (!isAccessNumberValid(user.getAccessNumber())) {
            throw new DuplicateFieldException("accessNumber", "無效的權限編號.");
        }

        // 獲取原始使用者信息
        UserVO originalUser = session != null ? session.get(UserVO.class, user.getNumber()) : userDAO.findByNumber(user.getNumber());
        Integer originalAccessNumber = originalUser.getAccessNumber();

        if (session != null) {
            session.update(user);
        } else {
            userDAO.update(user);
        }

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

    @Override
    public UserVO login(String account, String passcode, Session session) {
        String hql = "FROM UserVO WHERE account = :account AND passcode = :passcode";
        Query<UserVO> query = session.createQuery(hql, UserVO.class);
        query.setParameter("account", account);
        query.setParameter("passcode", passcode);
        return query.uniqueResult();
    }

    @Override
    public UserVO getUserByEmail(String email, Session session) {
        String hql = "FROM UserVO WHERE eMail = :email";
        Query<UserVO> query = session.createQuery(hql, UserVO.class);
        query.setParameter("email", email);
        return query.uniqueResult();
    }
    
    @Override
    public boolean checkEmailExists(String email) {
        List<UserVO> users = userDAO.findByEmail(email);
        return !users.isEmpty();
    }


    private void checkDuplicateFields(UserVO user, Integer userId) throws DuplicateFieldException {
        checkDuplicateField("account", user.getAccount(), userId);
        checkDuplicateField("name", user.getName(), userId);
        checkDuplicateField("eMail", user.geteMail(), userId);
        checkDuplicateField("nationalIdNumber", user.getNationalIdNumber(), userId);
        checkDuplicateField("telephoneNumber", user.getTelephoneNumber(), userId);
    }

    private void checkDuplicateField(String fieldName, String value, Integer userId) throws DuplicateFieldException {
        System.out.println("Checking duplicate for field: " + fieldName + " with value: " + value);
        if (isFieldDuplicate(fieldName, value, userId)) {
            System.out.println("Duplicate found for field: " + fieldName + " with value: " + value);
            throw new DuplicateFieldException(fieldName, "這個" + fieldName + "已有人使用，請試試其他" + fieldName + "。");
        }
    }

}
