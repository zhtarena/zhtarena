package com.zhtarena.oa.entity;

import java.util.Date;


/**
 * Document entity. @author MyEclipse Persistence Tools
 */

public class Document  implements java.io.Serializable {


    // Fields    

     private static final long serialVersionUID = 1L;
     private Integer id;
     private String name;
     private String describes;
     private String appendix;
     private Date ctime;
     private String history;
     private Integer sender;
     private Integer receiver;
     private Integer dstatus;
     private Integer flowId;


    // Constructors

    /** default constructor */
    public Document() {
    }

    
    /** full constructor */
    public Document(String name, String describes, String appendix, Date ctime, String history, Integer sender, Integer receiver, Integer dstatus, Integer flowId) {
        this.name = name;
        this.describes = describes;
        this.appendix = appendix;
        this.ctime = ctime;
        this.history = history;
        this.sender = sender;
        this.receiver = receiver;
        this.dstatus = dstatus;
        this.flowId = flowId;
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

    public String getDescribes() {
        return this.describes;
    }
    
    public void setDescribes(String describes) {
        this.describes = describes;
    }

    public String getAppendix() {
        return this.appendix;
    }
    
    public void setAppendix(String appendix) {
        this.appendix = appendix;
    }

    public Date getCtime() {
        return this.ctime;
    }
    
    public void setCtime(Date ctime) {
        this.ctime = ctime;
    }

    public String getHistory() {
        return this.history;
    }
    
    public void setHistory(String history) {
        this.history = history;
    }

    public Integer getSender() {
        return this.sender;
    }
    
    public void setSender(Integer sender) {
        this.sender = sender;
    }

    public Integer getReceiver() {
        return this.receiver;
    }
    
    public void setReceiver(Integer receiver) {
        this.receiver = receiver;
    }

    public Integer getDstatus() {
        return this.dstatus;
    }
    
    public void setDstatus(Integer dstatus) {
        this.dstatus = dstatus;
    }

    public Integer getFlowId() {
        return this.flowId;
    }
    
    public void setFlowId(Integer flowId) {
        this.flowId = flowId;
    }
   








}