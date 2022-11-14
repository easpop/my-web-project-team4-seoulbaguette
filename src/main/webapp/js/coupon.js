/**
 * 
 */

function couponCreate() {
	document.f.method='POST';
	document.f.action = "coupon_create_action.jsp";
	document.f.submit();
}

function couponDelete() {
	document.f.method='POST';
	document.f.action = "coupon_delete_action.jsp";
	document.f.submit();
}

function couponOrderList(){
	document.order_create_form.method='POST';
	document.order_create_form.action = "coupon_list_order.jsp";
	document.order_create_form.submit();
}

function couponUserList(){
	document.f.method='POST';
	document.f.action = "coupon_list_user.jsp";
	document.f.submit();
}

function couponCal(){
	document.order_create_form.method="post";	
	document.order_create_form.action="coupon_cal_action.jsp";
	document.order_create_form.submit();
	
}

function couponSelect(c_no){
	var selectList = document.getElementById("couponList");
	for(i=0;i<10;i++){
	if(selectList.options[i].value == c_no){
		selectList.options[i].selected;
		return;
	}
	}
}
