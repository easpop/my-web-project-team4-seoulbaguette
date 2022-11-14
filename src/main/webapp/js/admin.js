function productInsert() {
if (document.f.p_name.value == "") {
		alert("상품명을 입력하십시요.");
		f.p_name.focus();
		return false;
	}
	if (document.f.p_price.value == "") {
		alert("상품 가격을 입력하십시요.");
		f.p_price.focus();
		return false;
	}
	if (document.f.p_desc.value == "") {
		alert("상품 설명을 입력하십시요.");
		f.p_desc.focus();
		return false;
	}
	document.f.action = "admin_product_insert_action.jsp";
	document.f.method = 'POST';
	document.f.submit();
}

function productInsertForm(){
	location.href = "admin_product_insert_form.jsp";

}

function productCancel() {
	location.href = "product_list.jsp";

}

function productCancelM() {
	document.f.action = "product_detail.jsp";
	document.f.method = 'POST';
	document.f.submit();
}

function productModifyForm() {
	document.product_detail_form.action = "admin_product_modify_form.jsp";
	document.product_detail_form.method = "post";
	document.product_detail_form.submit();

}

function productModify() {
	if (document.f.p_name.value == "") {
		alert("상품명을 입력하십시요.");
		f.p_name.focus();
		return false;
	}
	if (document.f.p_price.value == "") {
		alert("상품 가격을 입력하십시요.");
		f.p_price.focus();
		return false;
	}
	if (document.f.p_desc.value == "") {
		alert("상품 설명을 입력하십시요.");
		f.p_desc.focus();
		return false;
	}
	document.f.action = "admin_product_modify_action.jsp";
	document.f.method = "post";
	document.f.submit();
}

function productDelete() {
	alert("상품을 삭제하시겠습니까?");
	document.product_detail_form.action = "admin_product_delete_action.jsp";
	document.product_detail_form.method = "post";
	document.product_detail_form.submit();

}

function checkAdmin(id) {
	if (id == "admin") {
		document.getElementById("admin_m").disabled = false;
	} else {
		document.getElementById("admin_m").disabled = true;
	}

}