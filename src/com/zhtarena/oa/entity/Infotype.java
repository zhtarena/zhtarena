package com.zhtarena.oa.entity;



/**
 * Infotype entity. @author MyEclipse Persistence Tools
 */

public class Infotype  implements java.io.Serializable {


    // Fields    

     private static final long serialVersionUID = 1L;
     private Integer id;
     private String type;
     private String describes;


    // Constructors

    /** default constructor */
    public Infotype() {
    }

    
    /** full constructor */
    public Infotype(String type, String describes) {
        this.type = type;
        this.describes = describes;
    }

   
    // Property accessors

    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

    public String getType() {
        return this.type;
    }
    
    public void setType(String type) {
        this.type = type;
    }

    public String getDescribes() {
        return this.describes;
    }
    
    public void setDescribes(String describes) {
        this.describes = describes;
    }
   








}