package com.cart.model;

import java.util.List;

public interface CartService_inteface {
	public CartVO addItemToCart(CartVO cartVO);
	public CartVO updateItemQuantity(CartVO cartVO);
	public List<CartVO> getCartItems(Integer userNumber);
	public void removeItemFromCart(Integer userNumber, Integer bookNumber);
	public void clearCart(Integer userNumber);
}
