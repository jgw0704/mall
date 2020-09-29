package dao;

import java.util.*;
import vo.*;
import java.sql.*;
import commons.*;

public class NoticeDao {
	public ArrayList<Notice> selectNoticeList() throws Exception{
	ArrayList<Notice> list = new ArrayList<Notice>();
	DBUtil dbUtil = new DBUtil();
	Connection conn = dbUtil.getConnection();
	String sql = "select notice_id, notice_title from notice order by notice_date desc limit 0,2";
	PreparedStatement stmt = conn.prepareStatement(sql);
	ResultSet rs = stmt.executeQuery();
	while(rs.next()) {
		Notice n = new Notice();
		// n.noticeId = rs.getInt("notice_id");
		n.setNoticeId(rs.getInt("notice_id"));
		// n.noticeTitle = rs.getString("notice_title");
		n.setNoticeTitle(rs.getString("notice_title"));
		list.add(n);
	}
	return list;
}
	
	public Notice selectNoticeOne(int noticeId) throws Exception{
		Notice notice = null;
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "select notice_id, notice_title, notice_content, notice_date from notice where notice_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, noticeId);
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			Notice n = new Notice();
			// n.noticeId = rs.getInt("notice_id");
			n.setNoticeId(rs.getInt("notice_id"));
			// n.noticeTitle = rs.getString("notice_title");
			n.setNoticeTitle(rs.getString("notice_title"));
			// n.noticeContent = rs.getString("notice_content");
			n.setNoticeContent(rs.getString("notice_content"));
			// n.noticeDate = rs.getString("notice_date");
			n.setNoticeDate(rs.getString("notice_date"));
		}
	return notice;
	}
}