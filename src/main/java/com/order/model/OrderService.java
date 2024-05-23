package com.order.model;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import com.bookproducts.model.BookProductsDAO_Impl;
import com.bookproducts.model.BookProductsService;
import com.bookproducts.model.BookProductsVO;
import com.cart.model.CartService;
import com.cart.model.CartService_inteface;
import com.cart.model.CartVO;
import com.orderdetails.model.OrderDetailsVO;

public class OrderService implements OrderService_inteface{
	private OrderDAO_interface dao;
	private CartService_inteface cartSev;
	private BookProductsService bookProductsSev;

	public OrderService() {
		dao = new OrderDAOHibernate();
		cartSev = new CartService();
		bookProductsSev = new BookProductsService();
	}
	
	@Override
	public OrderVO addOrder(OrderVO ordreVO) {
		dao.insert(ordreVO);		
		return ordreVO;
	}
	
	@Override
	public OrderVO updateOrder(OrderVO ordreVO) {
		dao.update(ordreVO);		
		return ordreVO;
	}
	
	@Override
	public OrderVO getOneOrder(Integer orderNumber) {
		return dao.findByPrimaryKey(orderNumber);
	}
	
	@Override
	public List<OrderVO> getAll(){
		return dao.getAll();
	}
	
	@Override
	public List<OrderVO> getOrderByUserNumber(Integer userNumber) {
		return dao.findByUserNumber(userNumber);
	}
	
	@Override
	public List<Integer> getUserNumber(){
		return dao.getUserNumber();
	}
	
	@Override
	public List<OrderVO> getOrderByOrderStatus(Integer orderStatus) {
		return dao.findByOrderStatus(orderStatus);
	}

	@Override
	public String checkout(Integer userNumber, OrderVO ordreVO) {
		List<CartVO> cartItems = cartSev.getCartItems(userNumber);
		Set<OrderDetailsVO> details = new LinkedHashSet<>();
		BigDecimal total = new BigDecimal(0);
		
		if(cartItems.isEmpty()) {	//購物車為空，無需結帳，回傳null
			return null;
		}
		
		for(CartVO item : cartItems) {
			OrderDetailsVO orderDetail = new OrderDetailsVO();
			BookProductsVO bookProductsVO = bookProductsSev.singleQueryBp(item.getBookNumber());
			orderDetail.setUnitPrice(new BigDecimal(item.getBookPrice()));
			orderDetail.setQuantity(item.getQuantity());
			orderDetail.setSubtotal(new BigDecimal(item.getSubtotal()));
			orderDetail.setOrderVO(ordreVO);
			orderDetail.setBookProductsVO(bookProductsVO);
			//TODO //bookProductsVO.setStock(bookProductsVO.getStock() - orderDetail.getQuantity());	//取得庫存量並設定扣掉購買的數量
			details.add(orderDetail);
		}
		
		for(OrderDetailsVO linkOrderDetailsVO: details ) {	//取得該筆訂單所有訂單明細的小計總額
			total = total.add(linkOrderDetailsVO.getSubtotal());
		}
		
		if(total.compareTo(new BigDecimal(1000))== 1) {	//當訂單明細小計總額>=1000，運費$50；<1000，運費$100
			ordreVO.setDeliveryFee(new BigDecimal(50));
		}else {
			ordreVO.setDeliveryFee(new BigDecimal(100));
		}
		
		ordreVO.setTotal(total.add(ordreVO.getDeliveryFee()));	//訂單總額為小計總額+運費

		//此訂單要新增時，跟著要一起新增的訂單明細
		ordreVO.setOrderDetails(details);
		
		addOrder(ordreVO);
		cartSev.clearCart(userNumber);

		return null;
	}
}
