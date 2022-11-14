package com.itwill.bakery.service;

import java.util.List;

import com.itwill.bakery.dao.ProductDao;
import com.itwill.bakery.vo.Product;

public class ProductService {
	
	private ProductDao productDao;
	
	public ProductService() throws Exception {
		productDao=new ProductDao();
	}
	public Product selectByNo(int p_no) throws Exception {
		Product product=productDao.selectByNo(p_no);
		return product;
	}

	public List<Product> selectByCategory(int category_no) throws Exception {
		List<Product> productList=productDao.selectByCategory(category_no);
		return productList;
	}
	
	public List<Product> selectAll() throws Exception {
		List<Product> productList=productDao.selectAll();
		return productList;
	}
	
	public int update(Product product) throws Exception {
		int count=productDao.update(product);
		return count;
	}
	
	public int delete(int p_no) throws Exception {
		int count=productDao.delete(p_no);
		return count;
	}
	
	public int insert(Product product) throws Exception{
		return productDao.insert(product);
	}
	
	
}
