package com.cart.model;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.bookproducts.model.BookProductsDAO;
import com.bookproducts.model.BookProductsDAO_Impl;
import com.bookproducts.model.BookProductsVO;
import com.order.model.OrderDAOHibernate;
import com.order.model.OrderDAO_interface;
import com.order.model.OrderVO;
import com.orderdetails.model.OrderDetailsVO;
import util.JedisUtil;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

public class CartDAOJedis implements CartDAO_inteface{
	private JedisPool pool;
	private Jedis jedis;

	public CartDAOJedis() {
		pool = JedisUtil.getJedisPool();
		jedis = pool.getResource();
		jedis.select(4);
	}

	@Override
	public String addItemToCart(CartVO cartVO) {
		String cartKey = "cart:" + cartVO.getUserNumber() + ":" + cartVO.getBookNumber();
		jedis.hset(cartKey, "bookTitle", cartVO.getBookTitle());
		jedis.hset(cartKey, "bookPrice", cartVO.getBookPrice().toString());
		jedis.hset(cartKey, "quantity", cartVO.getQuantity().toString());
		jedis.hset(cartKey, "subtotal", cartVO.getSubtotal().toString());
		jedis.hset(cartKey, "bookStock", cartVO.getBookStock().toString());
		
//		jedis.expire(cartKey, 2592000);	//存活時間：一個月以30天算的秒數
//		jedis.expire(cartKey, 60);
		
		return cartKey;
	}

	@Override
	public String updateItemQuantity(CartVO cartVO) {
		String cartKey = "cart:" + cartVO.getUserNumber() + ":" + cartVO.getBookNumber();
		jedis.hset(cartKey, "quantity", cartVO.getQuantity().toString());
		jedis.hset(cartKey, "subtotal", cartVO.getSubtotal().toString());

//		jedis.expire(cartKey, 2592000);	//存活時間：一個月以30天算的秒數
//		jedis.expire(cartKey, 60);
		
		return cartKey;
	}

	@Override
	public List<CartVO> getCartItems(Integer userNumber) {
		List<CartVO> listCart = new ArrayList<>();
		for (String cartKey : jedis.keys("cart:" + userNumber + ":*")) {
            Map<String, String> itemData = jedis.hgetAll(cartKey);    
            String[] parts = cartKey.split(":");
            if (parts.length == 3) {
                Integer bookNumber = Integer.parseInt(parts[2]);
                String bookTitle = itemData.get("bookTitle");
                Double bookPrice = Double.parseDouble(itemData.get("bookPrice"));                
                Integer quantity = Integer.parseInt(itemData.get("quantity"));
                Double subtotal = Double.parseDouble(itemData.get("subtotal"));
                Integer bookStock = Integer.parseInt(itemData.get("bookStock"));
//              byte[] image = itemData.get("image").getBytes();  // 將字符串轉換回 BLOB

                listCart.add(new CartVO(userNumber, bookNumber, bookTitle, bookPrice, quantity, subtotal, bookStock));
            }
        }
		return listCart;
	}

	@Override
	public void removeItemFromCart(Integer userNumber, Integer bookNumber) {
		String cartKey = "cart:" + userNumber + ":" + bookNumber;
		jedis.del(cartKey);
		
	}

	@Override
	public void clearCart(Integer userNumber) {
		for(String cartKey : jedis.keys("cart:" + userNumber + ":*")) {
			jedis.del(cartKey);
		}
	}
}
