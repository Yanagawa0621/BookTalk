package com.administrator.model;

import java.util.List;

public class AdministratorServiceImpl implements AdministratorService {

    private AdministratorDAO_interface adminDAO;

    public AdministratorServiceImpl(AdministratorDAO_interface adminDAO) {
        this.adminDAO = adminDAO;
    }

    @Override
    public void addAdministrator(AdministratorVO admin) {
        adminDAO.save(admin);
    }

    @Override
    public void updateAdministrator(AdministratorVO admin) {
        adminDAO.update(admin);
    }

    @Override
    public void deleteAdministrator(String account) {
        AdministratorVO admin = adminDAO.findByAccount(account);
        if (admin != null) {
            adminDAO.delete(admin);
        }
    }

    @Override
    public AdministratorVO getAdministratorByAccount(String account) {
        return adminDAO.findByAccount(account);
    }

    @Override
    public List<AdministratorVO> getAllAdministrators() {
        return adminDAO.findAll();
    }
}
