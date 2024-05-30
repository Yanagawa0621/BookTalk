package com.cart.model;

import java.util.List;

public class CartService implements CartService_inteface{
	private CartDAO_inteface dao;
	
	public CartService() {
		dao = new CartDAOJedis();
	}

	@Override
	public CartVO addItemToCart(CartVO cartVO) {
		List<CartVO> carList = dao.getCartItems(cartVO.getUserNumber());
		for(CartVO check : carList) {
			if(check.getBookNumber() == cartVO.getBookNumber()) {	//判斷使用者加入的商品是否已在購物車內
				cartVO.setQuantity(check.getQuantity() + cartVO.getQuantity());
				cartVO.setSubtotal(cartVO.getBookPrice() * cartVO.getQuantity());
			}
		}
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
	public long removeItemFromCart(Integer userNumber, Integer bookNumber) {
		return dao.removeItemFromCart(userNumber, bookNumber);
	}

	@Override
	public long clearCart(Integer userNumber) {
		return dao.clearCart(userNumber);
	}

}
