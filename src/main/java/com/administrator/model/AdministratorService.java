package com.administrator.model;

import java.util.List;

public interface AdministratorService {
    void addAdministrator(AdministratorVO admin);
    void updateAdministrator(AdministratorVO admin);
    void deleteAdministrator(String account);
    AdministratorVO getAdministratorByAccount(String account);
    List<AdministratorVO> getAllAdministrators();
}
