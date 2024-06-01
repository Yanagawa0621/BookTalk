package com.user.model;

import java.util.Arrays;
import java.util.Base64;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.loginRecord.model.LoginRecordVO;

@Entity
@Table(name = "user")
public class UserVO implements java.io.Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "number")
    private Integer number;

    @Column(name = "accountStatusNumber")
    private Integer accountStatusNumber;

    @Column(name = "accessNumber")
    private Integer accessNumber;

    @Column(name = "account", length = 20, unique = true)
    private String account;

    @Column(name = "passcode", length = 20)
    private String passcode;

    @Column(name = "name", length = 20)
    private String name;

    @Column(name = "registerDate")
    private Date registerDate;

    @Column(name = "sex", length = 1)
    private String sex;

    @Column(name = "eMail", length = 255, unique = true)
    private String eMail;

    @Column(name = "introduceOneself", columnDefinition = "LONGTEXT")
    private String introduceOneself;

    @Column(name = "birthday")
    private Date birthday;

    @Column(name = "photo", columnDefinition = "LONGBLOB")
    private byte[] photo;

    @Column(name = "nationalIdNumber", length = 10, unique = true)
    private String nationalIdNumber;

    @Column(name = "telephoneNumber", length = 15, unique = true)
    private String telephoneNumber;

    @Column(name = "address", length = 255)
    private String address;

    @Column(name = "city", length = 50)
    private String city;

    @Column(name = "district", length = 50)
    private String district;

    @Column(name = "statusStartDate")
    private Date statusStartDate;

    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<LoginRecordVO> loginRecords;

    // Getters and Setters
    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public Integer getAccountStatusNumber() {
        return accountStatusNumber;
    }

    public void setAccountStatusNumber(Integer accountStatusNumber) {
        this.accountStatusNumber = accountStatusNumber;
    }

    public Integer getAccessNumber() {
        return accessNumber;
    }

    public void setAccessNumber(Integer accessNumber) {
        this.accessNumber = accessNumber;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPasscode() {
        return passcode;
    }

    public void setPasscode(String passcode) {
        this.passcode = passcode;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getRegisterDate() {
        return registerDate;
    }

    public void setRegisterDate(Date registerDate) {
        this.registerDate = registerDate;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String geteMail() {
        return eMail;
    }

    public void seteMail(String eMail) {
        this.eMail = eMail;
    }

    public String getIntroduceOneself() {
        return introduceOneself;
    }

    public void setIntroduceOneself(String introduceOneself) {
        this.introduceOneself = introduceOneself;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public byte[] getPhoto() {
        return photo;
    }

    public void setPhoto(byte[] photo) {
        this.photo = photo;
    }

    public String getNationalIdNumber() {
        return nationalIdNumber;
    }

    public void setNationalIdNumber(String nationalIdNumber) {
        this.nationalIdNumber = nationalIdNumber;
    }

    public String getTelephoneNumber() {
        return telephoneNumber;
    }

    public void setTelephoneNumber(String telephoneNumber) {
        this.telephoneNumber = telephoneNumber;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public Date getStatusStartDate() {
        return statusStartDate;
    }

    public void setStatusStartDate(Date statusStartDate) {
        this.statusStartDate = statusStartDate;
    }

    public String getPhotoBase64() {
        return this.photo != null ? Base64.getEncoder().encodeToString(this.photo) : "";
    }

    public List<LoginRecordVO> getLoginRecords() {
        return loginRecords;
    }

    public void setLoginRecords(List<LoginRecordVO> loginRecords) {
        this.loginRecords = loginRecords;
    }

    public String getAccountStatus() {
        switch (this.accountStatusNumber) {
            case 1: return "正常";
            case 2: return "永久停權";
            case 3: return "暫時停權7天";
            default: return "未知狀態";
        }
    }

    public String getUserRole() {
        switch (this.accessNumber) {
            case 1: return "後台管理員";
            case 2: return "一般會員";
            default: return "未知權限";
        }
    }

    @Override
    public String toString() {
        return "UserVO{" +
                "number=" + number +
                ", accountStatusNumber=" + accountStatusNumber +
                ", accessNumber=" + accessNumber +
                ", account='" + account + '\'' +
                ", passcode='" + passcode + '\'' +
                ", name='" + name + '\'' +
                ", registerDate=" + registerDate +
                ", sex='" + sex + '\'' +
                ", eMail='" + eMail + '\'' +
                ", introduceOneself='" + introduceOneself + '\'' +
                ", birthday=" + birthday +
                ", photo=" + Arrays.toString(photo) +
                ", nationalIdNumber='" + nationalIdNumber + '\'' +
                ", telephoneNumber='" + telephoneNumber + '\'' +
                ", address='" + address + '\'' +
                ", city='" + city + '\'' +
                ", district='" + district + '\'' +
                ", statusStartDate=" + statusStartDate +
                ", loginRecords=" + loginRecords +
                '}';
    }
}
