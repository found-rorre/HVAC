<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- header-->
 <a class="menu-toggle rounded" href="#"><i class="fas fa-bars"></i></a>
 <!-- Navigation-->
    <nav id="sidebar-wrapper">
        <ul class="sidebar-nav">
			<li class="sidebar-brand">
            	<c:choose>
				    <c:when test="${sessionScope.memberName == null}">
				    	<a class="menu_title" href="<%= request.getContextPath() %>/login/login.do">로그인</a>
				    </c:when>
				    <c:otherwise>
				    	<a href="<%=request.getContextPath()%>/member/info.do">${sessionScope.memberName} 님</a>
				    	&nbsp;&nbsp;
				    	<a href="<%=request.getContextPath()%>/login/logout.do"><i class="bi bi-box-arrow-right"></i></a>
				    </c:otherwise>
				</c:choose>
            </li>        
            <li class="sidebar-nav-item"><a href="<%=request.getContextPath()%>/">홈</a></li>
            <li class="sidebar-nav-item"><a href="<%=request.getContextPath()%>/car/search">예약</a></li>
            <li class="sidebar-nav-item"><a href="<%=request.getContextPath()%>/user/question.do">문의</a></li>
            <li class="sidebar-nav-item"><a href="<%=request.getContextPath()%>/">공지</a></li>
        </ul>
    </nav>
