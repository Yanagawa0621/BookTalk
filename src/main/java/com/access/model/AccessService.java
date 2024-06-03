package com.access.model;

import java.util.List;

public interface AccessService {
    void addAccess(AccessVO access);
    void updateAccess(AccessVO access);
    void deleteAccess(Integer accessNumber);
    AccessVO getAccessByNumber(Integer accessNumber);
    List<AccessVO> getAllAccesses();
}
