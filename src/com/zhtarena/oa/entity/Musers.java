package com.zhtarena.oa.entity;



/**
 * Musers entity. @author MyEclipse Persistence Tools
 */

public class Musers  implements java.io.Serializable {


    // Fields    

     private static final long serialVersionUID = 1L;
     private String username;
     private String pwdHash;
     private String pwdAlgorithm;
     private Integer useForwarding;
     private String forwardDestination;
     private Integer useAlias;
     private String alias;


    // Constructors

    /** default constructor */
    public Musers() {
    }

    
    /** full constructor */
    public Musers(String pwdHash, String pwdAlgorithm, Integer useForwarding, String forwardDestination, Integer useAlias, String alias) {
        this.pwdHash = pwdHash;
        this.pwdAlgorithm = pwdAlgorithm;
        this.useForwarding = useForwarding;
        this.forwardDestination = forwardDestination;
        this.useAlias = useAlias;
        this.alias = alias;
    }

   
    // Property accessors

    public String getUsername() {
        return this.username;
    }
    
    public void setUsername(String username) {
        this.username = username;
    }

    public String getPwdHash() {
        return this.pwdHash;
    }
    
    public void setPwdHash(String pwdHash) {
        this.pwdHash = pwdHash;
    }

    public String getPwdAlgorithm() {
        return this.pwdAlgorithm;
    }
    
    public void setPwdAlgorithm(String pwdAlgorithm) {
        this.pwdAlgorithm = pwdAlgorithm;
    }

    public Integer getUseForwarding() {
        return this.useForwarding;
    }
    
    public void setUseForwarding(Integer useForwarding) {
        this.useForwarding = useForwarding;
    }

    public String getForwardDestination() {
        return this.forwardDestination;
    }
    
    public void setForwardDestination(String forwardDestination) {
        this.forwardDestination = forwardDestination;
    }

    public Integer getUseAlias() {
        return this.useAlias;
    }
    
    public void setUseAlias(Integer useAlias) {
        this.useAlias = useAlias;
    }

    public String getAlias() {
        return this.alias;
    }
    
    public void setAlias(String alias) {
        this.alias = alias;
    }
   








}