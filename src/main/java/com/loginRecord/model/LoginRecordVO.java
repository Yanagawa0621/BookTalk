package com.loginRecord.model;

import java.util.Date;
import javax.persistence.*;

import com.user.model.UserVO;

@Entity
@Table(name = "login_record")
public class LoginRecordVO implements java.io.Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "number")
    private Integer number;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "userNumber", referencedColumnName = "number")
    private UserVO user;

    @Column(name = "loginTime")
    private Date loginTime;

    @Column(name = "ip", length = 45)
    private String ip;

    @Column(name = "area", length = 20)
    private String area;

    // Getters and Setters

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public UserVO getUser() {
        return user;
    }

    public void setUser(UserVO user) {
        this.user = user;
    }

    public Date getLoginTime() {
        return loginTime;
    }

    public void setLoginTime(Date loginTime) {
        this.loginTime = loginTime;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    @Override
    public String toString() {
        return "LoginRecordVO{" +
                "number=" + number +
                ", user=" + user +
                ", loginTime=" + loginTime +
                ", ip='" + ip + '\'' +
                ", area='" + area + '\'' +
                '}';
    }
}
