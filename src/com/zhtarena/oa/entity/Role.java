package com.zhtarena.oa.entity;



/**
 * Role entity. @author MyEclipse Persistence Tools
 */

public class Role  implements java.io.Serializable {


    // Fields    

     private static final long serialVersionUID = 1L;
     private Integer id;
     private String name;


    // Constructors

    /** default constructor */
    public Role() {
    }

    
    /** full constructor */
    public Role(String name) {
        this.name = name;
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
   








}