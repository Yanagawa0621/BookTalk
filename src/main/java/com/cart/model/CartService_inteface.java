package com.cart.model;

import java.util.List;

public interface CartService_inteface {
	public CartVO addItemToCart(CartVO cartVO);
	public CartVO updateItemQuantity(CartVO cartVO);
	public List<CartVO> getCartItems(Integer userNumber);
	public long removeItemFromCart(Integer userNumber, Integer bookNumber);
	public long clearCart(Integer userNumber);
}
