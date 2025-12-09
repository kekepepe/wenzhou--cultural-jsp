package com.wenzhou.servlet;

import com.wenzhou.dao.FoodDao;
import com.wenzhou.model.Food;
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

@WebServlet("/food")
public class FoodServlet extends HttpServlet {

    private FoodDao foodDao = new FoodDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null)
            action = "list";

        switch (action) {
            case "list":
                listFood(req, resp);
                break;
            case "detail":
                detailFood(req, resp);
                break;
            case "delete":
                deleteFood(req, resp);
                break;
            default:
                listFood(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if ("add".equals(action)) {
            addFood(req, resp);
        } else if ("update".equals(action)) {
            updateFood(req, resp);
        } else {
            listFood(req, resp);
        }
    }

    private void listFood(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String keyword = req.getParameter("keyword");
        List<Food> foods = foodDao.findByName(keyword);
        req.setAttribute("foods", foods);
        req.getRequestDispatcher("food_list.jsp").forward(req, resp);
    }

    private void detailFood(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idStr = req.getParameter("id");
        if (idStr != null) {
            int id = Integer.parseInt(idStr);
            Food food = foodDao.findById(id);
            req.setAttribute("food", food);
            req.getRequestDispatcher("food_detail.jsp").forward(req, resp);
        } else {
            resp.sendRedirect("food");
        }
    }

    private void addFood(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        if (!isAdmin(req)) {
            resp.sendRedirect("food"); // or error page
            return;
        }
        Food food = new Food();
        food.setFoodName(req.getParameter("foodName"));
        food.setTaste(req.getParameter("taste"));
        food.setPrice(new BigDecimal(req.getParameter("price")));
        food.setDescription(req.getParameter("description"));
        food.setImgUrl(req.getParameter("imgUrl"));

        foodDao.addFood(food);
        resp.sendRedirect("food?action=list");
    }

    private void updateFood(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        if (!isAdmin(req)) {
            resp.sendRedirect("food");
            return;
        }
        Food food = new Food();
        food.setId(Integer.parseInt(req.getParameter("id")));
        food.setFoodName(req.getParameter("foodName"));
        food.setTaste(req.getParameter("taste"));
        food.setPrice(new BigDecimal(req.getParameter("price")));
        food.setDescription(req.getParameter("description"));
        food.setImgUrl(req.getParameter("imgUrl"));

        foodDao.updateFood(food);
        resp.sendRedirect("food?action=list");
    }

    private void deleteFood(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        if (!isAdmin(req)) {
            resp.sendRedirect("food");
            return;
        }
        String idStr = req.getParameter("id");
        if (idStr != null) {
            foodDao.deleteFood(Integer.parseInt(idStr));
        }
        resp.sendRedirect("food?action=list");
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
