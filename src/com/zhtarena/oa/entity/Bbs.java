package com.zhtarena.oa.entity;

import java.util.Date;

/**
 * Bbs entity. @author MyEclipse Persistence Tools
 */

public class Bbs implements java.io.Serializable {

	// Fields

	private static final long serialVersionUID = 1L;
	private Integer id;
	private Integer uid;
	private String subject;
	private String content;
	private Date rtime;
	private Integer isLeaf;
	private Integer rootId;

	// Constructors

	/** default constructor */
	public Bbs() {
	}

	/** full constructor */
	public Bbs(Integer uid, String subject, String content, Date rtime,
			Integer isLeaf, Integer rootId) {
		this.uid = uid;
		this.subject = subject;
		this.content = content;
		this.rtime = rtime;
		this.isLeaf = isLeaf;
		this.rootId = rootId;
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

	public Integer getIsLeaf() {
		return this.isLeaf;
	}

	public void setIsLeaf(Integer isLeaf) {
		this.isLeaf = isLeaf;
	}

	public Integer getRootId() {
		return this.rootId;
	}

	public void setRootId(Integer rootId) {
		this.rootId = rootId;
	}

}