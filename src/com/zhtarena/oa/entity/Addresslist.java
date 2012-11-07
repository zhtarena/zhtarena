package com.zhtarena.oa.entity;



/**
 * Addresslist entity. @author MyEclipse Persistence Tools
 */

public class Addresslist  implements java.io.Serializable {


    // Fields    

     private static final long serialVersionUID = 1L;
     private Integer id;
     private Integer uid;
     private String linkman;
     private String mail;
     private String telephone;
     private String mobilephone;
     private String address;
     private String zip;
     private String qq;
     private String msn;


    // Constructors

    /** default constructor */
    public Addresslist() {
    }

    
    /** full constructor */
    public Addresslist(Integer uid, String linkman, String mail, String telephone, String mobilephone, String address, String zip, String qq, String msn) {
        this.uid = uid;
        this.linkman = linkman;
        this.mail = mail;
        this.telephone = telephone;
        this.mobilephone = mobilephone;
        this.address = address;
        this.zip = zip;
        this.qq = qq;
        this.msn = msn;
    }

   
    // Property accessors

    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUid() {
        return this.uid;
    }
    
    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getLinkman() {
        return this.linkman;
    }
    
    public void setLinkman(String linkman) {
        this.linkman = linkman;
    }

    public String getMail() {
        return this.mail;
    }
    
    public void setMail(String mail) {
        this.mail = mail;
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

    public String getQq() {
        return this.qq;
    }
    
    public void setQq(String qq) {
        this.qq = qq;
    }

    public String getMsn() {
        return this.msn;
    }
    
    public void setMsn(String msn) {
        this.msn = msn;
    }
   
}