package com.access.model;

import java.util.List;

public interface AccessDAO_interface {
    void save(AccessVO access);
    void update(AccessVO access);
    void delete(Integer accessNumber);
    AccessVO findByPrimaryKey(Integer accessNumber);
    List<AccessVO> getAll();
}
