<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


	<!-- Menu Begin -->
    <div class="offcanvas-menu-wrapper">
        <div class="offcanvas__logo">
            <a href="/test"><img src="<%= request.getContextPath()%>/images/logo.png" alt=""></a>
        </div>
        <div id="mobile-menu-wrap"></div>
        <ul class="offcanvas__widget__add">
            <li><i class="fa-solid fa-clock"></i> Weekday: 09:00 am to 18:30 pm</li>
            <li><i class="fa-solid fa-envelope"></i> ktym14452@gmail.com</li>
        </ul>
        <div class="offcanvas__phone__num">
            <i class="fa fa-phone"></i>
            <span>(+82) 010 2563 1675</span>
        </div>
        <div class="offcanvas__social">
          <a href="#"><i class="fa-brands fa-facebook"></i></a>
          <a href="#"><i class="fa-brands fa-twitter"></i></a>
          <a href="#"><i class="fa-brands fa-google"></i></a>
          <a href="#"><i class="fa-brands fa-instagram"></i></a>
        </div>
    </div>
    <!-- Menu End -->
    
    <!-- Header -->
    <header class="header">
        <div class="header__top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-7">
                        <ul class="header__top__widget">
                            <li><i class="fa-solid fa-clock"></i> Week day: 09:00 am to 18:30 pm</li>
                            <li><i class="fa-solid fa-envelope"></i> ktym14452@gmail.com</li>
                        </ul>
                    </div>
                    <div class="col-lg-5">
                        <div class="header__top__right">
                            <div class="header__top__phone">
                                <i class="fa fa-phone" style="color: white;"></i>
                                <span>(+82) 010 2563 1675</span>
                            </div>
                            <div class="header__top__social">
                                <a href="#"><i class="fa-brands fa-facebook"></i></a>
                                <a href="#"><i class="fa-brands fa-twitter"></i></a>
                                <a href="#"><i class="fa-brands fa-google"></i></a>
                                <a href="#"><i class="fa-brands fa-instagram"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="container">
            <div class="row">
                <div class="col-md-2">
                    <div class="header__logo">
                        <a href="/test"><img src="<%= request.getContextPath()%>/images/logo.png"></a>
                    </div>
                </div>
                <div class="col-md-8">
                    <div class="header__nav d-flex justify-content-center">
                        <nav class="header__menu">
                            <ul>
                                <li><a href="<%= request.getContextPath()%>/">홈</a></li>
                                <li><a href="<%= request.getContextPath()%>/car/search">예약</a></li>
                                <li><a href="<%= request.getContextPath()%>/user/question.do">문의</a></li>
                                <li><a href="<%= request.getContextPath()%>/">공지</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
                <div class="col-md-2">
	                <div class="header__logo">
	                	
					<c:if test="${sessionScope.memberName != null}">
						<div class="row">
							<div class="list-inline-item">
								<span class="text-center mr-3" style="font-size: 10pt;">
									<a id="info" href="<%=request.getContextPath()%>/member/info.do"> ${sessionScope.memberName}</a>
								</span>
								<a href="<%=request.getContextPath()%>/login/logout.do">
									<i id="logout" class="bi bi-box-arrow-right"></i>
								</a>
							</div>
						</div>
					</c:if>
					
					<c:if test="${sessionScope.memberName == null}">
						<div class="inline-flex">
							<a href="<%= request.getContextPath() %>/login/login.do">
								<i id="login">로그인</i>
							</a>
							&nbsp;&nbsp;
							<a href="<%= request.getContextPath() %>/login/register.do">
								<i id="register">회원가입</i>
							</a>
						</div>
					</c:if>


	                </div>
                </div>
            </div>
        </div>
    </header>
    <!-- Header-->
    
    
    
    <script type="text/javascript">
    	
    	const info_list = [
    		
	    	$('#info'),
	    	$('#logout'),
	    	$('#login'),
	    	$('#register')
    	];
    	$.each(info_list, (index, doc) => {
    		$(doc).css('color', 'black').css('font-size', '12pt');
    	})
    	
    	$.each(info_list, (index, doc) => {
    		$(doc).hover(
    			context => {
	    			const target = $(context.currentTarget);
	    			target.css('color', '#ED6C25');
	    			
	    		},
	    		context => {
	    			const target = $(context.currentTarget);
	    			target.css('color', 'black');
	    			
	    		}
    		)
    	})
    	
	    var active_target = '';
	    
	    switch ($('title').text()) {
		    case 'HVAC':
		    	active_target = '홈';
		    	break;
		    case 'HVAC-예약':
		    	active_target = '예약';
		    	break;
		    case 'HVAC-문의':
		    	active_target = '문의';
		    	break;
		    case 'HVAC-공지':
		    	active_target = '공지';
		    	break;
		}
	    
	    
	    const menuList = $('.header__menu a');
	    
	    $.each(menuList, (index, menu) => {
	    	
	    	if($(menu).text() == active_target){
	    		$(menu).parent().attr('class', 'active');
	    	}
	    })
	    
	    
		$(window).resize(() => {
	    	var windowWidth = $( window ).width();
			console.log(windowWidth);
	    	
	    	
	    	if(windowWidth < 768) {
	    		$('header .col-md-8').attr('class', 'col-md-12');
	    		$('header .col-md-2').hide();
	    	} else {
	    		$('header .col-md-12').attr('class', 'col-md-8');
	    		$('header .col-md-2').show();
	    	}
	    	
		});
    
	</script>
    
    
    