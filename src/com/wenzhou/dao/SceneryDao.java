package com.wenzhou.dao;

import com.wenzhou.model.Scenery;
import com.wenzhou.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SceneryDao {

    public List<Scenery> findAll() {
        return findByName(null);
    }

    public List<Scenery> findByName(String keyword) {
        List<Scenery> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = DBUtil.getConnection();
            String sql = "SELECT * FROM t_scenery";
            if (keyword != null && !keyword.trim().isEmpty()) {
                sql += " WHERE scene_name LIKE ?";
            }
            pstmt = conn.prepareStatement(sql);
            if (keyword != null && !keyword.trim().isEmpty()) {
                pstmt.setString(1, "%" + keyword + "%");
            }
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Scenery s = new Scenery();
                s.setId(rs.getInt("id"));
                s.setSceneName(rs.getString("scene_name"));
                s.setLevel(rs.getString("level"));
                s.setTicketPrice(rs.getBigDecimal("ticket_price"));
                s.setLocation(rs.getString("location"));
                s.setDescription(rs.getString("description"));
                s.setImgUrl(rs.getString("img_url"));
                list.add(s);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(conn, pstmt, rs);
        }
        return list;
    }

    public Scenery findById(int id) {
        Scenery s = null;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = DBUtil.getConnection();
            String sql = "SELECT * FROM t_scenery WHERE id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                s = new Scenery();
                s.setId(rs.getInt("id"));
                s.setSceneName(rs.getString("scene_name"));
                s.setLevel(rs.getString("level"));
                s.setTicketPrice(rs.getBigDecimal("ticket_price"));
                s.setLocation(rs.getString("location"));
                s.setDescription(rs.getString("description"));
                s.setImgUrl(rs.getString("img_url"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(conn, pstmt, rs);
        }
        return s;
    }

    public void addScenery(Scenery s) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            conn = DBUtil.getConnection();
            String sql = "INSERT INTO t_scenery(scene_name, level, ticket_price, location, description, img_url) VALUES(?, ?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, s.getSceneName());
            pstmt.setString(2, s.getLevel());
            pstmt.setBigDecimal(3, s.getTicketPrice());
            pstmt.setString(4, s.getLocation());
            pstmt.setString(5, s.getDescription());
            pstmt.setString(6, s.getImgUrl());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(conn, pstmt);
        }
    }

    public void updateScenery(Scenery s) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            conn = DBUtil.getConnection();
            String sql = "UPDATE t_scenery SET scene_name=?, level=?, ticket_price=?, location=?, description=?, img_url=? WHERE id=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, s.getSceneName());
            pstmt.setString(2, s.getLevel());
            pstmt.setBigDecimal(3, s.getTicketPrice());
            pstmt.setString(4, s.getLocation());
            pstmt.setString(5, s.getDescription());
            pstmt.setString(6, s.getImgUrl());
            pstmt.setInt(7, s.getId());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(conn, pstmt);
        }
    }

    public void deleteScenery(int id) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            conn = DBUtil.getConnection();
            String sql = "DELETE FROM t_scenery WHERE id=?";
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
