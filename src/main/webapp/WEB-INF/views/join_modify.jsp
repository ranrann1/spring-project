<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>      	

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보 변경</title>


<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	
<link
	href="https://www.kurly.com/shop/data/skin/designgj/common.css?ver=1.70.10"
	type="text/css" rel="stylesheet">
<link
	href="https://www.kurly.com/asset/css/cart/list.bundle.css?ver=1.70.10"
	type="text/css" rel="stylesheet">
	
<link
	href="https://www.kurly.com/shop/data/skin/designgj/normalize.css?ver=1.70.10"
	type="text/css" rel="stylesheet">

<link href="https://holaworld.io/static/css/main.d10e25fd.chunk.css"
	type="text/css" rel="stylesheet">

<link rel=stylesheet href="<c:url value="/resources/css/joinForm.css"/>" type="text/css">

</head>
<body>
<div class = "holder">
	<div class="tit_page">
		<h2 class="tit">	
			회원정보 변경
		</h2>
	</div>
	
	<div class="page_article">
		<div class="type_form member_join">
			<form name="join" id = "join" method = "post" >
				<table class="tbl_comm">
					<tr class="fst">
						<th>아이디</th>
						<td>
							<input type="text" name="id" id="id" readonly placeholder="6자 이상의 영문 혹은 영문과 숫자를 조합" value="${loginUser.id}" > 
							<div id="idMsg" class="error">아이디를 입력해주세요</div>
							<div id="idRegMsg" class="error">6자 이상의 영문 혹은 영문과 숫자를 조합</div>
						</td>
					
					</tr>
							
					
					<tr>
						<th>이름</th>
						<td>
							<input type="text" name="name" id="name" 	placeholder="이름을 입력해주세요" value="${loginUser.name}">
							<div id="nameMsg" class="error">이름을 입력해 주세요.</div></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>
							<input type="text" name="email" class="email" id="email" placeholder="예: nBang@gmail.com" value="${loginUser.email}"> 						
							<div id="emailMsg" class="error">이메일을 입력해 주세요.</div>
							<div id="emailRegMsg" class="error">올바른 이메일 주소를 입력해해주세요.</div>
							<div id="example_email" class="error">예시 : nBang@gmail.com</div>
						</td>
					</tr>
					<tr class="field_phone">
						<th>휴대폰</th>
						<td>
							<input type="text" name="mobile1" id="mobile1" maxlength="3" placeholder = "010" >
							<input type="text" name="mobile2" id="mobile2" maxlength="4" placeholder = "1111" >
							<input type="text" name="mobile3" id="mobile3" maxlength="4" placeholder = "2222"  >
							<div id="mobileMsg" class="error">전화번호를 입력해 주세요.</div>
							<div id="mobileRegMsg" class="error">11~12자리 숫자로만 입력해 주세요.</div>
						</td>
					</tr>
					<tr>
						<th>주소</th>
						<td class="field_address">
							<div>
								<div id="wrapper">
									<input type="text" name="zipcode" id="zipcode" size="7"
										readonly="readonly" placeholder="번지를 검색해 주세요."  > 
									<a id="addressSearch" class="search"> 
									<span id="addressNo" class="address_no" data-text="재검색">주소 검색</span>
									</a>
								</div>
								<input type="text" name="address1" id="address1"
									readonly="readonly"  placeholder="주소를 검색해주세요."  > 
								<input type="text" name="address2" id="address2" placeholder="나머지 주소를 입력해주세요"  >
								
								<div id="addressMsg" class="error">번지 또는 주소를 검색해주세요.</div>
								<div id="addressEmpty" class="error">상세 주소를 입력해주세요.</div>
							</div>
						</td>
						
					</tr>
					</tbody>
				</table>
				<div id="formSubmit" class="form_footer">
					<button class="btn active btn_join" >확인</button>
					
				</div>
			</form>
		</div>
	</div>
</div>

<script type="text/javascript">
$("#id").focus();
$("#join").submit(function() {
	$(".error").hide();

	var validResult=true;
	
	var id=$("#id").val();
	var idReg=/^[a-zA-Z]\w{5,19}$/g;
	if(id=="") {
		$("#idMsg").show();
		validResult=false;
	} else if(!idReg.test(id)) {
		$("#idRegMsg").show();
		validResult=false;
	} 
		
	
	var email=$("#email").val();
	var emailReg=/^([a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+(\.[-a-zA-Z0-9]+)+)*$/g;
	
	if(!emailReg.test(email)) {
		$("#emailRegMsg").show();
		validResult=false;
	}
	
	var mobile1 = $("#mobile1").val();
	var mobile2 = $("#mobile2").val();
	var mobile3 = $("#mobile3").val();
	var mobile1Reg=/\d{3}/;
	var mobile2Reg=/\d{3,4}/;
	var mobile3Reg=/\d{4}/;
	if(!mobile1Reg.test(mobile1) || !mobile2Reg.test(mobile2) || !mobile3Reg.test(mobile3)) {
		$("#mobileRegMsg").show();
		validResult=false;
	}
		
	
	
	return validResult;
});



</script>





<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js">
</script>
<script>
	$("#addressNo").click(function() {
		new daum.Postcode({
			oncomplete : function(data) {
				join.zipcode.value = data.zonecode;
				
				join.address1.value = data.roadAddress;
			}
		}).open();
	});
</script>
       	
       
	
</body>
</html>