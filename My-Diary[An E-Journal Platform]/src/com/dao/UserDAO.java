package com.dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.user.AdminDetails;
import com.user.Posts;
import com.user.UserDetails;

public class UserDAO {

	private Connection conn;
	private ResultSet rs;

	public UserDAO(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addUser(UserDetails user) {
		boolean f = false;
		try {
			String query = "insert into user_info(uname,email,password) values(?,?,?)";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, user.getName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPassword());
			int res = ps.executeUpdate();
			if (res == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;

	}

	public UserDetails loginUser(UserDetails user) {
	    UserDetails user1=null;
		try {
			String query = "select * from user_info where email=? and password=?";
			PreparedStatement ps = conn.prepareStatement(query);

			ps.setString(1, user.getEmail());
			ps.setString(2, user.getPassword());
			rs = ps.executeQuery();
			if (rs.next()) {
				user1=new UserDetails();
				user1.setUid(rs.getInt("uid"));
				user1.setName(rs.getString("uname"));
				user1.setEmail(rs.getString("email"));
				user1.setPassword(rs.getString("password"));
				
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return user1;
	}
	
	
	public AdminDetails loginAdmin(AdminDetails admin) {
		AdminDetails admin1=null;
		try {
			String query = "select * from admin_info where email=? and password=?";
			PreparedStatement ps = conn.prepareStatement(query);

			ps.setString(1, admin.getEmail());
			ps.setString(2, admin.getPassword());
			rs = ps.executeQuery();
			if (rs.next()) {
				admin1=new AdminDetails();
				admin1.setUid(rs.getInt("id"));
				admin1.setName(rs.getString("name"));
				admin1.setEmail(rs.getString("email"));
				admin1.setPassword(rs.getString("password"));
				
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return admin1;
	}
	
	
	public List<UserDetails> getAllUsers() {
		List<UserDetails> users =new ArrayList<UserDetails>();
	    UserDetails user1=null;
		try {
			String query = "select * from user_info";
			PreparedStatement ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while(rs.next()) {
				user1=new UserDetails();
				user1.setUid(rs.getInt("uid"));
				user1.setName(rs.getString("uname"));
				user1.setEmail(rs.getString("email"));
				users.add(user1);
	
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return users;
	}
	
public boolean deleteUser(int uid) {
		
		boolean f=false;
		try {
			String query="delete from user_info where uid=?";
			PreparedStatement ps=conn.prepareStatement(query);
	
			ps.setInt(1, uid);
			
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
