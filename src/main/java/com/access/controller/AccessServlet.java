package com.access.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.access.model.AccessService;
import com.access.model.AccessServiceImpl;
import com.access.model.AccessVO;

@WebServlet("/access")
public class AccessServlet extends HttpServlet {

    private AccessService accessService;

    @Override
    public void init() throws ServletException {
        // 在 Servlet 初始化時初始化 AccessService
        accessService = new AccessServiceImpl(); // 需要根據實際情況來注入 AccessService 實例
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            // 如果沒有指定 action，默認顯示所有權限列表
            List<AccessVO> accessList = accessService.getAllAccess();
            request.setAttribute("accessList", accessList);
            request.getRequestDispatcher("/accessList.jsp").forward(request, response);
        } else {
            switch (action) {
                case "delete":
                    deleteAccess(request, response);
                    break;
                default:
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action");
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 讀取表單輸入
        String name = request.getParameter("name");
        String accessDescribe = request.getParameter("accessDescribe");

        // 創建 AccessVO 對象
        AccessVO access = new AccessVO();
        access.setName(name);
        access.setAccessDescribe(accessDescribe);

        // 調用 AccessService 添加權限
        accessService.addAccess(access);

        // 重定向到權限列表頁面
        response.sendRedirect(request.getContextPath() + "/access?action=list");
    }

    private void deleteAccess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 讀取權限編號
        Integer accessNumber = Integer.parseInt(request.getParameter("accessNumber"));

        // 調用 AccessService 刪除權限
        accessService.deleteAccess(accessNumber);

        // 重定向到權限列表頁面
        response.sendRedirect(request.getContextPath() + "/access?action=list");
    }
}

