package com.cart.model;


public class CartVO {
	private Integer userNumber;
	private Integer bookNumber;
	private String bookTitle;
	private Double bookPrice;
	private Integer quantity;
	private Double subtotal;
	private Integer bookStock;
	
	public CartVO() {
		super();
	}
	
	public CartVO(Integer userNumber, Integer bookNumber, String bookTitle, Double bookPrice, Integer quantity,
			Double subtotal, Integer bookStock) {
		super();
		this.userNumber = userNumber;
		this.bookNumber = bookNumber;
		this.bookTitle = bookTitle;
		this.bookPrice = bookPrice;
		this.quantity = quantity;
		this.subtotal = subtotal;
		this.bookStock = bookStock;
	}


	public Integer getUserNumber() {
		return userNumber;
	}

	public void setUserNumber(Integer userNumber) {
		this.userNumber = userNumber;
	}

	public Integer getBookNumber() {
		return bookNumber;
	}

	public void setBookNumber(Integer bookNumber) {
		this.bookNumber = bookNumber;
	}

	public String getBookTitle() {
		return bookTitle;
	}

	public void setBookTitle(String bookTitle) {
		this.bookTitle = bookTitle;
	}

	public Double getBookPrice() {
		return bookPrice;
	}

	public void setBookPrice(Double bookPrice) {
		this.bookPrice = bookPrice;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public Double getSubtotal() {
		return subtotal;
	}

	public void setSubtotal(Double subtotal) {
		this.subtotal = subtotal;
	}
	
	public Integer getBookStock() {
		return bookStock;
	}

	public void setBookStock(Integer bookStock) {
		this.bookStock = bookStock;
	}

	@Override
	public String toString() {
		return "CartVO [userNumber=" + userNumber + ", bookNumber=" + bookNumber + ", bookTitle=" + bookTitle
				+ ", bookPrice=" + bookPrice + ", quantity=" + quantity + ", subtotal=" + subtotal + ", bookStock="
				+ bookStock + "]";
	}
	
}
