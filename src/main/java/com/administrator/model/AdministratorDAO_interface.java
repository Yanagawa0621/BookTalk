package com.administrator.model;

import java.util.List;

public interface AdministratorDAO_interface {
    void save(AdministratorVO admin);
    void update(AdministratorVO admin);
    void delete(AdministratorVO admin);
    AdministratorVO findByAccount(String account);
    List<AdministratorVO> findAll();
}
