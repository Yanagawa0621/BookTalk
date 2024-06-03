package com.access.model;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "access")
public class AccessVO implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "accessNumber")
    private Integer accessNumber;

    @Column(name = "name", length = 20)
    private String name;

    @Column(name = "accessDescribe", length = 50)
    private String accessDescribe;

    // Getters and Setters
    public Integer getAccessNumber() {
        return accessNumber;
    }

    public void setAccessNumber(Integer accessNumber) {
        this.accessNumber = accessNumber;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAccessDescribe() {
        return accessDescribe;
    }

    public void setAccessDescribe(String accessDescribe) {
        this.accessDescribe = accessDescribe;
    }
}
