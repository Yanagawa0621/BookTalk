package com;

import org.hibernate.Session;

import com.bookproducts.model.BookProductsDAO;
import com.bookproducts.model.BookProductsDAO_Impl;
import com.bookproducts.model.BookProductsVO;
import com.cart.model.CartDAOJedis;
import com.cart.model.CartVO;
import util.HibernateUtil;

public class TestJedisHibernateDAO {

	public static void main(String[] args) {
		CartDAOJedis dao = new CartDAOJedis();
		BookProductsDAO_Impl dao2 = new BookProductsDAO();
		
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			
			
			//==================== 新增商品到購物車 ====================//
			BookProductsVO book1 = dao2.singleQuery(6);
			BookProductsVO book2 = dao2.singleQuery(4);	
			BookProductsVO book3 = dao2.singleQuery(5);	
			
			CartVO cart = new CartVO();
			cart.setUserNumber(3);
			cart.setBookNumber(book1.getBookNumber());
			cart.setBookPrice(book1.getPrice());
			cart.setBookTitle(book1.getBookTitle());
			cart.setQuantity(6);			
			cart.setSubtotal(book1.getPrice()*cart.getQuantity());
			cart.setBookStock(book1.getStock());
						
			CartVO cart2 = new CartVO();
			cart2.setUserNumber(3);
			cart2.setBookNumber(book2.getBookNumber());
			cart2.setBookPrice(book2.getPrice());
			cart2.setBookTitle(book2.getBookTitle());
			cart2.setQuantity(2);
			cart2.setSubtotal(book2.getPrice()*cart2.getQuantity());
			cart2.setBookStock(book2.getStock());
			
			
			CartVO cart3 = new CartVO();
			cart3.setUserNumber(3);
			cart3.setBookNumber(book3.getBookNumber());
			cart3.setBookPrice(book3.getPrice());
			cart3.setBookTitle(book3.getBookTitle());
			cart3.setQuantity(4);
			cart3.setSubtotal(book3.getPrice()*cart3.getQuantity());
			cart3.setBookStock(book3.getStock());
			
			dao.addItemToCart(cart);
			dao.addItemToCart(cart2);
			dao.addItemToCart(cart3);
			
			//==================== 修改商品數量 ====================//
//			BookProductsVO book1 = dao2.singleQuery(5);
//			
//			CartVO cart = new CartVO();
//			cart.setUserNumber(2);
//			cart.setBookNumber(book1.getBookNumber());
//			cart.setBookPrice(book1.getPrice());
//			cart.setQuantity(10);
//			cart.setSubtotal(book1.getPrice()*cart.getQuantity());
//			cart.setBookStock(book1.getStock());
//			
//			dao.updateItemQuantity(cart);
			
			
			//==================== 結帳並刪除購物車資料 ====================//
//			dao.checkout(2, 5);
//			dao.clearCart(2, 5);
			
			
			//==================== 列出該使用者的所有購物車資料 ====================//
			
//			System.out.println(dao.getCartItems(2));
			
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		} finally {
			HibernateUtil.shutdown();
		}

	}

}
