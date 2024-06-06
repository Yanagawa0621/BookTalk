package com.administrator.model;

import com.user.model.UserVO;
import java.util.List;

public interface AdministratorService {
    List<AdministratorVO> getAllAdministrators();
    AdministratorVO getAdministratorByAccount(String account);
    void addAdministrator(AdministratorVO admin);
    void updateAdministrator(AdministratorVO admin);
    void deleteAdministrator(String account);
    UserVO getUserByNumber(int number); // 添加這行
}
