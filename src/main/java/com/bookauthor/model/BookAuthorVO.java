package com.bookauthor.model;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.author.model.AuthorVO;
import com.bookproducts.model.BookProductsVO;

@Entity
@Table(name="book_author")
public class BookAuthorVO implements java.io.Serializable{
	
	@EmbeddedId
	private CompositeKey compositeKey;
	
	
	public CompositeKey getCompositeKey() {
		return compositeKey;
	}


	public void setCompositeKey(CompositeKey compositeKey) {
		this.compositeKey = compositeKey;
	}

	@Embeddable
	public static class CompositeKey implements Serializable{
		
		
		@ManyToOne(fetch = FetchType.LAZY)
		@JoinColumn(name = "bookNumber", referencedColumnName = "bookNumber", nullable = false)
		private BookProductsVO bpVO;
		
		@ManyToOne(fetch = FetchType.EAGER)
		@JoinColumn(name = "authorNumber", referencedColumnName = "authorNumber", nullable = false)
		private AuthorVO authorVO;
		
		
		public CompositeKey() {
			super();
			// TODO Auto-generated constructor stub
		}


		public CompositeKey(BookProductsVO bpVO, AuthorVO authorVO) {
			super();
			this.bpVO = bpVO;
			this.authorVO = authorVO;
		}


		public BookProductsVO getBpVO() {
			return bpVO;
		}


		public void setBpVO(BookProductsVO bpVO) {
			this.bpVO = bpVO;
		}


		public AuthorVO getAuthorVO() {
			return authorVO;
		}


		public void setAuthorVO(AuthorVO authorVO) {
			this.authorVO = authorVO;
		}


		@Override
		public int hashCode() {
			return Objects.hash(authorVO, bpVO);
		}


		@Override
		public boolean equals(Object obj) {
			if (this == obj)
				return true;
			if (obj == null)
				return false;
			if (getClass() != obj.getClass())
				return false;
			CompositeKey other = (CompositeKey) obj;
			return Objects.equals(authorVO, other.authorVO) && Objects.equals(bpVO, other.bpVO);
		}

		
	}
}
