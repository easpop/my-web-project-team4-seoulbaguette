package com.itwill.bakery.sql;

public class UserSQL {
	public final static String USER_INSERT 
	= "insert into user_info (user_id,user_password,user_name,user_email,user_phone,user_point) values (?,?,?,?,?,?)";

	public final static String ADDRESS_INSERT 
	= "insert into address(add_no,address,user_id) values(address_add_no_SEQ.nextval,?,?)";

	/****** update *******/

	public final static String USER_UPDATE 
			= "update user_info set user_password=?,user_name=?,user_phone=?,user_email=? where user_id=?";

	public final static String USER_POINT_UPDATE 
			= "update user_info set user_point=user_point- ?  where user_id=?";
	
	public final static String USER_POINT_ADD
	="update user_info set user_point=user_point+ ?  where user_id=?";

	public final static String ADDRESS_UPDATE 
			= "update address set address=? where add_no=?";

	/******** select *******/

	public final static String USER_SELECT_BY_ID 
			= "select * from user_info where user_id=?";

	public final static String USER_SELECT_ID_COUNT
			= "select count(*) from user_info where user_id=?";
	
	public final static String ADDRESS_SELECT_BY_ID 
			= "select * from address where user_id=?";

	public final static String USER_ADDRESS_BY_ID 
			= "select * from user_info u join address a on u.user_id= a.user_id where u.user_id=?";
	
	public final static String ADDRESS_SELECT_BY_NO
	= "select * from address where add_no=?";

	public final static String USER_SELECT_ALL 
			= "select * from user_info";

	public final static String ADDRESS_SELECT_ALL 
			= "select * from address";
	
	public final static String ADDRESS_SELECT_BY_ADDRESS 
			= "select * from address where address=?";

	/******** delete *****/
	public final static String USER_DELETE 
			= "delete from user_info where user_id =?";

	public final static String ADDRESS_DELETE_ONE 
			= "delete from address where add_no=?";

	// 해당 회원의 주소록 전체 삭제
	public final static String ADDRESS_DELETE_ALL 
			= "delete from address where user_id=?";

}
