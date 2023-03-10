<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--=== Header ===--> 
    <div class="header">
        <div class="container">
            <!-- Logo -->
            <a class="logo" href="${pageContext.request.contextPath }" rel="nofollow">
                <img src="${pageContext.request.contextPath }/assets/img/aspring/logo/aspring_logo_top.png" alt="에이스프링 제주모던펜션">                 
            </a>
            <!-- End Logo -->

            <!-- Topbar -->
            <div class="topbar">
                <ul class="loginbar pull-right">
                    <li class="hoverSelector">
                        <i class="fa fa-university"></i>
                        <a>입금계좌</a>
                        <ul class="topbank hoverSelectorBlock">
                            <li><span class="page-scroll"><a href="#bank-info">신한은행</a></span></li>
                            <li><span class="page-scroll"><a href="#bank-info">110-427-123123</a></span></li>
                            <li><span class="page-scroll"><a href="#bank-info">홍길동</a></span></li>
                        </ul>
                    </li>
                    <li class="topbar-devider">
                    <li><span class="fa fa-mobile fa-lg"></span> <a href="tel:010-3032-7443">010-1234-5678</a></li>
                    <li class="topbar-devider">
                    <c:if test="${loginMember.mStatus==9}">
                   		<li><a href="${pageContext.request.contextPath }/admin/test1">Admin</a></li>
                    </c:if>
                </ul>
            </div>
            <!-- End Topbar -->

            <!-- Toggle get grouped for better mobile display -->
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-responsive-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="fa fa-bars"></span>
            </button>
            <!-- End Toggle -->
        </div><!--/end container-->

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse mega-menu navbar-responsive-collapse">
            <div class="container">
                <ul class="nav navbar-nav">
                    <!-- Home -->
                    <li class="dropdown ">
                        <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown">
                            객실안내
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="${pageContext.request.contextPath }/roomtest1">ROOM1 (그레이테마)</a></li>
                            <li><a href="${pageContext.request.contextPath }/roomtest2">ROOM2 (블루테마)</a></li>
                            <li><a href="${pageContext.request.contextPath }/roomtest3">ROOM3 (내츄럴테마)</a></li>
                            <li><a href="${pageContext.request.contextPath }/roomtest4">ROOM4 (블랙테마)</a></li>
                            
                        </ul>
                    </li>
                    <!-- End Home -->

                    <!-- Pages -->
                    <li class="dropdown ">
                        <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown">
                            예약
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="${pageContext.request.contextPath }/rsv/stepOne">객실예약</a></li>
                            <li><a href="${pageContext.request.contextPath }/rsv/myRsvList">예약확인 및 취소</a></li>
                            <li><a href="${pageContext.request.contextPath }/rsvtest3">이용요금 및 안내</a></li>
                            <li><a href="${pageContext.request.contextPath }/rsvtest1">취소/환불 규정 안내</a></li>
                        </ul>
                    </li>
                    <!-- End Pages -->

                    <!-- Blog -->
                    <!-- End Blog -->

                    <!-- Portfolio -->
                    <li class="dropdown "><a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown">게시판</a>
						<ul class="dropdown-menu">
							<li><a href="${pageContext.request.contextPath }/info">공지</a></li>
							<li><a href="${pageContext.request.contextPath }/review">리뷰</a></li>
						</ul>
					</li>
                    <li class="dropdown "><a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown">회원</a>
						<ul class="dropdown-menu">
						<c:choose>
						<c:when test="${empty(loginMember)}">
							<li><a href="${pageContext.request.contextPath }/member/login">로그인</a></li>
							<li><a href="${pageContext.request.contextPath }/member/join">회원가입</a></li>
							<li><a href="${pageContext.request.contextPath }/member/find">ID/PW찾기</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="${pageContext.request.contextPath }/member/logout">로그아웃</a></li>
							<!--  <li><a href="${pageContext.request.contextPath }/member/update">마이페이지</a></li>-->
							<li><a href="${pageContext.request.contextPath }/member/update?mId="+mId>마이페이지</a></li>
							
						</c:otherwise>
						</c:choose>
						</ul>
					</li>
					<li class="">
                        <a href="${pageContext.request.contextPath }/location">오시는길</a>
                    </li>
                    <!-- End Portfolio -->
                </ul>
            </div><!--/end container-->
        </div>
        <!--/navbar-collapse-->
    </div>