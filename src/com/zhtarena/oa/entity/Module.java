package com.zhtarena.oa.entity;

/**
 * Module entity. @author MyEclipse Persistence Tools
 */

public class Module  implements java.io.Serializable {


    // Fields    

     private static final long serialVersionUID = 1L;
     
     private Integer id;
     private Integer pmodule;
     private String name;
     private Integer isLeaf;
     private String img;
     private Integer sort;
     private String url;

    // Constructors

    /** default constructor */
    public Module() {
    }
    
    // Property accessors

    public Integer getId() {
        return this.id;
    }
    
    public Integer getPmodule() {
		return pmodule;
	}

	public void setPmodule(Integer pmodule) {
		this.pmodule = pmodule;
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

    public Integer getIsLeaf() {
        return this.isLeaf;
    }
    
    public void setIsLeaf(Integer isLeaf) {
        this.isLeaf = isLeaf;
    }

    public String getImg() {
        return this.img;
    }
    
    public void setImg(String img) {
        this.img = img;
    }

    public Integer getSort() {
        return this.sort;
    }
    
    public void setSort(Integer sort) {
        this.sort = sort;
    }

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

    
}