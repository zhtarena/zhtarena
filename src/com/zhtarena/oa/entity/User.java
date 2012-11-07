package com.zhtarena.oa.entity;

import java.util.Date;


/**
 * User entity. @author MyEclipse Persistence Tools
 */

public class User  implements java.io.Serializable {


    // Fields    

     private static final long serialVersionUID = 1L;
     private Integer id;
     private String username;
     private String password;
     private String name;
     private Integer sex;
     private String photo;
     private Integer age;
     private String cardId;
     private String address;
     private String zip;
     private String telephone;
     private String mobilephone;
     private String qq;
     private String mail;
     private double wage;
     private double finalWage;
     private Date rtime;
     private Integer trust;
     private String describes;
     private Integer roleId;


    // Constructors

    /** default constructor */
    public User() {
    }

    
    /** full constructor */
    public User(String username, String password, String name, Integer sex, String photo, Integer age, String cardId, String address, String zip, String telephone, String mobilephone, String qq, String mail, double wage, double finalWage, Date rtime, Integer trust, String describes, Integer roleId) {
        this.username = username;
        this.password = password;
        this.name = name;
        this.sex = sex;
        this.photo = photo;
        this.age = age;
        this.cardId = cardId;
        this.address = address;
        this.zip = zip;
        this.telephone = telephone;
        this.mobilephone = mobilephone;
        this.qq = qq;
        this.mail = mail;
        this.wage = wage;
        this.finalWage = finalWage;
        this.rtime = rtime;
        this.trust = trust;
        this.describes = describes;
        this.roleId = roleId;
    }

   
    // Property accessors

    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return this.username;
    }
    
    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return this.password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }

    public Integer getSex() {
        return this.sex;
    }
    
    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public String getPhoto() {
        return this.photo;
    }
    
    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public Integer getAge() {
        return this.age;
    }
    
    public void setAge(Integer age) {
        this.age = age;
    }

    public String getCardId() {
        return this.cardId;
    }
    
    public void setCardId(String cardId) {
        this.cardId = cardId;
    }

    public String getAddress() {
        return this.address;
    }
    
    public void setAddress(String address) {
        this.address = address;
    }

    public String getZip() {
        return this.zip;
    }
    
    public void setZip(String zip) {
        this.zip = zip;
    }

    public String getTelephone() {
        return this.telephone;
    }
    
    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getMobilephone() {
        return this.mobilephone;
    }
    
    public void setMobilephone(String mobilephone) {
        this.mobilephone = mobilephone;
    }

    public String getQq() {
        return this.qq;
    }
    
    public void setQq(String qq) {
        this.qq = qq;
    }

    public String getMail() {
        return this.mail;
    }
    
    public void setMail(String mail) {
        this.mail = mail;
    }

    public double getWage() {
        return this.wage;
    }
    
    public void setWage(double wage) {
        this.wage = wage;
    }

    public double getFinalWage() {
        return this.finalWage;
    }
    
    public void setFinalWage(double finalWage) {
        this.finalWage = finalWage;
    }

    public Date getRtime() {
        return this.rtime;
    }
    
    public void setRtime(Date rtime) {
        this.rtime = rtime;
    }

    public Integer getTrust() {
        return this.trust;
    }
    
    public void setTrust(Integer trust) {
        this.trust = trust;
    }

    public String getDescribes() {
        return this.describes;
    }
    
    public void setDescribes(String describes) {
        this.describes = describes;
    }

    public Integer getRoleId() {
        return this.roleId;
    }
    
    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }
   








}