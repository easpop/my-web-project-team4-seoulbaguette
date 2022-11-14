package com.itwill.bakery.dao.test;

import com.itwill.bakery.dao.ProductDao;
import com.itwill.bakery.vo.Product;

public class ProductDaoTestMain {

	public static void main(String[] args) throws Exception {
		ProductDao productDao=new ProductDao();
		System.out.println(productDao.selectByNo(3));
		System.out.println(productDao.selectByCategory(1));
		System.out.println(productDao.selectAll());
		//System.out.println(productDao.update(new Product(0, "톡톡 콘치즈 핫도그", 4500, null, "톡톡터지는 콘치즈", 0, 0)));
		//System.out.println(productDao.delete(4));
		
		Product product=new Product(0, "신제품", 10000, null, "신제품테스트", 0, 3);
		System.out.println(productDao.insert(product));
	}

}
