package com.itwill.bakery.service;

import java.util.List;

import com.itwill.bakery.dao.UserDao;
import com.itwill.bakery.vo.Address;
import com.itwill.bakery.vo.User;



public class UserService {
	private UserDao userDao;
	
	public UserService() throws Exception{
		
		userDao= new UserDao();
		
	}
	
	//회원가입
	
	public int createUser(User user) throws Exception{
		
		if(userDao.existedUser(user.getUser_id())) {
			return -1;
			}else {
				int rowCount = userDao.createUser(user);
				return rowCount;
			}
		
	
	}
	
	
	
	
	
	//로그인 
	
	
	public int login(String user_id,String user_password) throws Exception {
		int result=-1;
		
		User user = userDao.checkId(user_id);
		if(user==null) {
			//아이디없음
			result=0;
		}else {
			//아이디존재
			if(user.isMatchPassword(user_password)) {
				//성공
				result=1;
			}else {
				//비밀번호불일치
				result=2;
			}
		}
		
		return result;
	}
	
	//주소추가
	public int createAddress(Address address) throws Exception{
		return userDao.createAddress(address);
	}
		
	//회원정보보기
	public User selectUser(String userId) throws Exception{
		return userDao.selectUser(userId);
	}

	//회원 주소보기
	public List<Address> selectAddress(User user) throws Exception{
		return userDao.selectAddress(user);
	}
	//주소번호 주소검색
	public Address selectAddressno(int add_no) throws Exception{
		return userDao.selectAddressno(add_no);
	}
	
	//주소 주소검색
		public Address selectAddress(String addressStr) throws Exception{
			return userDao.selectAddress(addressStr);
		}
	
	//모든회원전체정보
	public List<User> selectAllUser() throws Exception{
		List<User> userList = userDao.selectAllUser();
		return userList;
	}
	
	
	//회원정보수정
	public int updateUser(User user)throws Exception{
		return userDao.updateUser(user);
	}
	//회원 포인트 수정
	public int updatePoint(User user) throws Exception{
		return userDao.updatePoint(user);
	}
	
	public int addPoint(String id,int point) throws Exception{
		User user=new User(id, null, null, null, null, point, null);
		return userDao.addPoint(user);
	}
	
	//주소 수정
	public int updateAddr(Address address) throws Exception{
		return userDao.updateAddress(address);
	}
	
	//주소한개 삭제
	public int deleteAddress(Address address)throws Exception{
		return userDao.deleteAddress(address);
	}
	//회원탈퇴
	public int deleteUser(String user_id) throws Exception{
		return userDao.deleteUser(user_id);
	}
	
	
	
		
	//아이디중복체크

	public boolean isDuplicateId(String userId) throws Exception {
		boolean isExist = userDao.existedUser(userId);
		if (isExist) {
			return true;
		} else {
			return false;
		}
	}
		
		
		
		
	
	
	
	
	}


