package com.user;

import java.util.Date;

public class Posts {
	private String uName;
	private int pid;
	private String title;
	private String content;
	private Date pdate;
	private UserDetails user;
	private String visibility;
	public Posts(int pid, String title, String content, Date pdate, UserDetails user) {
		super();
		this.pid = pid;
		this.title = title;
		this.content = content;
		this.pdate = pdate;
		this.user = user;
	}
	public Posts() {
		super();
	
	}
	
	public String getuName() {
		return uName;
	}
	public void setuName(String uName) {
		this.uName = uName;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getPdate() {
		return pdate;
	}
	public void setPdate(Date pdate) {
		this.pdate = pdate;
	}
	public UserDetails getUser() {
		return user;
	}
	public void setUser(UserDetails user) {
		this.user = user;
	}
	public String getVisibility() {
		return visibility;
	}
	public void setVisibility(String visibility) {
		this.visibility = visibility;
	}
	

}
