package com.wenzhou.servlet;

import com.wenzhou.dao.SceneryDao;
import com.wenzhou.model.Scenery;
import com.wenzhou.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

@WebServlet("/scenery")
public class SceneryServlet extends HttpServlet {

    private SceneryDao sceneryDao = new SceneryDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null)
            action = "list";

        switch (action) {
            case "list":
                listScenery(req, resp);
                break;
            case "detail":
                detailScenery(req, resp);
                break;
            case "delete":
                deleteScenery(req, resp);
                break;
            default:
                listScenery(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if ("add".equals(action)) {
            addScenery(req, resp);
        } else if ("update".equals(action)) {
            updateScenery(req, resp);
        } else {
            listScenery(req, resp);
        }
    }

    private void listScenery(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String keyword = req.getParameter("keyword");
        List<Scenery> list = sceneryDao.findByName(keyword);
        req.setAttribute("sceneries", list);
        req.getRequestDispatcher("scenery_list.jsp").forward(req, resp);
    }

    private void detailScenery(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idStr = req.getParameter("id");
        if (idStr != null) {
            int id = Integer.parseInt(idStr);
            Scenery s = sceneryDao.findById(id);
            req.setAttribute("scenery", s);
            req.getRequestDispatcher("scenery_detail.jsp").forward(req, resp);
        } else {
            resp.sendRedirect("scenery");
        }
    }

    private void addScenery(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        if (!isAdmin(req)) {
            resp.sendRedirect("scenery");
            return;
        }
        Scenery s = new Scenery();
        s.setSceneName(req.getParameter("sceneName"));
        s.setLevel(req.getParameter("level"));
        s.setTicketPrice(new BigDecimal(req.getParameter("ticketPrice")));
        s.setLocation(req.getParameter("location"));
        s.setDescription(req.getParameter("description"));
        s.setImgUrl(req.getParameter("imgUrl"));

        sceneryDao.addScenery(s);
        resp.sendRedirect("scenery?action=list");
    }

    private void updateScenery(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        if (!isAdmin(req)) {
            resp.sendRedirect("scenery");
            return;
        }
        Scenery s = new Scenery();
        s.setId(Integer.parseInt(req.getParameter("id")));
        s.setSceneName(req.getParameter("sceneName"));
        s.setLevel(req.getParameter("level"));
        s.setTicketPrice(new BigDecimal(req.getParameter("ticketPrice")));
        s.setLocation(req.getParameter("location"));
        s.setDescription(req.getParameter("description"));
        s.setImgUrl(req.getParameter("imgUrl"));

        sceneryDao.updateScenery(s);
        resp.sendRedirect("scenery?action=list");
    }

    private void deleteScenery(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        if (!isAdmin(req)) {
            resp.sendRedirect("scenery");
            return;
        }
        String idStr = req.getParameter("id");
        if (idStr != null) {
            sceneryDao.deleteScenery(Integer.parseInt(idStr));
        }
        resp.sendRedirect("scenery?action=list");
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
