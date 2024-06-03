package com.callcenter.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.google.gson.annotations.Expose;

@Entity
@Table(name = "callcenter")
public class CallCenterVO implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", updatable = false)
	@Expose
	private Integer id;

	@Column(name = "problemType", nullable = false)
	@Expose
	private String problemType;

	@Column(name = "problemDescription", columnDefinition = "TEXT", nullable = false)
	@Expose
	private String problemDescription;

	@Column(name = "email", nullable = false)
	@Expose
	private String email;

	@Column(name = "orderNumber")
	@Expose
	private Integer orderNumber;

	@Column(name = "attachedFile", columnDefinition = "MEDIUMBLOB")
	@Expose
	private byte[] attachedFile;

	@Column(name = "createdAt")
	@Expose
	private Timestamp createdAt;

	@Column(name = "responseAt")
	@Expose
	private Timestamp responseAt;

	@Column(name = "responseDescription", columnDefinition = "TEXT")
	@Expose
	private String responseDescription;

	public String getProblemType() {
		return problemType;
	}

	public void setProblemType(String problemType) {
		this.problemType = problemType;
	}

	public String getProblemDescription() {
		return problemDescription;
	}

	public void setProblemDescription(String problemDescription) {
		this.problemDescription = problemDescription;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Integer getOrderNumber() {
		return orderNumber;
	}

	public void setOrderNumber(Integer orderNumber) {
		this.orderNumber = orderNumber;
	}

	public byte[] getAttachedFile() {
		return attachedFile;
	}

	public void setAttachedFile(byte[] attachedFile) {
		this.attachedFile = attachedFile;
	}

	public Timestamp getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}

	public Timestamp getResponseAt() {
		return responseAt;
	}

	public void setResponseAt(Timestamp responseAt) {
		this.responseAt = responseAt;
	}

	public String getResponseDescription() {
		return responseDescription;
	}

	public void setResponseDescription(String responseDescription) {
		this.responseDescription = responseDescription;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}
