package com.wenzhou.servlet;

import com.wenzhou.dao.UserDao;
import com.wenzhou.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    private UserDao userDao = new UserDao();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String realname = req.getParameter("realname");
        String phone = req.getParameter("phone");
        String email = req.getParameter("email");
        String address = req.getParameter("address");

        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setRealname(realname);
        user.setPhone(phone);
        user.setEmail(email);
        user.setAddress(address);

        boolean success = userDao.register(user);

        if (success) {
            // Register Success
            req.setAttribute("msg", "Registration successful. Please login.");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        } else {
            // Register Failed
            req.setAttribute("msg", "Registration failed. Username may already exist.");
            req.getRequestDispatcher("register.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("register.jsp").forward(req, resp);
    }
}
