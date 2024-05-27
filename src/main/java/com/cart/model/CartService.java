package com.cart.model;

import java.util.List;

public class CartService implements CartService_inteface{
	private CartDAO_inteface dao;
	
	public CartService() {
		dao = new CartDAOJedis();
	}

	@Override
	public CartVO addItemToCart(CartVO cartVO) {
		dao.addItemToCart(cartVO);
		return cartVO;
	}

	@Override
	public CartVO updateItemQuantity(CartVO cartVO) {
		dao.updateItemQuantity(cartVO);
		return cartVO;
	}

	@Override
	public List<CartVO> getCartItems(Integer userNumber) {
		return dao.getCartItems(userNumber);
	}

	@Override
	public void removeItemFromCart(Integer userNumber, Integer bookNumber) {
		dao.removeItemFromCart(userNumber, bookNumber);
	}

	@Override
	public void clearCart(Integer userNumber) {
		dao.clearCart(userNumber);
	}

}