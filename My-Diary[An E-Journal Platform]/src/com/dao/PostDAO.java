package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.user.Posts;


public class PostDAO {

	private Connection conn;

	public PostDAO(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean addPost(String title,String content,int uid,Date date,int vid) {
		boolean f=false;
		try {
			String query="insert into posts(title,content,date,uid,vid) values(?,?,?,?,?)";
			java.sql.PreparedStatement ps=conn.prepareStatement(query);
			ps.setString(1,title);
			ps.setString(2, content);
			ps.setDate(3,(java.sql.Date)date);
			ps.setInt(4,uid);
			ps.setInt(5, vid);
		int i=	ps.executeUpdate();
		if(i==1) {
			f=true;
		}
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	
	public List<Posts> getPosts(int uid){
		List<Posts> list=new ArrayList<Posts>();
		Posts post=null;
		try {
			String query="select p.pid,p.title,p.content,p.date,v.visibility from posts p,post_visibility v where uid=? and p.vid=v.vid order by pid desc";
			PreparedStatement ps=conn.prepareStatement(query);
			ps.setInt(1, uid);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				post=new Posts();;
				post.setPid(rs.getInt(1));
				post.setTitle(rs.getString(2));
				post.setContent(rs.getString(3));
				post.setPdate(rs.getDate(4));
				post.setVisibility(rs.getString(5));
				list.add(post);
				
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public Posts getPostByID(int pid) {
		Posts post=null;
		try {
			String query="select title,content from posts where pid=?";
			PreparedStatement ps=conn.prepareStatement(query);
			ps.setInt(1, pid);
			
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				post=new Posts();;
				post.setPid(pid);
				post.setTitle(rs.getString(1));
				post.setContent(rs.getString(2));
				
				
				
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return post;
	}
	
	public List<Posts> getAllPosts(){
		List<Posts> list=new ArrayList<Posts>();
		Posts post=null;
		try {
			String query="select p.pid,p.title,p.content,p.date,u.uname,v.visibility from posts p,user_info u,post_visibility v where p.uid=u.uid and p.vid=v.vid";
			PreparedStatement ps=conn.prepareStatement(query);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				post=new Posts();
				
				post.setPid(rs.getInt(1));
				post.setTitle(rs.getString(2));
				post.setContent(rs.getString(3));
				post.setPdate(rs.getDate(4));
				post.setuName(rs.getString(5));
				post.setVisibility(rs.getString(6));
				list.add(post);
				
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	public boolean updatePost(int pid,String title,String content) {
		boolean f=false;
		Posts post=null;
		try {
			String query="update posts set title=?,content=? where pid=?";
			PreparedStatement ps=conn.prepareStatement(query);
			ps.setString(1, title);
			ps.setString(2,content);
			ps.setInt(3, pid);
			
			int res=ps.executeUpdate();
			if(res==1) {
			f=true;
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public boolean DeletePost(int pid) {
		
		boolean f=false;
		Posts post=null;
		try {
			String query="delete from posts where pid=?";
			PreparedStatement ps=conn.prepareStatement(query);
	
			ps.setInt(1, pid);
			
			int res=ps.executeUpdate();
			if(res==1) {
			f=true;
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
}
