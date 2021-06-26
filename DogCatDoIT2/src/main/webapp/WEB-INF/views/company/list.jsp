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
                        	<li><a href="#">전체</a> <span class="count">${dataCount}</span></li>
                            <li><a href="#">미용</a> <span class="count">1</span></li>
                            <li><a href="#">펫시터</a> <span class="count">1</span></li>
                            <li><a href="#">애견호텔</a> <span class="count">2</span></li>
                        </ul>
                    </div>
                    <!-- Categories End -->
                    <div class="row learts-mt-50">
                        <div class="col text-center">
                            <c:if test="${sessionScope.member.userId=='admin'}">
                            <a href="${pageContext.request.contextPath}/company/created" class="btn btn-dark btn-md btn-outline-dark" style="font-size: 17px; margin-bottom: 50px;">업체등록하기</a>
                        	</c:if>                        </div>
                    </div>
                    

                </div>
            

                <div class="col-xl-9 col-lg-8 col-12 order-lg-2 learts-mb-50">
                    <div class="row learts-mb-n40">
                        <div class="col-md-6 col-12 learts-mb-40">
                            <div class="blog">
                                <div class="image">
                                	
                                    <a href="${articleUrl}&boardnum=8"><img src="${pageContext.request.contextPath}/resources/mainResources/images/blog/s370/blog-1.jpg" alt="Blog Image"></a>
                                	
                                </div>
                                <div class="content">
                                	
                                	<ul class="meta">
                                      	<li><i class="far fa-cut"></i><a href="#">미용</a></li>
                                      	
                                        <li><i class="far fa-eye"></i>${dto.hitCount} </li>
                                    </ul>
                                    <h5 class="title"><a href="${articleUrl}&boardnum=8">독캣 바버샵</a></h5>
                                	
                                    <div class="desc">
                                        <p>100% 예약제로 운영되는 통유리 오픈형 반려동물 미용실 독캣 바버샵입니다. 소중한 가족과 교감하며 미용 스트레스 최소화를 지향합니다.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-12 learts-mb-40">
                            <div class="blog">
                                <div class="image">
                                    <a href="${articleUrl}&boardnum=9"><img src="${pageContext.request.contextPath}/resources/mainResources/images/blog/s370/blog-2.jpg" alt="Blog Image"></a>
                                </div>
                                <div class="content">
                                    <ul class="meta">
                                        <li><i class="far fa-dog-leashed"></i><a href="#">펫시터</a></li>
                                        <li><i class="far fa-eye"></i>3 </li>
                                    </ul>
                                    <h5 class="title"><a href="${articleUrl}&boardnum=9">두잇 케어</a></h5>
                                    <div class="desc">
                                        <p>100% 예약제로 운영되는 반려동물 케어 플랫폼 두잇 케어입니다. 소중한 가족과 교감하며 고객님의 충분한 휴식과 즐거운 여가 시간을 보장합니다.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-12 learts-mb-40">
                            <div class="blog">
                                <div class="image">
                                    <a href="${articleUrl}&boardnum=6"><img src="${pageContext.request.contextPath}/resources/mainResources/images/blog/s370/blog-3.jpg" alt="Blog Image"></a>
                                </div>
                                <div class="content">
                                    <ul class="meta">
                                        <li><i class="far fa-hotel"></i><a href="#">애견호텔</a></li>
                                        <li><i class="far fa-eye"></i>2</li>
                                    </ul>
                                    <h5 class="title"><a href="${articleUrl}&boardnum=6">독캣 스테이</a></h5>
                                    <div class="desc">
                                        <p>100% 예약제로 운영되는 오픈형 반려동물 호텔 독캣 스테이입니다. 소중한 가족과 교감하며 고객님의 충분한 휴식과 즐거운 여가 시간을 보장합니다.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-12 learts-mb-40">
                            <div class="blog">
                                <div class="image">
                                    <a href="${articleUrl}&boardnum=7"><img src="${pageContext.request.contextPath}/resources/mainResources/images/blog/s370/blog-4.jpg" alt="Blog Image"></a>
                                </div>
                                <div class="content">
                                    <ul class="meta">
                                        <li><i class="far fa-hotel"></i><a href="#">애견호텔</a></li>
                                        <li><i class="far fa-eye"></i>5 </li>
                                    </ul>
                                    <h5 class="title"><a href="${articleUrl}&boardnum=7">두잇 스테이</a></h5>
                                    <div class="desc">
                                        <p>100% 예약제로 운영되는 오픈형 반려동물 호텔 두잇 스테이입니다. 소중한 가족과 교감하며 고객님의 충분한 휴식과 즐거운 여가 시간을 보장합니다.</p>
                                    </div>
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