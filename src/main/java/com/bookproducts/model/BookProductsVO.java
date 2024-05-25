package com.bookproducts.model;

import java.sql.Date;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.author.model.AuthorVO;
import com.bookclass.model.BookClassVO;
import com.booksandpicture.model.BooksAndPictureVO;
import com.google.gson.annotations.Expose;
import com.orderdetails.model.OrderDetailsVO;
import com.publishinghouse.model.PublishingHouseVO;

@Entity
@Table(name = "book_products")
public class BookProductsVO implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "bookNumber",updatable=false)
	@Expose
	private Integer bookNumber;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "bookClassNumber", referencedColumnName = "classNumber", nullable = false)
	@Expose
	private BookClassVO bcVO;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "publishiingHouseCode", referencedColumnName = "publishingHouseNumber", nullable = false)
	@Expose
	private PublishingHouseVO phVO;

	@Column(name = "productStatus",nullable = false)
	@Expose
	private Integer productStatus;

	@Column(name = "bookTitle",nullable = false)
	@Expose
	private String bookTitle;

	@Column(name = "isbn", length = 13, unique = true,nullable = false)
	@Expose
	private String isbn;

	@Column(name = "price",nullable = false,columnDefinition="DECIMAL")
	@Expose
	private Double price;

	@Column(name = "publicationDate",nullable = false)
	@Expose
	private Date publicationDate;

	@Column(name = "stock",nullable = false)
	@Expose
	private Integer stock;

	@Column(name = "introductionContent",columnDefinition = "longtext")
	@Expose
	private String introductionContent;

	@Column(name="releaseDate")
	@Expose
	private Date releaseDate;
	
	@OneToMany(mappedBy = "bpVO",cascade = CascadeType.ALL,fetch = FetchType.LAZY)
	@OrderBy("pictureNumber asc")
	private List<BooksAndPictureVO> bapVO;
	
	@ManyToMany
	@JoinTable(name="book_author",joinColumns = {@JoinColumn(name="bookNumber",referencedColumnName = "bookNumber")},inverseJoinColumns = {@JoinColumn(name="authorNumber",referencedColumnName = "authorNumber")})
	private List<AuthorVO> authorVO;
	
	@Transient
	@Expose
	private List<String> img;
	
	@Transient
	@Expose
	private Double ratingScoreAvg;
	
	@OneToMany(mappedBy = "bookProductsVO",cascade = CascadeType.ALL)
	@OrderBy("bookNumber asc")
	private Set<OrderDetailsVO> orderDetailsVO;
	
	
	public Integer getBookNumber() {
		return bookNumber;
	}

	public void setBookNumber(Integer bookNumber) {
		this.bookNumber = bookNumber;
	}

	public BookClassVO getBpVO() {
		return bcVO;
	}

	public void setBpVO(BookClassVO bcVO) {
		this.bcVO = bcVO;
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
	
	public Date getReleaseDate() {
//		Calendar releaseDate=Calendar.getInstance();
//		releaseDate.setTime(this.releaseDate);
		return releaseDate;
	}

	public void setReleaseDate(Date releaseDate) {
		this.releaseDate = releaseDate;
	}

	public List<BooksAndPictureVO> getBapVO() {
		return bapVO;
	}

	public void setBapVO(List<BooksAndPictureVO> bapVO) {
		this.bapVO = bapVO;
	}

	public List<AuthorVO> getAuthorVO() {
		return authorVO;
	}

	public void setAuthorVO(List<AuthorVO> authorVO) {
		this.authorVO = authorVO;
	}

	public BookClassVO getBcVO() {
		return bcVO;
	}

	public void setBcVO(BookClassVO bcVO) {
		this.bcVO = bcVO;
	}

	public List<String> getImg() {
		return img;
	}

	public void setImg(List<String> img) {
		this.img = img;
	}
	
	
	public Set<OrderDetailsVO> getOrderDetailsVO() {
		return orderDetailsVO;
	}

	public void setOrderDetailsVO(Set<OrderDetailsVO> orderDetailsVO) {
		this.orderDetailsVO = orderDetailsVO;
	}

	public Double getRatingScoreAvg() {
		return ratingScoreAvg;
	}

	public void setRatingScoreAvg(Double ratingScoreAvg) {
		this.ratingScoreAvg = ratingScoreAvg;
	}

}
