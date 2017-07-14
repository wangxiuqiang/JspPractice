package dao;
//商品的业务逻辑类

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.spi.DirStateFactory.Result;

import entity.Items;
import sun.security.pkcs11.Secmod.DbMode;
import util.DBHelper;

public class ItemsDao {
	/**
	 * 获得所有的商品信息
	 */
	public ArrayList<Items> getAllItems() {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		ArrayList<Items> list = new ArrayList<Items>();
		try {
			conn = DBHelper.getConn();
			String sql = "select * from items";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Items item = new Items();
				item.setId(rs.getInt("id"));
				item.setName(rs.getString("name"));
				item.setCity(rs.getString("city"));
				item.setNumber(rs.getInt("number"));
				item.setPicture(rs.getString("picture"));
				item.setPrice(rs.getInt("price"));
				list.add(item);
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (SQLException e) {
					e.printStackTrace();
				}
				
			}
			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (SQLException e) {
					e.printStackTrace();
				}
				
			}
		}
	}
	public Items getItemsById(int id){
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBHelper.getConn();
			String sql = "select * from items where id = ?";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, id);
			rs = stmt.executeQuery();
			if(rs.next()) {
				Items item = new Items();
				item.setId(rs.getInt("id"));
				item.setName(rs.getString("name"));
				item.setCity(rs.getString("city"));
				item.setNumber(rs.getInt("number"));
				item.setPicture(rs.getString("picture"));
				item.setPrice(rs.getInt("price"));
			    return item;
			}
			else{
				return null;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (SQLException e) {
					e.printStackTrace();
				}
				
			}
			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (SQLException e) {
					e.printStackTrace();
				}
				
			}
		}
	}
	public ArrayList<Items> getListView(String list){
		ArrayList<Items> listItem = new ArrayList<Items>();
		if(list != null && list.length() >0){
			String arr[] = list.split(",");
			if(arr.length > 5){
				for(int i = arr.length -1 ; i >= arr.length - 5 ;i--){
					int id = Integer.parseInt(arr[i]);
					listItem.add(getItemsById(id));
				}
			}
			else{
				for(int i = arr.length -1 ; i >= 0 ;i--){
					int id = Integer.parseInt(arr[i]);
					listItem.add(getItemsById(id));
				}
			}
			return listItem;
		}else{
			return null;
		}
	}
}
