package com.zhtarena.oa.entity;



/**
 * Domain entity. @author MyEclipse Persistence Tools
 */

public class Domain  implements java.io.Serializable {


    // Fields    

     private static final long serialVersionUID = 1L;
     private Integer id;
     private String name;
     private String loginName;
     private String loginPassword;
     private String pop3Server;
     private String smtpServer;
     private boolean keepCopy;
     private String muserId;


    // Constructors

    /** default constructor */
    public Domain() {
    }

    
    /** full constructor */
    public Domain(String name, String loginName, String loginPassword, String pop3Server, String smtpServer, boolean keepCopy, String muserId) {
        this.name = name;
        this.loginName = loginName;
        this.loginPassword = loginPassword;
        this.pop3Server = pop3Server;
        this.smtpServer = smtpServer;
        this.keepCopy = keepCopy;
        this.muserId = muserId;
    }

   
    // Property accessors

    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }

    public String getLoginName() {
        return this.loginName;
    }
    
    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    public String getLoginPassword() {
        return this.loginPassword;
    }
    
    public void setLoginPassword(String loginPassword) {
        this.loginPassword = loginPassword;
    }

    public String getPop3Server() {
        return this.pop3Server;
    }
    
    public void setPop3Server(String pop3Server) {
        this.pop3Server = pop3Server;
    }

    public String getSmtpServer() {
        return this.smtpServer;
    }
    
    public void setSmtpServer(String smtpServer) {
        this.smtpServer = smtpServer;
    }

    public boolean getKeepCopy() {
        return this.keepCopy;
    }
    
    public void setKeepCopy(boolean keepCopy) {
        this.keepCopy = keepCopy;
    }

    public String getMuserId() {
        return this.muserId;
    }
    
    public void setMuserId(String muserId) {
        this.muserId = muserId;
    }
   








}