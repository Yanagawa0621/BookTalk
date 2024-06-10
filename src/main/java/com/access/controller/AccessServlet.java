package com.access.controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;
import com.access.model.AccessService;
import com.access.model.AccessServiceImpl;
import com.access.model.AccessVO;

@WebServlet("/access")
public class AccessServlet extends HttpServlet {
    private AccessService accessService;

    @Override
    public void init() throws ServletException {
        accessService = new AccessServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Transaction transaction = session.beginTransaction();
            try {
                if (action == null) {
                    List<AccessVO> accessList = accessService.getAllAccesses();
                    request.setAttribute("accessList", accessList);
                    request.getRequestDispatcher("/accessList.jsp").forward(request, response);
                } else {
                    switch (action) {
                        case "delete":
                            deleteAccess(request, response, session);
                            break;
                        default:
                            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action");
                    }
                }
                transaction.commit();
            } catch (Exception e) {
                if (transaction != null) transaction.rollback();
                throw new ServletException(e);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Transaction transaction = session.beginTransaction();
            try {
                String name = request.getParameter("name");
                String accessDescribe = request.getParameter("accessDescribe");

                AccessVO access = new AccessVO();
                access.setName(name);
                access.setAccessDescribe(accessDescribe);

                accessService.addAccess(access);

                transaction.commit();
                response.sendRedirect(request.getContextPath() + "/access?action=list");
            } catch (Exception e) {
                if (transaction != null) transaction.rollback();
                throw new ServletException(e);
            }
        }
    }

    private void deleteAccess(HttpServletRequest request, HttpServletResponse response, Session session) throws ServletException, IOException {
        Integer accessNumber = Integer.parseInt(request.getParameter("accessNumber"));
        accessService.deleteAccess(accessNumber);
        response.sendRedirect(request.getContextPath() + "/access?action=list");
    }
}
