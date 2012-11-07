package com.zhtarena.oa.entity;

import java.util.Date;


/**
 * Notice entity. @author MyEclipse Persistence Tools
 */

public class Notice  implements java.io.Serializable {


    // Fields    

     private static final long serialVersionUID = 1L;
     private Integer id;
     private Integer uid;
     private Integer typeId;
     private String subject;
     private String content;
     private Date rtime;
     private String describes;


    // Constructors

    /** default constructor */
    public Notice() {
    }

    
    /** full constructor */
    public Notice(Integer uid, Integer typeId, String subject, String content, Date rtime, String describes) {
        this.uid = uid;
        this.typeId = typeId;
        this.subject = subject;
        this.content = content;
        this.rtime = rtime;
        this.describes = describes;
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

    public Integer getTypeId() {
        return this.typeId;
    }
    
    public void setTypeId(Integer typeId) {
        this.typeId = typeId;
    }

    public String getSubject() {
        return this.subject;
    }
    
    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getContent() {
        return this.content;
    }
    
    public void setContent(String content) {
        this.content = content;
    }

    public Date getRtime() {
        return this.rtime;
    }
    
    public void setRtime(Date rtime) {
        this.rtime = rtime;
    }

    public String getDescribes() {
        return this.describes;
    }
    
    public void setDescribes(String describes) {
        this.describes = describes;
    }
   








}