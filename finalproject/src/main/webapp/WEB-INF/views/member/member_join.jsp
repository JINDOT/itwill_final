<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<style type="text/css">
@import url(https://fonts.googleapis.com/css?family=Lato:300);

.login {
	width: 80%;
	padding: 60px 0 0;
	margin: auto;
}

.form2 {
	position: relative;
	z-index: 1;
	background: #FFFFFF;
	max-width: 100%; 
	margin: 0 auto 140px;
	padding: 60px;
	padding-top: 20px;
	text-align: center;
	/* box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0
		rgba(0, 0, 0, 0.24); */
	/* border: 1px solid #ddd; */
	border-top: 2px solid #72c02c;
	border-bottom: 2px solid #687074;
	border-left: 1px solid #ddd;
	border-right: 1px solid #ddd;
}

.form2 input {
	font-family: "Lato", sans-serif;
	/* font: 15px/1.55 'Open Sans', Helvetica, Arial, sans-serif; */
	outline: 0;
	/*     background: #e7e4e4; */
	background: white;
	width: 72%;
	border: 1px solid #bbb;
	margin: 0 0 10px;
	padding: 10px;
	box-sizing: border-box;
	font-size: 15px;
}

.form2 #phone_1 {
	font-family: "Lato", sans-serif;
	outline: 0;
	/*     background: #e7e4e4; */
	background: white;
	width: 23.8%;
	border: 1px solid #bbb;
	margin: 0 0 10px;
	padding: 10px;
	box-sizing: border-box;
	font-size: 14px;
}
.form2 #phone_2 {
	font-family: "Lato", sans-serif;
	outline: 0;
	/*     background: #e7e4e4; */
	background: white;
	width: 72%;
	border: 1px solid #bbb;
	margin: 0 0 10px;
	padding: 10px;
	box-sizing: border-box;
	font-size: 14px;
}


.form2 button {
	font-family: "Lato", sans-serif;
	text-transform: uppercase;
	outline: 0;
	opacity: 0.8;
	background: #72c02c;
	width: 20%;
	border: 0;
	padding: 15px;
	color: #FFFFFF;
	font-size: 14px;
	-webkit-transition: all 0.3 ease;
	transition: all 0.3 ease;
	cursor: pointer;
}

.form2 button:hover, .form button:active, .form button:focus {
	opacity: 1;
}
.form2 #btn:hover, .form #btn:active, .form #btn:focus {
	opacity: 1;
}

.form2 .alternate {
	margin: 20px 0 0;
	font-size: 16px;
}

.form2 .alternate a {
	color: #687074;
	/* text-decoration: underline; */
}

.join_label{
	font: 15px/1.55 'Open Sans', Helvetica, Arial, sans-serif;
	text-align: left;
	/* font-size: 15px; */
	width: 17%
}

.form2 h3{
	text-align: center;
}
#privateuse{
	font: 15px/1.55 'Open Sans', Helvetica, Arial, sans-serif;
	color: #555;
}

#privateuse input{
	width: 30px;
	text-align:center;
	font-size: 15px;
}

#privateuse a{
	font-size: 15px;
	color: red;
	cursor: pointer;
}

#sample6_postcode{
	width: 56.2%
}
#sample6_postcode, #sample6_address{
	background: #EAEAEA70;
} 

.form2 #btn {
	font-family: "Lato", sans-serif;
	background: white;
	width: 15%;
}
hr{
	border-color: #ddd;
}
</style>



<link rel="stylesheet" href="../assets/css/pages/page_log_reg_v1.css">
<link rel="stylesheet" href="../assets/plugins/hover-effects/css/custom-hover-effects.css">

<!-- CSS Page Style -->
<link rel="stylesheet" href="../assets/css/pages/page_404_error.css">

<!-- CSS Page Style -->
<link rel="stylesheet" href="../assets/css/pages/page_search_inner.css">


<!-- Logo??? ?????? -->
<link href='https://fonts.googleapis.com/css?family=Righteous' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Audiowide' rel='stylesheet' type='text/css'>

<!-- CSS Customization -->
<link rel="stylesheet" href="../assets/css/custom.css">
<link rel="stylesheet" href="../assets/css/room.css">
<script type="text/javascript">
function memberCreate() {
	if(joinForm.mId.value=="") {
		alert("???????????? ??????????????????");
		joinForm.mId.focus();
		return;
	}

	if(joinForm.mPw.value=="") {
		alert("??????????????? ??????????????????");
		joinForm.mPw.focus();
		return;
	} 
	
	var pwReg=/^[A-Za-z0-9]{6,20}$/;//??????+?????? 6~20?????? ??????
	if (joinForm.mPw.value!="" && !pwReg.test(joinForm.mPw.value)) {
		alert("??????????????? ??????, ????????? ?????? 6????????? ??????????????????")
		joinForm.mPw.focus();
		return;
	}						
	
	if(joinForm.mName.value=="") {
		alert("????????? ????????? ?????????.");
		joinForm.mName.focus();
		return;
	}		

	if(joinForm.mPhone.value=="") {
		alert("??????????????? ????????? ?????????.");
		joinForm.mPhone.focus();
		return;
	}
	
	var regExp=/^\d{3}-\d{3,4}-\d{4}$/;
	if(!regExp.test(joinForm.mPhone.value)) {
		alert("??????????????? ??????(010-0000-0000)??? ?????? ??????????????????.");
		joinForm.mPhone.focus();
		return;
	}
	
	if(joinForm.mEmail.value=="") {
		alert("???????????? ????????? ?????????.");
		joinForm.mEmail.focus();
		return;
	}
	
	var regExp=/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	if(!regExp.test(joinForm.mEmail.value)) {
		alert("???????????? ????????? ?????? ??????????????????.");
		joinForm.mEmail.focus();
		return;
	}
	
	if(!joinForm.agreeCheck.checked) {
		alert("??????????????? ??????????????? ??????????????? ???????????????.");
		joinForm.agreeCheck.focus();
		return;
	}

	joinForm.action = "${pageContext.request.contextPath}/member/join";
	joinForm.submit();
}						
</script>									
</head>
<body>
<div class="wrapper">
	<!--=== End Header ===-->
	<div class="breadcrumbs">
    <div class="container">
        <h1 class="pull-left">JOIN</h1>
        <ul class="pull-right breadcrumb">
            <li><a href="${pageContext.request.contextPath}/member/login">?????????</a></li>
            <li class="active">????????????</li>
            <li><a href="${pageContext.request.contextPath}/member/find">ID/PW ??????</a></li>
        </ul>
    </div>
	</div>
	
<!-- JoinForm start -->
<div class="container content">
		<div class="login">
			<div class="form2">
				<h3>JOIN</h3><br><br><br>
				<p style="color: red;">${message }</p>
				<form class="login-form" name="joinForm" method="post">	
					
					<label class="join_label">?????????&nbsp;<img src="${pageContext.request.contextPath }/assets/img/aspring/aaa.gif"></label> 
					<input type="text" name="mId" value="${member.mId}" placeholder="ID" /><br>
					
					<label class="join_label">????????????&nbsp;<img src="${pageContext.request.contextPath }/assets/img/aspring/aaa.gif"></label>
					<input type="password" name="mPw"  placeholder="PASSWORD" /><br>
					<%-- 
					<label class="join_label">???????????? ??????&nbsp;<img src="${pageContext.request.contextPath }/assets/img/aspring/aaa.gif"></label> 
					<input type="password" name="mPw"  placeholder="PASSWORD CHECK" /><br>
					--%>
					<hr>	
					
					<label class="join_label">??????&nbsp;<img src="${pageContext.request.contextPath }/assets/img/aspring/aaa.gif"></label>
					<input type="text" name="mName" value="${member.mName}" placeholder="NAME" /><br>
					
					<label class="join_label">????????????&nbsp;<img src="${pageContext.request.contextPath }/assets/img/aspring/aaa.gif"></label>
					<input type="text" name="mPhone" id="phone_2"  value="${member.mPhone}" placeholder="PHONE" />
					<%-- 
					<select id="phone_1">
						<option>010</option>
						<option>011</option>
					</select>
					--%>
					<%-- <input type="text" name="mPhone" id="phone_3"  value="${member.mPhone}" placeholder="PHONE" />--%><br>
					
					<label class="join_label">?????????&nbsp;<img src="${pageContext.request.contextPath }/assets/img/aspring/aaa.gif"></label> 
					<input type="email" name="mEmail" value="${member.mEmail}" placeholder="E-MAIL" /><br>
					
					
					<hr>
					<div id="privateuse">
					<input type="checkbox" name="agreeCheck" id="privateuse">???????????? ???????????? (??????)
                    <a class="small" data-toggle="modal" data-target=".bs-book-consent1-sm">??????</a> <br>
                       
                    <input type="checkbox" id="privateuse">???????????? ???????????? (??????)
                    <a class="small" data-toggle="modal" data-target=".bs-book-consent2-sm">??????</a>
                    </div>
				</form>
				
					<!-- <br><br><br> --><hr>
					<div style="text-align: center">
					<button type="button" onclick="memberCreate();">????????????</button>&nbsp;&nbsp;<button>??????</button>
					<!-- <p class="alternate">

						<a href="#">????????????</a>&nbsp;/&nbsp;<a href="#">ID/PW ??????</a>
					</p> -->
					</div>
			</div>
		</div>
</div>
<!-- JoinForm end -->




		<!-- footer -->
	</div><!--/wrapper-->
	
	


<!-- ============================================================================================================= -->

<div class="modal fade bs-book-consent1-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button aria-hidden="true" data-dismiss="modal" class="close" type="button">??</button>
                <h4 id="bookOrderModalLabel3" class="modal-title">???????????? ?????? ?????????</h4>
            </div>
            <div class="modal-body">
                <div class="content-boxes-v3 margin-bottom-10 md-margin-bottom-20">
                    <i class="icon-custom icon-sm rounded-x icon-color-orange icon-line icon-note"></i>
                    <div class="content-boxes-in-v3">
                        <h5>??????????????? ????????????</h5>
                        <p>?????? ????????? ?????? ?????? ?????? ??? ??????????????? ?????? ????????? ??????.</p>
                    </div>
                </div>
                <div class="content-boxes-v3 margin-bottom-10 md-margin-bottom-20">
                    <i class="icon-custom icon-sm rounded-x icon-color-orange icon-line icon-note"></i>
                    <div class="content-boxes-in-v3">
                        <h5>???????????? ??????????????? ??????</h5>
                        <p>??????, ??????????????????, IP_Address, Cookie</p>
                    </div>
                </div>
                <div class="content-boxes-v3 margin-bottom-10 md-margin-bottom-20">
                    <i class="icon-custom icon-sm rounded-x icon-color-orange icon-line icon-note"></i>
                    <div class="content-boxes-in-v3">
                        <h5>??????????????? ????????????</h5>
                        <p>???????????? ??? 2??? ????????? ???????????? ?????? ??? ???????????? ?????? ??????.</p>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button data-dismiss="modal" class="btn-u btn-u-default" type="button">??????</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade bs-book-consent2-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button aria-hidden="true" data-dismiss="modal" class="close" type="button">??</button>
                <h4 id="bookOrderModalLabel3" class="modal-title">???????????? ?????? ?????????</h4>
            </div>
            <div class="modal-body">
                <div class="content-boxes-v3 margin-bottom-10 md-margin-bottom-20">
                    <i class="icon-custom icon-sm rounded-x icon-color-orange icon-line icon-note"></i>
                    <div class="content-boxes-in-v3">
                        <h5>??????????????? ????????????</h5>
                        <p>??????????????? ????????? ???????????? ????????? ?????? ????????? ?????? ???????????? ??? ?????? ?????? ????????? ????????? ??????.</p>
                    </div>
                </div>
                <div class="content-boxes-v3 margin-bottom-10 md-margin-bottom-20">
                    <i class="icon-custom icon-sm rounded-x icon-color-orange icon-line icon-note"></i>
                    <div class="content-boxes-in-v3">
                        <h5>???????????? ??????????????? ??????</h5>
                        <p>??????, ??????????????????</p>
                    </div>
                </div>
                <div class="content-boxes-v3 margin-bottom-10 md-margin-bottom-20">
                    <i class="icon-custom icon-sm rounded-x icon-color-orange icon-line icon-note"></i>
                    <div class="content-boxes-in-v3">
                        <h5>??????????????? ????????????</h5>
                        <p>?????? ????????? ?????? ??? ?????????????????? 3??? ?????? ???????????? ?????? ????????? ????????? ?????????.</p>
                        <p></p>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button data-dismiss="modal" class="btn-u btn-u-default" type="button">??????</button>
            </div>
        </div>
    </div>
</div>

<!-- ============================================================================================================= -->
