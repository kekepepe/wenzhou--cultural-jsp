package com.wenzhou.dao;

import com.wenzhou.model.Culture;
import com.wenzhou.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CultureDao {

    public List<Culture> findAll() {
        return findByName(null);
    }

    public List<Culture> findByName(String keyword) {
        List<Culture> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = DBUtil.getConnection();
            String sql = "SELECT * FROM t_culture";
            if (keyword != null && !keyword.trim().isEmpty()) {
                sql += " WHERE culture_name LIKE ?";
            }
            pstmt = conn.prepareStatement(sql);
            if (keyword != null && !keyword.trim().isEmpty()) {
                pstmt.setString(1, "%" + keyword + "%");
            }
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Culture c = new Culture();
                c.setId(rs.getInt("id"));
                c.setCultureName(rs.getString("culture_name"));
                c.setType(rs.getString("type"));
                c.setHistory(rs.getString("history"));
                c.setSignificance(rs.getString("significance"));
                c.setDescription(rs.getString("description"));
                c.setImgUrl(rs.getString("img_url"));
                list.add(c);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(conn, pstmt, rs);
        }
        return list;
    }

    public Culture findById(int id) {
        Culture c = null;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = DBUtil.getConnection();
            String sql = "SELECT * FROM t_culture WHERE id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                c = new Culture();
                c.setId(rs.getInt("id"));
                c.setCultureName(rs.getString("culture_name"));
                c.setType(rs.getString("type"));
                c.setHistory(rs.getString("history"));
                c.setSignificance(rs.getString("significance"));
                c.setDescription(rs.getString("description"));
                c.setImgUrl(rs.getString("img_url"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(conn, pstmt, rs);
        }
        return c;
    }

    public void addCulture(Culture c) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            conn = DBUtil.getConnection();
            String sql = "INSERT INTO t_culture(culture_name, type, history, significance, description, img_url) VALUES(?, ?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, c.getCultureName());
            pstmt.setString(2, c.getType());
            pstmt.setString(3, c.getHistory());
            pstmt.setString(4, c.getSignificance());
            pstmt.setString(5, c.getDescription());
            pstmt.setString(6, c.getImgUrl());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(conn, pstmt);
        }
    }

    public void updateCulture(Culture c) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            conn = DBUtil.getConnection();
            String sql = "UPDATE t_culture SET culture_name=?, type=?, history=?, significance=?, description=?, img_url=? WHERE id=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, c.getCultureName());
            pstmt.setString(2, c.getType());
            pstmt.setString(3, c.getHistory());
            pstmt.setString(4, c.getSignificance());
            pstmt.setString(5, c.getDescription());
            pstmt.setString(6, c.getImgUrl());
            pstmt.setInt(7, c.getId());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(conn, pstmt);
        }
    }

    public void deleteCulture(int id) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            conn = DBUtil.getConnection();
            String sql = "DELETE FROM t_culture WHERE id=?";
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
