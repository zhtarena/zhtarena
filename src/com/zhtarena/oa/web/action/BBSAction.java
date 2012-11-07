package com.zhtarena.oa.web.action;

import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import com.zhtarena.oa.dao.BBSDao;
import com.zhtarena.oa.dao.impl.BBSDaoImpl;
import com.zhtarena.oa.entity.Bbs;

public class BBSAction extends BasicAction{

	private static final long serialVersionUID = 1L;
	
	private List<Bbs> bbss;
	private Bbs bbs;
	private int id;
	private List<Bbs> subBbs;
	private Boolean flag;
	private long pageNo;
	private long countPage;
	private int pageSize=3;
	
	BBSDao dao = new BBSDaoImpl();

	/**
	 * 显示所有的主题
	 */
	public String listRoot() throws Exception {
		toGetcountPage();
		bbss = dao.findRoot((pageNo-1)*pageSize,pageSize);
		return "success";
	}
	
	/**
	 * 发表新贴子
	 */
	public String openTopic() throws Exception {
		bbs.setRootId(0);
		bbs.setRtime(new Date());
		bbs.setIsLeaf(0);
		dao.insert(bbs);
		return "insertOk";
	}
	
	/**
	 * 通过帖子id查找到帖子和对应的子帖子
	 */
	public String load() throws Exception {
		toGetRecountPage();
		bbs = dao.findById(id);
		subBbs = dao.findByRootId(id,(pageNo-1)*pageSize,pageSize);
		return "loadOk";
	}
	/**
	 * 回复帖子
	 */
	public String replyTopic()throws Exception {
		bbs.setRtime(new Date());
		Bbs parentBbs = dao.findById(bbs.getRootId());
		if(parentBbs.getIsLeaf()==0) {
			parentBbs.setIsLeaf(1);
			dao.update(parentBbs);
		}
		dao.insert(bbs);
		id = parentBbs.getId();
		return "replyOk";
	}
	
	/**
	 * 检查一个主题下面是否有子贴子
	 */
	public String checkBBSHasReBBS() throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		if(dao.findByRootId(id).size()<=0) {
			out.print("noSub");
		}else {
			out.print("hasSub");
		}
		return null;
	}
	
	/**
	 * 通过主题的id来删除贴子,会传进来一个用来判断是否有子贴的标示符.
	 */
	public String delById() throws Exception {
		//如果没有子贴子,直接删除主题
		if(flag==false) {
			dao.del(id);
		} else if(flag==true) { //如果主题下有子帖子,先删除子帖子,再删除主题
			dao.delByRootId(id);
			dao.del(id);
		}
		
		return "delByIdOk";
	}
	
	/**
	 * 计算主题总页数，会顺便对pageNo进行判断，防止越界
	 * @throws Exception
	 */
	private void toGetcountPage() throws Exception {
		
		long total = dao.findRootCount();
		countPage = ((total%pageSize==0)?total/pageSize:total/pageSize+1); 
		this.parsePageNO();
	}
	
	private void toGetRecountPage() throws Exception {
		
		long total = dao.findReBBScount(id);
		countPage = ((total%pageSize==0)?total/pageSize:total/pageSize+1); 
		this.parsePageNO();
	}
	
	private void parsePageNO() {
		if(pageNo<1) {
			pageNo = 1;
		}
		if(pageNo>countPage) {
			pageNo = countPage;
		}
	}
	
	public List<Bbs> getBbss() {
		return bbss;
	}
	public void setBbss(List<Bbs> bbss) {
		this.bbss = bbss;
	}

	public Bbs getBbs() {
		return bbs;
	}

	public void setBbs(Bbs bbs) {
		this.bbs = bbs;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public List<Bbs> getSubBbs() {
		return subBbs;
	}

	public void setSubBbs(List<Bbs> subBbs) {
		this.subBbs = subBbs;
	}

	public Boolean getFlag() {
		return flag;
	}

	public void setFlag(Boolean flag) {
		this.flag = flag;
	}

	

	public long getPageNo() {
		return pageNo;
	}

	public void setPageNo(long pageNo) {
		this.pageNo = pageNo;
	}

	public long getCountPage() {
		return countPage;
	}

	public void setCountPage(long countPage) {
		this.countPage = countPage;
	}
	
}
