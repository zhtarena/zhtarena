package com.zhtarena.oa.entity;

import java.util.Date;


/**
 * Mail entity. @author MyEclipse Persistence Tools
 */

public class Mail  implements java.io.Serializable {


    // Fields    

     private static final long serialVersionUID = 1L;
     private Integer id;
     private String msgId;
     private String subject;
     private String from;
     private String to;
     private String cc;
     private String bcc;
     private String content;
     private boolean isHtml;
     private Date sentDate;
     private boolean isRead;
     private boolean isEmergent;
     private boolean isNeedReceipt;
     private Integer mailType;
     private Date saveTime;
     private String attachment;
     private String muserId;
     private Integer domainId;


    // Constructors

    /** default constructor */
    public Mail() {
    }

    
    /** full constructor */
    public Mail(String msgId, String subject, String from, String to, String cc, String bcc, String content, boolean isHtml, Date sentDate, boolean isRead, boolean isEmergent, boolean isNeedReceipt, Integer mailType, Date saveTime, String attachment, String muserId, Integer domainId) {
        this.msgId = msgId;
        this.subject = subject;
        this.from = from;
        this.to = to;
        this.cc = cc;
        this.bcc = bcc;
        this.content = content;
        this.isHtml = isHtml;
        this.sentDate = sentDate;
        this.isRead = isRead;
        this.isEmergent = isEmergent;
        this.isNeedReceipt = isNeedReceipt;
        this.mailType = mailType;
        this.saveTime = saveTime;
        this.attachment = attachment;
        this.muserId = muserId;
        this.domainId = domainId;
    }

   
    // Property accessors

    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

    public String getMsgId() {
        return this.msgId;
    }
    
    public void setMsgId(String msgId) {
        this.msgId = msgId;
    }

    public String getSubject() {
        return this.subject;
    }
    
    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getFrom() {
        return this.from;
    }
    
    public void setFrom(String from) {
        this.from = from;
    }

    public String getTo() {
        return this.to;
    }
    
    public void setTo(String to) {
        this.to = to;
    }

    public String getCc() {
        return this.cc;
    }
    
    public void setCc(String cc) {
        this.cc = cc;
    }

    public String getBcc() {
        return this.bcc;
    }
    
    public void setBcc(String bcc) {
        this.bcc = bcc;
    }

    public String getContent() {
        return this.content;
    }
    
    public void setContent(String content) {
        this.content = content;
    }

    public boolean getIsHtml() {
        return this.isHtml;
    }
    
    public void setIsHtml(boolean isHtml) {
        this.isHtml = isHtml;
    }

    public Date getSentDate() {
        return this.sentDate;
    }
    
    public void setSentDate(Date sentDate) {
        this.sentDate = sentDate;
    }

    public boolean getIsRead() {
        return this.isRead;
    }
    
    public void setIsRead(boolean isRead) {
        this.isRead = isRead;
    }

    public boolean getIsEmergent() {
        return this.isEmergent;
    }
    
    public void setIsEmergent(boolean isEmergent) {
        this.isEmergent = isEmergent;
    }

    public boolean getIsNeedReceipt() {
        return this.isNeedReceipt;
    }
    
    public void setIsNeedReceipt(boolean isNeedReceipt) {
        this.isNeedReceipt = isNeedReceipt;
    }

    public Integer getMailType() {
        return this.mailType;
    }
    
    public void setMailType(Integer mailType) {
        this.mailType = mailType;
    }

    public Date getSaveTime() {
        return this.saveTime;
    }
    
    public void setSaveTime(Date saveTime) {
        this.saveTime = saveTime;
    }

    public String getAttachment() {
        return this.attachment;
    }
    
    public void setAttachment(String attachment) {
        this.attachment = attachment;
    }

    public String getMuserId() {
        return this.muserId;
    }
    
    public void setMuserId(String muserId) {
        this.muserId = muserId;
    }

    public Integer getDomainId() {
        return this.domainId;
    }
    
    public void setDomainId(Integer domainId) {
        this.domainId = domainId;
    }
   








}