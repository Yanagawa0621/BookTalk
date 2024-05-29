package com.order.model;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import util.JDBCUtil;

public class OrderJDBCDAO implements OrderDAO_interface {
	private static final String INSERT_STMT = 
			"INSERT INTO customer_order (userNumber, receiver, shippingAddress, deliveryFee, total, note) VALUES (?, ?, ?, ?, ?, ?)";
	private static final String UPDATE = 
			"UPDATE customer_order set orderStatus=?, shippingTime=?, completeTime=?, receiver=?, shippingAddress=?, deliveryFee=?, total=?, note=? where orderNumber = ?";
	private static final String GET_ONE_STMT_BY_PK = 
			"SELECT * FROM customer_order where orderNumber = ?";
	private static final String GET_ALL_STMT = 
			"SELECT * FROM customer_order order by orderNumber";
	private static final String GET_STMT_BY_USER_NUMBER =
			"SELECT * FROM customer_order where userNumber = ? order by userNumber";
	private static final String GET_USER_NUMBER =
			"SELECT DISTINCT userNumber FROM customer_order";
	private static final String GET_STMT_BY_ORDER_STATUS =
			"SELECT * FROM customer_order where orderStatus = ? order by orderNumber";
	
	static {
		try {
			Class.forName(JDBCUtil.DRIVER);
		}catch(ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
		}
	}
	
	
	@Override
	public int insert(OrderVO orderVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = DriverManager.getConnection(JDBCUtil.URL, JDBCUtil.USER, JDBCUtil.PASSWORD);
			pstmt = con.prepareStatement(INSERT_STMT);
			
			pstmt.setInt(1, orderVO.getUserNumber());
			pstmt.setString(2, orderVO.getReceiver());
			pstmt.setString(3, orderVO.getShippingAddress());
			pstmt.setBigDecimal(4, orderVO.getDeliveryFee());
			pstmt.setBigDecimal(5, orderVO.getTotal());
			pstmt.setString(6, orderVO.getNote());
			
			return pstmt.executeUpdate();
			
			
		}catch(SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
		}finally {
			JDBCUtil.closeResources(con, pstmt, null);
		}
	}

	@Override
	public int update(OrderVO orderVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = DriverManager.getConnection(JDBCUtil.URL, JDBCUtil.USER, JDBCUtil.PASSWORD);
			pstmt = con.prepareStatement(UPDATE);
			
			pstmt.setInt(1, orderVO.getOrderStatus());
			pstmt.setTimestamp(2, orderVO.getShippingTime());
			pstmt.setTimestamp(3, orderVO.getCompleteTime());
			pstmt.setString(4, orderVO.getReceiver());
			pstmt.setString(5, orderVO.getShippingAddress());
			pstmt.setBigDecimal(6, orderVO.getDeliveryFee());
			pstmt.setBigDecimal(7, orderVO.getTotal());
			pstmt.setString(8, orderVO.getNote());
			pstmt.setInt(9, orderVO.getOrderNumber());
			

			return pstmt.executeUpdate();
			
			
		}catch(SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
		}finally {
			JDBCUtil.closeResources(con, pstmt, null);
		}
	}

	@Override
	public OrderVO findByPrimaryKey(Integer orderNumber) {
		OrderVO orderVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = DriverManager.getConnection(JDBCUtil.URL, JDBCUtil.USER, JDBCUtil.PASSWORD);
			pstmt = con.prepareStatement(GET_ONE_STMT_BY_PK);
			
			pstmt.setInt(1, orderNumber);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				orderVO = new OrderVO();
				orderVO.setOrderNumber(orderNumber);
				orderVO.setUserNumber(rs.getInt("userNumber"));
				orderVO.setOrderStatus(rs.getInt("orderStatus"));
				orderVO.setEstablishmentTime(rs.getTimestamp("establishmentTime"));
				orderVO.setShippingTime(rs.getTimestamp("shippingTime"));
				orderVO.setCompleteTime(rs.getTimestamp("completeTime"));		
				orderVO.setReceiver(rs.getString("receiver"));
				orderVO.setShippingAddress(rs.getString("shippingAddress"));
				orderVO.setDeliveryFee(rs.getBigDecimal("deliveryFee"));
				orderVO.setTotal(rs.getBigDecimal("total"));
				orderVO.setNote(rs.getString("note"));
			}
			
			
		}catch(SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
		}finally {
			JDBCUtil.closeResources(con, pstmt, rs);
		}
		
		return orderVO;
	}

	@Override
	public List<OrderVO> getAll() {
		List<OrderVO> list = new ArrayList<>();
		OrderVO orderVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = DriverManager.getConnection(JDBCUtil.URL, JDBCUtil.USER, JDBCUtil.PASSWORD);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				orderVO = new OrderVO();
				orderVO.setOrderNumber(rs.getInt("orderNumber"));
				orderVO.setUserNumber(rs.getInt("userNumber"));
				orderVO.setOrderStatus(rs.getInt("orderStatus"));
				orderVO.setEstablishmentTime(rs.getTimestamp("establishmentTime"));
				orderVO.setShippingTime(rs.getTimestamp("shippingTime"));
				orderVO.setCompleteTime(rs.getTimestamp("completeTime"));		
				orderVO.setReceiver(rs.getString("receiver"));
				orderVO.setShippingAddress(rs.getString("shippingAddress"));
				orderVO.setDeliveryFee(rs.getBigDecimal("deliveryFee"));
				orderVO.setTotal(rs.getBigDecimal("total"));
				orderVO.setNote(rs.getString("note"));
				list.add(orderVO);
			}
			
			
		}catch(SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
		}finally {
			JDBCUtil.closeResources(con, pstmt, rs);
		}
		
		
		return list;
	}
	
	@Override
	public List<OrderVO> findByUserNumber(Integer userNumber) {
		List<OrderVO> list = new ArrayList<>();
		OrderVO orderVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = DriverManager.getConnection(JDBCUtil.URL, JDBCUtil.USER, JDBCUtil.PASSWORD);
			pstmt = con.prepareStatement(GET_STMT_BY_USER_NUMBER);
			
			pstmt.setInt(1, userNumber);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				orderVO = new OrderVO();
				orderVO.setOrderNumber(rs.getInt("orderNumber"));
				orderVO.setUserNumber(rs.getInt("userNumber"));
				orderVO.setOrderStatus(rs.getInt("orderStatus"));
				orderVO.setEstablishmentTime(rs.getTimestamp("establishmentTime"));
				orderVO.setShippingTime(rs.getTimestamp("shippingTime"));
				orderVO.setCompleteTime(rs.getTimestamp("completeTime"));		
				orderVO.setReceiver(rs.getString("receiver"));
				orderVO.setShippingAddress(rs.getString("shippingAddress"));
				orderVO.setDeliveryFee(rs.getBigDecimal("deliveryFee"));
				orderVO.setTotal(rs.getBigDecimal("total"));
				orderVO.setNote(rs.getString("note"));
				list.add(orderVO);
			}
			
			
		}catch(SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
		}finally {
			JDBCUtil.closeResources(con, pstmt, rs);
		}

		return list;
	}
	
	@Override
	public List<Integer> getUserNumber() {
		List<Integer> list = new ArrayList<>();
		Integer userNubmer = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = DriverManager.getConnection(JDBCUtil.URL, JDBCUtil.USER, JDBCUtil.PASSWORD);
			pstmt = con.prepareStatement(GET_USER_NUMBER);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				userNubmer = rs.getInt("userNumber");
				list.add(userNubmer);
			}
			
			
		}catch(SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
		}finally {
			JDBCUtil.closeResources(con, pstmt, rs);
		}
		
		return list;
	}
	
	@Override
	public List<OrderVO> findByOrderStatus(Integer orderStatus) {
		List<OrderVO> list = new ArrayList<>();
		OrderVO orderVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = DriverManager.getConnection(JDBCUtil.URL, JDBCUtil.USER, JDBCUtil.PASSWORD);
			pstmt = con.prepareStatement(GET_STMT_BY_ORDER_STATUS);
			
			pstmt.setInt(1, orderStatus);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				orderVO = new OrderVO();
				orderVO.setOrderNumber(rs.getInt("orderNumber"));
				orderVO.setUserNumber(rs.getInt("userNumber"));
				orderVO.setOrderStatus(rs.getInt("orderStatus"));
				orderVO.setEstablishmentTime(rs.getTimestamp("establishmentTime"));
				orderVO.setShippingTime(rs.getTimestamp("shippingTime"));
				orderVO.setCompleteTime(rs.getTimestamp("completeTime"));		
				orderVO.setReceiver(rs.getString("receiver"));
				orderVO.setShippingAddress(rs.getString("shippingAddress"));
				orderVO.setDeliveryFee(rs.getBigDecimal("deliveryFee"));
				orderVO.setTotal(rs.getBigDecimal("total"));
				orderVO.setNote(rs.getString("note"));
				list.add(orderVO);
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
		OrderJDBCDAO dao = new OrderJDBCDAO();
		
		//新增
//		OrderVO order1 = new OrderVO();
//		order1.setUserNumber(4);
//		order1.setReceiver("測試新增收件人");
//		order1.setShippingAddress("測試新增地址");
//		order1.setDeliveryFee(new BigDecimal(50.0));
//		order1.setTotal(new BigDecimal(600.0));
//		order1.setNote("測試新增訂單");
//		dao.insert(order1);
		
		
		//修改
//		OrderVO order2 = new OrderVO();
//		order2.setOrderNumber(16);
//		order2.setOrderStatus(3);
//		order2.setShippingTime(Timestamp.valueOf("2024-05-22 15:30:00"));
//		order2.setReceiver("修改收件人");
//		order2.setShippingAddress("修改地址");
//		order2.setDeliveryFee(new BigDecimal(150.0));
//		order2.setTotal(new BigDecimal(610.0));
//		order2.setNote("修改訂單");
//		dao.update(order2);
		
		
		//單一查詢
//		OrderVO order3 = dao.findByPrimaryKey(4);		
//		System.out.println(order3.toString());

		
		//查詢全部
//		List<OrderVO> list = dao.getAll();
//		for (OrderVO orderVO : list) {	
//			System.out.println(orderVO.toString());
//		}
		
		//使用會員編號查詢
//		List<OrderVO> list = dao.findByUserNumber(5);
//		for (OrderVO orderVO : list) {	
//			System.out.println(orderVO.toString());
//		}
		
		
		//查詢全部的會員編號(不重複)
//		List<Integer> list = dao.getUserNumber();
//		for (Integer orderVO : list) {
//			System.out.print(orderVO);
//			System.out.println();
//		}
		
		//使用訂單狀態查詢
		List<OrderVO> list = dao.findByOrderStatus(1);
		for (OrderVO orderVO : list) {
			System.out.println(orderVO.toString());
		}

	}

}
