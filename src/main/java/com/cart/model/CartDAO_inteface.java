package com.cart.model;

import java.util.List;

public interface CartDAO_inteface {
	public String addItemToCart(CartVO cartVO);
	public String updateItemQuantity(CartVO cartVO);
	public List<CartVO> getCartItems(Integer userNumber);
	public long removeItemFromCart(Integer userNumber, Integer bookNumber);
	public long clearCart(Integer userNumber);
}
