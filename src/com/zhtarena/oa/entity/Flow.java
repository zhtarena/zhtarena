package com.zhtarena.oa.entity;



/**
 * Flow entity. @author MyEclipse Persistence Tools
 */

public class Flow  implements java.io.Serializable {


    // Fields    

     private static final long serialVersionUID = 1L;
     private Integer id;
     private String name;
     private String pic;
     private String appendix;


    // Constructors

    /** default constructor */
    public Flow() {
    }

    
    /** full constructor */
    public Flow(String name, String pic, String appendix) {
        this.name = name;
        this.pic = pic;
        this.appendix = appendix;
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

    public String getPic() {
        return this.pic;
    }
    
    public void setPic(String pic) {
        this.pic = pic;
    }

    public String getAppendix() {
        return this.appendix;
    }
    
    public void setAppendix(String appendix) {
        this.appendix = appendix;
    }
   








}