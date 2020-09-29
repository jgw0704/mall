package dao;

import java.util.*;
import commons.DBUtil;
import java.sql.*;
import vo.*;

public class OrdersDao {
	//추가
	public void insertOrders(Orders orders) throws Exception {
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "insert into orders(product_id, orders_amount, orders_price, member_email, orders_addr, orders_state, orders_date) values(?,?,?,?,?,'결제완료',now())";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, orders.getProductId());
		stmt.setInt(2, orders.getOrdersAmount());
		stmt.setInt(3, orders.getOrdersPrice());
		stmt.setString(4, orders.getMemberEmail());
		stmt.setString(5, orders.getOrdersAddr());
		stmt.executeLargeUpdate();
		conn.close();
	}
	
	//목록
	public ArrayList<Orders> selectOrdersListByEmail(String memberEmail) throws Exception {
		ArrayList<Orders> list = new ArrayList<Orders>();
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "select orders_id, product_id, orders_amount, orders_price, member_email, orders_addr, orders_state, orders_date from orders where member_email = ? ";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, memberEmail);
		System.out.println(memberEmail+"<-memberEmail");
		ResultSet rs = stmt.executeQuery();
		while (rs.next()) {
			Orders o = new Orders();
			o.setOrdersId(rs.getInt("orders_id"));
			o.setProductId(rs.getInt("product_id"));
			o.setOrdersAmount(rs.getInt("orders_amount"));
			o.setOrdersPrice(rs.getInt("orders_price"));
			o.setMemberEmail(rs.getString("member_email"));
			o.setOrdersAddr(rs.getString("orders_addr"));
			o.setOrdersState(rs.getString("orders_state"));
			o.setOrdersDate(rs.getString("orders_date"));
			list.add(o);
		}
		conn.close();
		return list;
	}
	
	public ArrayList<Orders> selectOrdersList() throws Exception {
		ArrayList<Orders> list = new ArrayList<Orders>();
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "select orders_id, product_id, orders_amount, orders_price, member_email, orders_addr, orders_state, orders_date from orders";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		while (rs.next()) {
			Orders o = new Orders();
			o.setOrdersId(rs.getInt("orders_id"));
			o.setProductId(rs.getInt("product_id"));
			o.setOrdersAmount(rs.getInt("orders_amount"));
			o.setOrdersPrice(rs.getInt("orders_price"));
			o.setMemberEmail(rs.getString("member_email"));
			o.setOrdersAddr(rs.getString("orders_addr"));
			o.setOrdersState(rs.getString("orders_state"));
			o.setOrdersDate(rs.getString("orders_date"));
			list.add(o);
			}
		conn.close();
		return list;
	}
}