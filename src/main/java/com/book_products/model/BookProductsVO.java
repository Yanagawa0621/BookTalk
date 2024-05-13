package com.book_products.model;

import java.sql.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;

import com.book_author.model.BookAuthorVO;
import com.book_class.model.BookClassVO;
import com.books_and_picture.model.BooksAndPictureVO;
import com.publishing_house.model.PublishingHouseVO;

@Entity
@Table(name = "book_products")
public class BookProductsVO implements java.io.Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "bookNumber",updatable=false)
	private Integer bookNumber;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "bookClassNumber", referencedColumnName = "classNumber", nullable = false)
	private BookClassVO bpVO;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "publishiingHouseCode", referencedColumnName = "publishingHouseNumber", nullable = false)
	private PublishingHouseVO phVO;

	@Column(name = "productStatus",nullable = false)
	private Integer productStatus;

	@Column(name = "bookTitle",nullable = false)
	private String bookTitle;

	@Column(name = "isbn", length = 13, unique = true,nullable = false)
	private String isbn;

	@Column(name = "price",nullable = false)
	private Double price;

	@Column(name = "publicationDate",nullable = false)
	private Date publicationDate;

	@Column(name = "stock",nullable = false)
	private Integer stock;

	@Column(name = "introductionContent")
	private String introductionContent;

	@OneToMany(mappedBy = "bookNumber",cascade = CascadeType.ALL,fetch = FetchType.EAGER)
	@OrderBy("pictureNumber asc")
	private List<BooksAndPictureVO> bapVO;
	
	@OneToMany(mappedBy = "bookNumber",cascade = CascadeType.ALL,fetch = FetchType.EAGER)
	@OrderBy("authorNumber asc")
	private List<BookAuthorVO> baVO;
	
	public Integer getBookNumber() {
		return bookNumber;
	}

	public void setBookNumber(Integer bookNumber) {
		this.bookNumber = bookNumber;
	}

	public BookClassVO getBpVO() {
		return bpVO;
	}

	public void setBpVO(BookClassVO bpVO) {
		this.bpVO = bpVO;
	}

	public PublishingHouseVO getPhVO() {
		return phVO;
	}

	public void setPhVO(PublishingHouseVO phVO) {
		this.phVO = phVO;
	}

	public Integer getProductStatus() {
		return productStatus;
	}

	public void setProductStatus(Integer productStatus) {
		this.productStatus = productStatus;
	}

	public String getBookTitle() {
		return bookTitle;
	}

	public void setBookTitle(String bookTitle) {
		this.bookTitle = bookTitle;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Date getPublicationDate() {
		return publicationDate;
	}

	public void setPublicationDate(Date publicationDate) {
		this.publicationDate = publicationDate;
	}

	public Integer getStock() {
		return stock;
	}

	public void setStock(Integer stock) {
		this.stock = stock;
	}

	public String getIntroductionContent() {
		return introductionContent;
	}

	public void setIntroductionContent(String introductionContent) {
		this.introductionContent = introductionContent;
	}

	public List<BooksAndPictureVO> getBapVO() {
		return bapVO;
	}

	public void setBapVO(List<BooksAndPictureVO> bapVO) {
		this.bapVO = bapVO;
	}

	public List<BookAuthorVO> getBaVO() {
		return baVO;
	}

	public void setBaVO(List<BookAuthorVO> baVO) {
		this.baVO = baVO;
	}
	
	
}
