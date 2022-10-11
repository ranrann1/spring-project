<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>      	
 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>


<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	
<script type="text/javascript" src="<c:url value="/resources/js/script_idCheck.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/script_emailCheck.js"/>"></script>	
<script type="text/javascript" src="<c:url value="/resources/js/script.js"/>"></script>
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
			<img class="tit" src="<c:url value="/resources/assets/images/logo.png"/>" onClick="location.href='<c:url value="/index"/>';" style = "cursor:pointer;">
		</h2>
	</div>
	
	<div class="page_article">
		<div class="type_form member_join">
			<form name="join" id = "join" method = "post" >
				<p class="page_sub">
					<span class="ico">*</span>필수입력사항
				</p>
				<table class="tbl_comm">
					<tr class="fst">
						<th>아이디<span class="ico">*</span></th>
						<td>
							<input type="text" name="id" id="id" placeholder="6자 이상의 영문 혹은 영문과 숫자를 조합" oninput = "checkId()" > 
							<div id="idMsg" class="error">* 아이디를 입력해주세요</div>
							<div id="idRegMsg" class="error">* 6자 이상의 영문 혹은 영문과 숫자를 조합</div>
							<div>
								<div class="id_ok" style = "display:none; color:skyblue;  padding: 15px 0px 0px 10px;">사용 가능한 아이디입니다.</div>
								<div class="id_already" style = "display:none; color:red;  padding: 15px 0px 0px 10px;">현재 사용중인 아이디 입니다</div>
							</div>
							
						</td>
					
					</tr>
						
					
					<tr>
						<th>비밀번호<span class="ico">*</span></th>
						<td>
							<input type="password" name="password" id="password" placeholder="비밀번호를 입력해주세요" >
							<div id="passwdMsg" class="error">비밀번호를 입력해 주세요</div>
							<div id="passwdRegMsg" class="error">10~16 자리, 영문/숫자/특수문자(공백
								제외)만 허용하며, 2개 이상 조합</div>
						</td>
					</tr>
					<tr class="member_pwd">
						<th>비밀번호확인<span class="ico">*</span></th>
						<td>
							<input type="password" name="repassword" id ="repassword"placeholder="비밀번호를 한번 더 입력해주세요">
							<div id="repasswdMsg" class="error">비밀번호 확인을 입력해 주세요.</div>
							<div id="repasswdMatchMsg" class="error">동일한 비밀번호를 입력해주세요.</div>
						</td>
					</tr>
					<tr>
						<th>이름<span class="ico">*</span></th>
						<td>
							<input type="text" name="name" id="name" 	placeholder="이름을 입력해주세요">
							<div id="nameMsg" class="error">이름을 입력해 주세요.</div></td>
					</tr>
					<tr>
						<th>이메일<span class="ico">*</span></th>
						<td>
							<input type="text" name="email" class="email" id="email" placeholder="예: nBang@gmail.com" oninput="checkEmail()"> 						
							<div id="emailMsg" class="error">이메일을 입력해 주세요.</div>
							<div id="emailRegMsg" class="error">올바른 이메일 주소를 입력해해주세요.</div>
							<div id="example_email" class="error">예시 : nBang@gmail.com</div>
							<div>
								<div class="id_ok_email" style = "display:none; color:skyblue;  padding: 15px 0px 0px 10px;">사용 가능한 아이디입니다.</div>
								<div class="id_already_email" style = "display:none; color:red;  padding: 15px 0px 0px 10px;">현재 사용중인 아이디 입니다</div>
							</div>
						</td>
					</tr>
					<tr class="field_phone">
						<th>휴대폰<span class="ico">*</span></th>
						<td>
							<input type="text" name="mobile1" id="mobile1" maxlength="3" placeholder = "010"   >
							<input type="text" name="mobile2" id="mobile2" maxlength="4" placeholder = "1111">
							<input type="text" name="mobile3" id="mobile3" maxlength="4" placeholder = "2222" >
							<input type = "hidden" name = "phone" value = "${user.phone }">
							<div id="mobileMsg" class="error">전화번호를 입력해 주세요.</div>
							<div id="mobileRegMsg" class="error">11~12자리 숫자로만 입력해 주세요.</div>
						</td>
					</tr>
					<tr>
						<th>주소<span class="ico">*</span></th>
						<td class="field_address">
							<div>
								<div id="wrapper">
									<input type="text" name="zipcode" id="zipcode" size="7"
										readonly="readonly" placeholder="번지를 검색해 주세요." > 
									<a id="addressSearch" class="search"> 
									<span id="addressNo" class="address_no" data-text="재검색">주소 검색</span>
									</a>
								</div>
								<input type="text" name="address1" id="address1"
									readonly="readonly"  placeholder="주소를 검색해주세요." > 
								<input type="text" name="address2" id="address2" placeholder="나머지 주소를 입력해주세요" >
								
								<div id="addressMsg" class="error">번지 또는 주소를 검색해주세요.</div>
								<div id="addressEmpty" class="error">상세 주소를 입력해주세요.</div>
							</div>
						</td>
						
					</tr>
					</tbody>
				</table>
				<div id="formSubmit" class="form_footer">
					<button class="btn active btn_join" onclick = "userCreate();">회원가입</button>
					
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
	
	var passwd=$("#password").val();
	var passwdReg=/^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[~!@#$%^&*_-]).{6,20}$/g;
	if(passwd=="") {
		$("#passwdMsg").show();
		validResult=false;
	} else if(!passwdReg.test(passwd)) {
		$("#passwdRegMsg").show();
		validResult=false;
	}
	
	var repasswd = $("#repassword").val()
	if(repasswd=="") {
		$("#repasswdMsg").show();
		validResult=false;
	} else if(passwd != repasswd) {
		$("#repasswdMatchMsg").show();
		validResult=false;
	}
	
	var name=$("#name").val();
	var nameReg=/^[가-힣]{2,10}$/g;
	if(name=="") {
		$("#nameMsg").show();
		validResult=false;
	} 
	
	var email=$("#email").val();
	var emailReg=/^([a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+(\.[-a-zA-Z0-9]+)+)*$/g;
	if(email=="") {
		$("#emailMsg").show();
		validResult=false;
	} else if(!emailReg.test(email)) {
		$("#emailRegMsg").show();
		validResult=false;
	}
	
	var mobile1 = $("#mobile1").val();
	var mobile2 = $("#mobile2").val();
	var mobile3 = $("#mobile3").val();
	var mobile1Reg=/\d{3}/;
	var mobile2Reg=/\d{3,4}/;
	var mobile3Reg=/\d{4}/;
	if(mobile1=="" || mobile2 =="" || mobile3 ==""){
		$("#mobileMsg").show();
		validResult=false;
	} else if(!mobile1Reg.test(mobile1) || !mobile2Reg.test(mobile2) || !mobile3Reg.test(mobile3)) {
		$("#mobileRegMsg").show();
		validResult=false;
	}
	
	
	
	var zipcode = $("#zipcode").val();
	var address1 = $("#address1").val();
	var address2 = $("#address2").val();
	if(zipcode=="" || address1 ==""){
		$("#addressMsg").show();
		validResult=false;
	} else if(address2 =="") {
		$("#addressEmpty").show();
		validResult=false;
	}
	
	
	return validResult;
});



</script>

<script type="text/javascript">
function userCreate() {
	
	join.action = index;
	join.submit();
}

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