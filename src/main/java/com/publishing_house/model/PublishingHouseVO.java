package com.publishing_house.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;

import com.book_products.model.BookProductsVO;

@Entity
@Table(name = "publishing_house")
public class PublishingHouseVO implements java.io.Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "publishingHouseNumber", updatable = false)
	private Integer publishingHouseNumber;

	@Column(name = "name",nullable = false)
	private String name;

	@Column(name = "address",nullable = false)
	private String address;

	@Column(name = "personInCharge",nullable = false)
	private String personInCharge;

	@Column(name = "telephoneNumber", length = 15,nullable = false)
	private String telephoneNumber;
	
	@OneToMany(mappedBy = "publishiingHouseCode",cascade = {CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH},fetch = FetchType.LAZY)
	@OrderBy("bookNumber asc")
	private List<BookProductsVO> bpVO;
	
	public Integer getPublishingHouseNumber() {
		return publishingHouseNumber;
	}

	public void setPublishingHouseNumber(Integer publishingHouseNumber) {
		this.publishingHouseNumber = publishingHouseNumber;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPersonInCharge() {
		return personInCharge;
	}

	public void setPersonInCharge(String personInCharge) {
		this.personInCharge = personInCharge;
	}

	public String getTelephoneNumber() {
		return telephoneNumber;
	}

	public void setTelephoneNumber(String telephoneNumber) {
		this.telephoneNumber = telephoneNumber;
	}

	public List<BookProductsVO> getBpVO() {
		return bpVO;
	}

	public void setBpVO(List<BookProductsVO> bpVO) {
		this.bpVO = bpVO;
	}
	
}
