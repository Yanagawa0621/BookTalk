package com.forum.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.Util;

public class ForumDAO implements ForumDAO_interface {

	static {
		try {
			Class.forName(Util.DRIVER);
		} catch (ClassNotFoundException ce) {
			ce.printStackTrace();
		}
	}
	private static final String INSERT_STMT = "INSERT INTO forum (name) VALUES (?)";
	private static final String SELECT_ALL_STMT = "SELECT * FROM forum";
	private static final String SELECT_ONE_STMT = "SELECT * FROM forum WHERE forumNumber = ?";
	private static final String DELETE_STMT = "DELETE FROM forum WHERE forumNumber = ?";
	private static final String UPDATE_STMT = "UPDATE forum SET name = ? WHERE forumNumber = ?";
	private static final String SELECT_NAME_STMT = "SELECT * FROM forum WHERE name LIKE CONCAT('%', ?, '%')";

	@Override
	public void insert(ForumVO forumVO) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(INSERT_STMT);

			
			pstmt.setString(1, forumVO.getName());

			pstmt.executeUpdate();
			// Handle any driver errors
		} catch (SQLException se) {
			se.printStackTrace();
			// Clean up JDBC resources
		} finally {
			Util.closeResources(con, pstmt, null);
		}

	}

	@Override
	public void update(ForumVO forumVO) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(UPDATE_STMT);

			pstmt.setString(1, forumVO.getName());
			pstmt.setInt(2, forumVO.getForumNumber());
			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (SQLException se) {
			se.printStackTrace();
			// Clean up JDBC resources
		} finally {
			Util.closeResources(con, pstmt, null);
		}

	}

	@Override
	public void delete(Integer forumNumber) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(DELETE_STMT);

			pstmt.setInt(1, forumNumber);
			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (SQLException se) {
			se.printStackTrace();
			// Clean up JDBC resources
		} finally {
			Util.closeResources(con, pstmt, null);
		}
	}

	@Override
	public ForumVO findByForumNumber(Integer forumNumber) {
		// TODO Auto-generated method stub
		ForumVO forumVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(SELECT_ONE_STMT);
			pstmt.setInt(1, forumNumber);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				forumVO = new ForumVO();
				forumVO.setForumNumber(rs.getInt("forumNumber"));
				forumVO.setName(rs.getString("name"));
			}

		} catch (SQLException se) {
			se.printStackTrace();
			// Clean up JDBC resources
		} finally {
			Util.closeResources(con, pstmt, rs);
		}
		return forumVO;
	}

	@Override
	public List<ForumVO> getAll() {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ForumVO> forumList = new ArrayList<>();
		ForumVO forumVO = null;
		try {
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(SELECT_ALL_STMT);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				forumVO = new ForumVO();
				forumVO.setForumNumber(rs.getInt("forumNumber"));
				forumVO.setName(rs.getString("name"));
				forumList.add(forumVO);
			}
		} catch (SQLException se) {
			se.printStackTrace();

		} finally {
			Util.closeResources(con, pstmt, rs);
		}
		return forumList;

	}

	@Override
	public List<ForumVO> findByForumName(String name) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ForumVO> forumList = new ArrayList<>();
		ForumVO forumVO = null;
		try {
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(SELECT_NAME_STMT);
			System.out.println(name);
			pstmt.setString(1, name);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				forumVO = new ForumVO();
				forumVO.setForumNumber(rs.getInt("forumNumber"));
				forumVO.setName(rs.getString("name"));
				forumList.add(forumVO);
			}
		} catch (SQLException se) {
			se.printStackTrace();

		} finally {
			Util.closeResources(con, pstmt, rs);
		}
		return forumList;
	}

//	public static void main(String[] args) {
////
//		ForumDAO forum = new ForumDAO();
//		ForumVO forumvo = forum.findByForumNumber(1);
//		System.out.println(forumvo.getForumNumber() + ",");
//		System.out.println(forumvo.getName());
//		
//		List<ForumVO> list = forum.findByForumName("版");
//		for (ForumVO aEmp : list) {
//			System.out.print(aEmp.getForumNumber() + ",");
//			System.out.print(aEmp.getName() + ",");
//
//		}
//		ForumVO forumVO = new ForumVO();
//		forumVO.setName("書版");
//		forum.insert(forumVO);
//	}

}
