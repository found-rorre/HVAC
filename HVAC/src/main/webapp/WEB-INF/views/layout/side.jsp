<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- side -->
 <div class="flex-shrink-0 p-3" style="width: 280px;">
    <a href="<%= request.getContextPath()%>/admin/main.do" class="d-flex align-items-center pb-3 mb-3 link-body-emphasis text-decoration-none border-bottom">
      <!-- 여기에 작은아이콘 추가같은거 진행  -->
      <span class="fs-5 fw-semibold">관리자 메인 페이지</span>
    </a>
    <ul class="list-unstyled ps-0">
      <li class="mb-1">
        <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0" data-bs-toggle="collapse" data-bs-target="#home-collapse" aria-expanded="true">
          홈
        </button>
        <div class="collapse show" id="home-collapse" style="">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
            <li><a href="<%=request.getContextPath()%>/admin/member.do" class="link-body-emphasis d-inline-flex text-decoration-none rounded">회원</a></li>
            <li><a href="<%=request.getContextPath()%>/admin/user.do" class="link-body-emphasis d-inline-flex text-decoration-none rounded">관리자</a></li>
            <li><a href="<%=request.getContextPath()%>/admin/question.do" class="link-body-emphasis d-inline-flex text-decoration-none rounded">문의사항</a></li>
          	<li><a href="<%= request.getContextPath()%>/admin/carList" class="link-body-emphasis d-inline-flex text-decoration-none rounded">차량 관리</a></li>
          	<li><a href="<%= request.getContextPath()%>/admin/event.do" class="link-body-emphasis d-inline-flex text-decoration-none rounded">이벤트 관리</a></li>
          	<li><a href="<%= request.getContextPath()%>/admin/notice.do" class="link-body-emphasis d-inline-flex text-decoration-none rounded">공지 관리</a></li>
          </ul>
        </div>
      </li>
    </ul>
  </div>