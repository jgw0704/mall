package dao;
import java.sql.*;
import java.util.*;
import commons.*;
import vo.*;

public class ProductDao {
	public Product selectProductOne(int productId) throws Exception {
		Product product = null;
		DBUtil dbUtil = new DBUtil(); 
		Connection conn = dbUtil.getConnection(); 
		String sql = "select product_id, category_id, product_name, product_price, product_content, product_soldout, product_pic from product where product_id=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, productId);
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			product = new Product();
			product.setProductId(rs.getInt("product_id"));
			product.setProductName(rs.getString("product_name"));
			product.setProductContent(rs.getNString("product_content"));
			product.setProductPic(rs.getString("product_pic"));
			product.setProductPrice(rs.getInt("product_price"));
			product.setProductSoldout(rs.getString("product_soldout"));
		}
		return product;
	}


	public ArrayList<Product> selectProductPicList() throws Exception {
		ArrayList<Product> list = new ArrayList<Product>();
		DBUtil dbUtil = new DBUtil(); 
		Connection conn = dbUtil.getConnection(); 
		String sql = "select product_id, category_id, product_name, product_price, product_content, product_soldout, product_pic "
		+ "from product order by product_id asc limit 0, 6";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			Product product = new Product(); 
			// product.productId = rs.getInt("product_id");
			product.setProductId(rs.getInt("product_id"));
			// product.categoryId = rs.getInt("category_id");
			product.setCategoryId(rs.getInt("category_id"));
			// product.productName = rs.getString("product_name");
			product.setProductName(rs.getString("product_name"));
			// product.productPrice = rs.getInt("product_price");
			product.setProductPrice(rs.getInt("product_price"));
			// product.productSoldout = rs.getString("product_soldout");
			product.setProductSoldout(rs.getString("product_soldout"));
			// product.productPic = rs.getString("product_pic");
			product.setProductPic(rs.getString("product_pic"));
					list.add(product);
				}
		conn.close();
		return list;
	}
}