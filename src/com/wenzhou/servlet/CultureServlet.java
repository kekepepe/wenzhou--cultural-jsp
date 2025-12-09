package com.wenzhou.servlet;

import com.wenzhou.dao.CultureDao;
import com.wenzhou.model.Culture;
import com.wenzhou.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/culture")
public class CultureServlet extends HttpServlet {

    private CultureDao cultureDao = new CultureDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null)
            action = "list";

        switch (action) {
            case "list":
                listCulture(req, resp);
                break;
            case "detail":
                detailCulture(req, resp);
                break;
            case "delete":
                deleteCulture(req, resp);
                break;
            default:
                listCulture(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if ("add".equals(action)) {
            addCulture(req, resp);
        } else if ("update".equals(action)) {
            updateCulture(req, resp);
        } else {
            listCulture(req, resp);
        }
    }

    private void listCulture(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String keyword = req.getParameter("keyword");
        List<Culture> list = cultureDao.findByName(keyword);
        req.setAttribute("cultures", list);
        req.getRequestDispatcher("culture_list.jsp").forward(req, resp);
    }

    private void detailCulture(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idStr = req.getParameter("id");
        if (idStr != null) {
            int id = Integer.parseInt(idStr);
            Culture c = cultureDao.findById(id);
            req.setAttribute("culture", c);
            req.getRequestDispatcher("culture_detail.jsp").forward(req, resp);
        } else {
            resp.sendRedirect("culture");
        }
    }

    private void addCulture(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        if (!isAdmin(req)) {
            resp.sendRedirect("culture");
            return;
        }
        Culture c = new Culture();
        c.setCultureName(req.getParameter("cultureName"));
        c.setType(req.getParameter("type"));
        c.setHistory(req.getParameter("history"));
        c.setSignificance(req.getParameter("significance"));
        c.setDescription(req.getParameter("description"));
        c.setImgUrl(req.getParameter("imgUrl"));

        cultureDao.addCulture(c);
        resp.sendRedirect("culture?action=list");
    }

    private void updateCulture(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        if (!isAdmin(req)) {
            resp.sendRedirect("culture");
            return;
        }
        Culture c = new Culture();
        c.setId(Integer.parseInt(req.getParameter("id")));
        c.setCultureName(req.getParameter("cultureName"));
        c.setType(req.getParameter("type"));
        c.setHistory(req.getParameter("history"));
        c.setSignificance(req.getParameter("significance"));
        c.setDescription(req.getParameter("description"));
        c.setImgUrl(req.getParameter("imgUrl"));

        cultureDao.updateCulture(c);
        resp.sendRedirect("culture?action=list");
    }

    private void deleteCulture(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        if (!isAdmin(req)) {
            resp.sendRedirect("culture");
            return;
        }
        String idStr = req.getParameter("id");
        if (idStr != null) {
            cultureDao.deleteCulture(Integer.parseInt(idStr));
        }
        resp.sendRedirect("culture?action=list");
    }

    private boolean isAdmin(HttpServletRequest req) {
        HttpSession session = req.getSession(false);
        if (session != null) {
            User user = (User) session.getAttribute("user");
            return user != null && user.getIsAdmin() == 1;
        }
        return false;
    }
}
