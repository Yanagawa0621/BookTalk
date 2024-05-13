package com.booksandpicture.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.book_products.model.BookProductsVO;

@Entity
@Table(name="books_and_picture")
public class BooksAndPictureVO implements java.io.Serializable{
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "pictureNumber",updatable=false)
	private Integer pictureNumber;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "bookNumber", referencedColumnName = "bookNumber", nullable = false)
	private BookProductsVO bpVO;
	
	@Column(name = "pictureFile",nullable = false)
	private byte[] pictureFile;
	
	public Integer getPictureNumber() {
		return pictureNumber;
	}
	public void setPictureNumber(Integer pictureNumber) {
		this.pictureNumber = pictureNumber;
	}
	
	public BookProductsVO getBpVO() {
		return bpVO;
	}
	public void setBpVO(BookProductsVO bpVO) {
		this.bpVO = bpVO;
	}
	public byte[] getPictureFile() {
		return pictureFile;
	}
	public void setPictureFile(byte[] pictureFile) {
		this.pictureFile = pictureFile;
	}
	
	
}
