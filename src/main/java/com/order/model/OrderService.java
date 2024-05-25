package com.order.model;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import java.util.UUID;

import com.bookproducts.model.BookProductsService;
import com.bookproducts.model.BookProductsVO;
import com.cart.model.CartService;
import com.cart.model.CartService_inteface;
import com.cart.model.CartVO;
import com.orderdetails.model.OrderDetailsVO;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutOneTime;

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
	public String checkout(Integer userNumber, OrderVO ordreVO, String contextPath) {
		List<CartVO> cartItems = cartSev.getCartItems(userNumber);
		Set<OrderDetailsVO> details = new LinkedHashSet<>();
		BigDecimal total = new BigDecimal(0);
		String itemNames = "";	//放ECPay商品名稱用
		
		if(cartItems.isEmpty()) {	//購物車為空，無需結帳，回傳null
			return null;
		}
		
		for(CartVO item : cartItems) {
			OrderDetailsVO orderDetail = new OrderDetailsVO();
			BookProductsVO bookProductsVO = bookProductsSev.singleQueryBp(item.getBookNumber());
			itemNames += bookProductsVO.getBookTitle()+"#";	//多個名稱用"#"分隔
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
		
		Integer newOrderNumber = addOrder(ordreVO).getOrderNumber();
		
//		cartSev.clearCart(userNumber);	//新增完訂單刪除購物車
		
		Integer totalAmount = ordreVO.getTotal().intValue();
		
		System.out.println("此次新增訂單的編號：" + newOrderNumber);
		System.out.println("訂單總金額：" + totalAmount);
		System.out.println("產品名稱串聯：" + itemNames);
		
		//ECPay 支付請求
		AllInOne cardPay = new AllInOne("");
		AioCheckOutOneTime payOneTimeObj = new AioCheckOutOneTime();
		payOneTimeObj.setMerchantTradeNo(newOrderNumber + "BB" +UUID.randomUUID().toString().replaceAll("-", "").substring(0, 5));	//BB前面為此次結帳的訂單編號
		payOneTimeObj.setMerchantTradeDate(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss")));
		payOneTimeObj.setTotalAmount(String.valueOf(totalAmount));
		payOneTimeObj.setTradeDesc("購物車結帳");
		payOneTimeObj.setItemName(itemNames);
		payOneTimeObj.setClientBackURL("http://localhost:8081"+contextPath+"/front-end/shop.jsp");
		payOneTimeObj.setReturnURL("http://localhost:8081"+contextPath+"/index.jsp");
		payOneTimeObj.setNeedExtraPaidInfo("N");
				
		return cardPay.aioCheckOut(payOneTimeObj, null);
	}
}
