<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
function searchList() {
	var f=document.searchForm;
	f.submit();
}
</script>
<body>
<!-- Page Title/Header Start -->
    <div class="page-title-section section" style="margin: -50px 0px -100px 0px;">
        <div class="container">
            <div class="row">
                <div class="col">

                    <div class="page-title">
                        <h1 class="title" style="font-family: Jua; color: gray; font-size: 60px;">제휴업체</h1>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item" style="color: gray; font-size: 17px;"><a href="${pageContext.request.contextPath}/">홈페이지</a></li>
                            <li class="breadcrumb-item active" style="color: lightgray; font-size: 17px;">제휴업체</li>
                        </ul>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <!-- Page Title/Header End -->
<div class="section section-padding">
        <div class="container">
            <div class="row learts-mb-n50">
            
            <div class="col-xl-3 col-lg-4 col-12 order-lg-1 learts-mb-10">
                    <!-- Search Start -->
                    <div class="single-widget learts-mb-40">
                        <div class="widget-search">
                            <form name="searchForm" action="${pageContext.request.contextPath}/company/list" method="post">
                                <select name="condition" class="selectField nice-select">
									<option value="all" ${condition=="all"?"selected='selected'":""}>업체이름+내용</option>
									<option value="subject" ${condition=="subject"?"selected='selected'":""}>업체이름</option>
									<option value="content" ${condition=="content"?"selected='selected'":""}>내용</option>
									<option value="userName" ${condition=="userName"?"selected='selected'":""}>작성자</option>
									<option value="created" ${condition=="created"?"selected='selected'":""}>등록일</option>
								</select>
                                <input type="text" name="keyword" value="${keyword}" placeholder="검색...">
                                <button type="button" onclick="searchList()"><i class="fal fa-search"></i></button>
                            </form>
                        </div>
                    </div>
                    <!-- Search End -->

                    
                    <!-- Categories Start -->
                    <div class="single-widget learts-mb-40">
                        <h3 class="widget-title product-filter-widget-title">카테고리</h3>
                        <ul class="widget-list">
                            <li><a href="#">미용</a> <span class="count">${dataCount}</span></li>
                            <li><a href="#">펫시터</a> <span class="count">${dataCount}</span></li>
                            <li><a href="#">애견호텔</a> <span class="count">${dataCount}</span></li>
                        </ul>
                    </div>
                    <!-- Categories End -->
                    <div class="row learts-mt-50">
                        <div class="col text-center">
                            <a href="${pageContext.request.contextPath}/company/created" class="btn btn-dark btn-md btn-outline-dark" style="font-size: 17px;">업체등록하기</a>
                        </div>
                    </div>
                    

                </div>
            

                <div class="col-xl-9 col-lg-8 col-12 order-lg-2 learts-mb-50">
                    <div class="row learts-mb-n40">

                        <div class="col-md-6 col-12 learts-mb-40">
                            <div class="blog">
                                <div class="image">
                                    <a href="blog-details-right-sidebar.html"><img src="${pageContext.request.contextPath}/company/download?boardnum=${dto.boardnum}" alt="Blog Image"></a>
                                </div>
                                <div class="content">
                                    <ul class="meta">
                                        <li><i class="far fa-calendar"></i><a href="#">${dto.created}</a></li>
                                        <li><i class="far fa-eye"></i> ${dto.hitCount}</li>
                                    </ul>
                                    <h5 class="title"><a href="${articleUrl}&num=${dto.num}">${dto.subject}</a></h5>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                
            </div>
        </div>

    </div>
    <!-- Portfolio Section End -->
</body>
</html>