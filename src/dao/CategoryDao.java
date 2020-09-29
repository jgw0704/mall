package dao;
import java.sql.*;
import java.util.*;
import commons.*;
import vo.*;

public class CategoryDao {
	// Category ¸ñ·Ï
	public ArrayList<Category> selectCategoryList() throws Exception {
		ArrayList<Category> list = new ArrayList<Category>();
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "select category_id, category_name from category";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			Category category = new Category();
			//category.categoryId = rs.getInt("category_id");
			category.setCategoryId(rs.getInt("category_id"));
			//category.categoryName = rs.getString("category_name");
			category.setCategoryName(rs.getString("category_name"));
			list.add(category);
		}
		conn.close();
		return list;
	}
	
	   public ArrayList<Category> selectCategoryCkList() throws Exception {
	      ArrayList<Category> list = new ArrayList<Category>();

	      DBUtil dbUtil = new DBUtil(); 
	      Connection conn = dbUtil.getConnection(); 
	     
	      String sql = "select category_id, category_pic from category where category_ck = 'Y' limit 0, 4";
	      PreparedStatement stmt = conn.prepareStatement(sql);
	      ResultSet rs = stmt.executeQuery();
	      while (rs.next()) {
	         Category category = new Category(); 
	         // category.categoryId = rs.getInt("category_id");
	         category.setCategoryId(rs.getInt("category_id"));
	         // category.categoryPic = rs.getString("category_pic");
	         category.setCategoryPic(rs.getString("category_pic"));
	         list.add(category);
	      }
	      conn.close(); 
	      return list;
	   }
}