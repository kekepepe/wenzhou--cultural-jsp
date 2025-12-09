package com.wenzhou.dao;

import com.wenzhou.model.Food;
import com.wenzhou.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FoodDao {

    public List<Food> findAll() {
        return findByName(null);
    }

    public List<Food> findByName(String keyword) {
        List<Food> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = DBUtil.getConnection();
            String sql = "SELECT * FROM t_food";
            if (keyword != null && !keyword.trim().isEmpty()) {
                sql += " WHERE food_name LIKE ?";
            }
            pstmt = conn.prepareStatement(sql);
            if (keyword != null && !keyword.trim().isEmpty()) {
                pstmt.setString(1, "%" + keyword + "%");
            }
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Food food = new Food();
                food.setId(rs.getInt("id"));
                food.setFoodName(rs.getString("food_name"));
                food.setTaste(rs.getString("taste"));
                food.setPrice(rs.getBigDecimal("price"));
                food.setDescription(rs.getString("description"));
                food.setImgUrl(rs.getString("img_url"));
                list.add(food);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(conn, pstmt, rs);
        }
        return list;
    }

    public Food findById(int id) {
        Food food = null;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = DBUtil.getConnection();
            String sql = "SELECT * FROM t_food WHERE id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                food = new Food();
                food.setId(rs.getInt("id"));
                food.setFoodName(rs.getString("food_name"));
                food.setTaste(rs.getString("taste"));
                food.setPrice(rs.getBigDecimal("price"));
                food.setDescription(rs.getString("description"));
                food.setImgUrl(rs.getString("img_url"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(conn, pstmt, rs);
        }
        return food;
    }

    public void addFood(Food food) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            conn = DBUtil.getConnection();
            String sql = "INSERT INTO t_food(food_name, taste, price, description, img_url) VALUES(?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, food.getFoodName());
            pstmt.setString(2, food.getTaste());
            pstmt.setBigDecimal(3, food.getPrice());
            pstmt.setString(4, food.getDescription());
            pstmt.setString(5, food.getImgUrl());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(conn, pstmt);
        }
    }

    public void updateFood(Food food) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            conn = DBUtil.getConnection();
            String sql = "UPDATE t_food SET food_name=?, taste=?, price=?, description=?, img_url=? WHERE id=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, food.getFoodName());
            pstmt.setString(2, food.getTaste());
            pstmt.setBigDecimal(3, food.getPrice());
            pstmt.setString(4, food.getDescription());
            pstmt.setString(5, food.getImgUrl());
            pstmt.setInt(6, food.getId());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(conn, pstmt);
        }
    }

    public void deleteFood(int id) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            conn = DBUtil.getConnection();
            String sql = "DELETE FROM t_food WHERE id=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(conn, pstmt);
        }
    }
}
