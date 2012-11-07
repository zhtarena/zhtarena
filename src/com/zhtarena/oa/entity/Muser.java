package com.zhtarena.oa.entity;



/**
 * Muser entity. @author MyEclipse Persistence Tools
 */

public class Muser  implements java.io.Serializable {


    // Fields    

     private static final long serialVersionUID = 1L;
     private String id;
     private String displayName;
     private String password;
     private String defaultDomain;


    // Constructors

    /** default constructor */
    public Muser() {
    }

    
    /** full constructor */
    public Muser(String displayName, String password, String defaultDomain) {
        this.displayName = displayName;
        this.password = password;
        this.defaultDomain = defaultDomain;
    }

   
    // Property accessors

    public String getId() {
        return this.id;
    }
    
    public void setId(String id) {
        this.id = id;
    }

    public String getDisplayName() {
        return this.displayName;
    }
    
    public void setDisplayName(String displayName) {
        this.displayName = displayName;
    }

    public String getPassword() {
        return this.password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }

    public String getDefaultDomain() {
        return this.defaultDomain;
    }
    
    public void setDefaultDomain(String defaultDomain) {
        this.defaultDomain = defaultDomain;
    }
   








}