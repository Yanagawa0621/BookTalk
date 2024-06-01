package com.cart.model;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.oracle.wls.shaded.org.apache.bcel.generic.RETURN;

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


                listCart.add(new CartVO(userNumber, bookNumber, bookTitle, bookPrice, quantity, subtotal, bookStock));
            }
        }
		return listCart;
	}

	@Override
	public long removeItemFromCart(Integer userNumber, Integer bookNumber) {
		String cartKey = "cart:" + userNumber + ":" + bookNumber;
		return jedis.del(cartKey);
		
	}

	@Override
	public long clearCart(Integer userNumber) {
		for(String cartKey : jedis.keys("cart:" + userNumber + ":*")) {
			jedis.del(cartKey);
		}
		return 1;
	}
	
}
