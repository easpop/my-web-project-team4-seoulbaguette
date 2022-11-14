package com.itwill.bakery.vo;

public class Cart {
	private int cart_no;
	private int cart_qty;
	private Product product;
	private String user_id;
	
	public Cart() {
		// TODO Auto-generated constructor stub
	}
	
	
	public Cart(int cart_no, int cart_qty, Product product, String user_id) {
		super();
		this.cart_no = cart_no;
		this.cart_qty = cart_qty;
		this.product = product;
		this.user_id = user_id;
	}


	public int getCart_no() {
		return cart_no;
	}

	public void setCart_no(int cart_no) {
		this.cart_no = cart_no;
	}

	public int getCart_qty() {
		return cart_qty;
	}

	public void setCart_qty(int cart_qty) {
		this.cart_qty = cart_qty;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}


	@Override
	public String toString() {
		return "Cart [cart_no=" + cart_no + ", cart_qty=" + cart_qty + ", product=" + product + ", user_id=" + user_id
				+ "]";
	}
	
	
}
