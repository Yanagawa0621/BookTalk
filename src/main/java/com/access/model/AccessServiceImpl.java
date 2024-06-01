package com.access.model;

import java.util.List;

public class AccessServiceImpl implements AccessService {

    private AccessDAO_interface accessDAO;

    public AccessServiceImpl(AccessDAO_interface accessDAO) {
        this.accessDAO = accessDAO;
    }

    @Override
    public void addAccess(AccessVO access) {
        accessDAO.save(access);
    }

    @Override
    public void updateAccess(AccessVO access) {
        accessDAO.update(access);
    }

    @Override
    public void deleteAccess(Integer accessNumber) {
        accessDAO.delete(accessNumber);
    }

    @Override
    public AccessVO getAccessByNumber(Integer accessNumber) {
        return accessDAO.findByPrimaryKey(accessNumber);
    }

    @Override
    public List<AccessVO> getAllAccesses() {
        return accessDAO.getAll();
    }
}
