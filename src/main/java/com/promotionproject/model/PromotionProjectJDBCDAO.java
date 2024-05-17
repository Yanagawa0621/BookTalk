package com.promotionproject.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.JDBCUtil;


public class PromotionProjectJDBCDAO implements PromotionProjectDAO_interface {
	private static final String INSERT_STMT = 
		"INSERT INTO promotion_project (PromotionProjectName, PromotionStartDate, PromotionLastDate, title, content, picture) VALUES (?, ?, ?, ?, ?, ?)";
	private static final String UPDATE = 
		"UPDATE promotion_project set PromotionProjectName=?, PromotionStartDate=?, PromotionLastDate=?, title=?, content=?, picture=? where PromotionProjectNumber = ?";
	private static final String GET_ONE_STMT = 
		"SELECT * FROM promotion_project where PromotionProjectNumber = ?";
	private static final String GET_ALL_STMT = 
		"SELECT * FROM promotion_project order by PromotionProjectNumber";

	static {
		try {
			Class.forName(JDBCUtil.DRIVER);
		}catch(ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
		}
	}
	
	@Override
	public void insert(PromotionProjectVO promotionProjectVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = DriverManager.getConnection(JDBCUtil.URL, JDBCUtil.USER, JDBCUtil.PASSWORD);
			pstmt = con.prepareStatement(INSERT_STMT);
			
			pstmt.setString(1, promotionProjectVO.getPromotionProjectName());
			pstmt.setDate(2, promotionProjectVO.getPromotionStartDate());
			pstmt.setDate(3, promotionProjectVO.getPromotionLastDate());
			pstmt.setString(4, promotionProjectVO.getTitle());
			pstmt.setString(5, promotionProjectVO.getContent());
			pstmt.setBytes(6, promotionProjectVO.getPicture());
			
			pstmt.executeUpdate();
			
			
		}catch(SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
		}finally {
			JDBCUtil.closeResources(con, pstmt, null);
		}
	}

	@Override
	public void update(PromotionProjectVO promotionProjectVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = DriverManager.getConnection(JDBCUtil.URL, JDBCUtil.USER, JDBCUtil.PASSWORD);
			pstmt = con.prepareStatement(UPDATE);
			
			pstmt.setString(1, promotionProjectVO.getPromotionProjectName());
			pstmt.setDate(2, promotionProjectVO.getPromotionStartDate());
			pstmt.setDate(3, promotionProjectVO.getPromotionLastDate());
			pstmt.setString(4, promotionProjectVO.getTitle());
			pstmt.setString(5, promotionProjectVO.getContent());
			pstmt.setBytes(6, promotionProjectVO.getPicture());
			pstmt.setInt(7, promotionProjectVO.getPromotionProjectNumber());
			
			pstmt.executeUpdate();
			
			
		}catch(SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
		}finally {
			JDBCUtil.closeResources(con, pstmt, null);
		}
		
	}

	@Override
	public PromotionProjectVO findByPrimaryKey(Integer promotionProjectNumber) {
		PromotionProjectVO promotionProjectVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = DriverManager.getConnection(JDBCUtil.URL, JDBCUtil.USER, JDBCUtil.PASSWORD);
			pstmt = con.prepareStatement(GET_ONE_STMT);
			
			pstmt.setInt(1, promotionProjectNumber);
			
			rs = pstmt.executeQuery();
					
			while(rs.next()) {
				promotionProjectVO = new PromotionProjectVO();
				promotionProjectVO.setPromotionProjectNumber(rs.getInt("promotionProjectNumber"));
				promotionProjectVO.setPromotionProjectName(rs.getString("promotionProjectName"));
				promotionProjectVO.setPromotionStartDate(rs.getDate("promotionStartDate"));
				promotionProjectVO.setPromotionLastDate(rs.getDate("promotionLastDate"));
				promotionProjectVO.setTitle(rs.getString("title"));
				promotionProjectVO.setContent(rs.getString("content"));
				promotionProjectVO.setPicture(rs.getBytes("picture"));
			}			

			
		}catch(SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
		}finally {
			JDBCUtil.closeResources(con, pstmt, rs);
		}
			
		return promotionProjectVO;
	}

	@Override
	public List<PromotionProjectVO> getAll() {
		List<PromotionProjectVO> list = new ArrayList<>();
		PromotionProjectVO promotionProjectVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = DriverManager.getConnection(JDBCUtil.URL, JDBCUtil.USER, JDBCUtil.PASSWORD);
			pstmt = con.prepareStatement(GET_ALL_STMT);			
			rs = pstmt.executeQuery();
					
			while(rs.next()) {
				promotionProjectVO = new PromotionProjectVO();
				promotionProjectVO.setPromotionProjectNumber(rs.getInt("promotionProjectNumber"));
				promotionProjectVO.setPromotionProjectName(rs.getString("promotionProjectName"));
				promotionProjectVO.setPromotionStartDate(rs.getDate("promotionStartDate"));
				promotionProjectVO.setPromotionLastDate(rs.getDate("promotionLastDate"));
				promotionProjectVO.setTitle(rs.getString("title"));
				promotionProjectVO.setContent(rs.getString("content"));
				promotionProjectVO.setPicture(rs.getBytes("picture"));
				list.add(promotionProjectVO);
			}			
			
		}catch(SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
		}finally {
			JDBCUtil.closeResources(con, pstmt, rs);
		}
		
		return list;
	}
	
	
	public static void main(String[] args) {
			PromotionProjectJDBCDAO dao = new PromotionProjectJDBCDAO();
			
			//新增
//			PromotionProjectVO pPV01 = new PromotionProjectVO();
//			pPV01.setPromotionProjectName("開始就是進步的一小步");
//			pPV01.setPromotionStartDate(java.sql.Date.valueOf("2024-04-11"));
//			pPV01.setPromotionLastDate(java.sql.Date.valueOf("2024-04-15"));
//			pPV01.setTitle("就是現在");
//			pPV01.setContent("就是現在!!就是現在!!就是現在!!就是現在!!就是現在!!");
//			pPV01.setPicture(null);
//			dao.insert(pPV01);
			
			
			//修改
//			PromotionProjectVO pPV02 = new PromotionProjectVO();
//			pPV02.setPromotionProjectNumber(2);
//			pPV02.setPromotionProjectName("開始就是進步的一小步");
//			pPV02.setPromotionStartDate(java.sql.Date.valueOf("2024-04-11"));
//			pPV02.setPromotionLastDate(java.sql.Date.valueOf("2024-04-15"));
//			pPV02.setTitle("就是現在");
//			pPV02.setContent("就是現在!!就是現在!!就是現在!!就是現在!!就是現在!!");
//			pPV02.setPicture(null);
//			dao.update(pPV02);
			
			
			
//			//單一查詢
//			PromotionProjectVO pPV03 = dao.findByPrimaryKey(2);
//			
//			System.out.print(pPV03.getPromotionProjectNumber() + ",");
//			System.out.print(pPV03.getPromotionProjectName() + ",");
//			System.out.print(pPV03.getPromotionStartDate()+ ",");
//			System.out.print(pPV03.getPromotionLastDate() + ",");
//			System.out.print(pPV03.getTitle() + ",");
//			System.out.print(pPV03.getContent() + ",");
//			System.out.print(pPV03.getPicture());
//			System.out.println();
					

			//查詢全部
			List<PromotionProjectVO> list = dao.getAll();
			for (PromotionProjectVO aPP : list) {
				System.out.print(aPP.getPromotionProjectNumber() + ",");
				System.out.print(aPP.getPromotionProjectName() + ",");
				System.out.print(aPP.getPromotionStartDate()+ ",");
				System.out.print(aPP.getPromotionLastDate() + ",");
				System.out.print(aPP.getTitle() + ",");
				System.out.print(aPP.getContent() + ",");
				System.out.print(aPP.getPicture());
				System.out.println();
			}
	
	}
}
