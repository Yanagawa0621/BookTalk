package com.administrator.model;

import java.util.List;

public interface AdministratorDAO_interface {
    void save(AdministratorVO admin);
    void update(AdministratorVO admin);
    void delete(String account);
    AdministratorVO getByAccount(String account);
    List<AdministratorVO> getAll();
}