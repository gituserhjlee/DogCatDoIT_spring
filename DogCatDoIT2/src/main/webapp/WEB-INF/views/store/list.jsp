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
<body>
<div class="section section-padding">
        <div class="container">
            <div class="row learts-mb-n50">
            
            <div class="col-xl-3 col-lg-4 col-12 order-lg-1 learts-mb-10">
                    <!-- Search Start -->
                    <div class="single-widget learts-mb-40">
                        <div class="widget-search">
                            <form action="#">
                                <input type="text" placeholder="검색...">
                                <button><i class="fal fa-search"></i></button>
                            </form>
                        </div>
                    </div>
                    <!-- Search End -->

                    
                    <!-- Categories Start -->
                    <div class="single-widget learts-mb-40">
                        <h3 class="widget-title product-filter-widget-title">카테고리</h3>
                        <ul class="widget-list">
                            <li><a href="#">미용</a> <span class="count">11</span></li>
                            <li><a href="#">펫시터</a> <span class="count">2</span></li>
                            <li><a href="#">애견호텔</a> <span class="count">11</span></li>
                        </ul>
                    </div>
                    <!-- Categories End -->

                </div>
            

                <div class="col-xl-9 col-lg-8 col-12 order-lg-2 learts-mb-50">
                    <div class="row learts-mb-n40">

                        <div class="col-md-6 col-12 learts-mb-40">
                            <div class="blog">
                                <div class="image">
                                    <a href="blog-details-right-sidebar.html"><img src="${pageContext.request.contextPath}/resources/mainResources/images/blog/s370/blog-1.jpg" alt="Blog Image"></a>
                                </div>
                                <div class="content">
                                    <ul class="meta">
                                        <li><i class="far fa-calendar"></i><a href="#">2021년 6월 1일</a></li>
                                        <li><i class="far fa-eye"></i> 201 조회수</li>
                                    </ul>
                                    <h5 class="title"><a href="blog-details-right-sidebar.html">독캣 바버샵</a></h5>
                                    <div class="desc">
                                        <p>100% 예약제로 운영되는 통유리 오픈형 반려동물 미용실 독캣 바버샵입니다. 소중한 가족과 교감하며 미용 스트레스 최소화를 지향합니다.</p>
                                    </div>
                                    <a href="${pageContext.request.contextPath}/store/store" class="link">예약하러 가기</a>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6 col-12 learts-mb-40">
                            <div class="blog">
                                <div class="image">
                                    <a href="blog-details-right-sidebar.html"><img src="${pageContext.request.contextPath}/resources/mainResources/images/blog/s370/blog-2.jpg" alt="Blog Image"></a>
                                </div>
                                <div class="content">
                                    <ul class="meta">
                                        <li><i class="far fa-calendar"></i><a href="#">2021년 6월 1일</a></li>
                                        <li><i class="far fa-eye"></i> 158 조회수</li>
                                    </ul>
                                    <h5 class="title"><a href="blog-details-right-sidebar.html">두잇 케어</a></h5>
                                    <div class="desc">
                                        <p>100% 예약제로 운영되는 펫시터 업체 두잇 케어입니다. 소중한 가족과 교감하며 쾌적한 산책과 휴식을 지향합니다.</p>
                                    </div>
                                    <a href="blog-details-right-sidebar.html" class="link">예약하러 가기</a>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6 col-12 learts-mb-40">
                            <div class="blog">
                                <div class="image">
                                    <a href="blog-details-right-sidebar.html"><img src="${pageContext.request.contextPath}/resources/mainResources/images/blog/s370/blog-3.jpg" alt="Blog Image"></a>
                                </div>
                                <div class="content">
                                    <ul class="meta">
                                        <li><i class="far fa-calendar"></i><a href="#">2021년 6월 1일</a></li>
                                        <li><i class="far fa-eye"></i> 119 조회수</li>
                                    </ul>
                                    <h5 class="title"><a href="blog-details-right-sidebar.html">독캣 스테이</a></h5>
                                    <div class="desc">
                                        <p>100% 예약제로 운영되는 애견 호텔 독캣 스테이입니다. 소중한 가족과의 쾌적한 휴식을 지향합니다. 반려동물과 함께 독캣 스테이만의 편안하고 우수한 서비스를 만끽하세요.</p>
                                    </div>
                                    <a href="blog-details-right-sidebar.html" class="link">예약하러 가기</a>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6 col-12 learts-mb-40">
                            <div class="blog">
                                <div class="image">
                                    <a href="blog-details-right-sidebar.html"><img src="${pageContext.request.contextPath}/resources/mainResources/images/blog/s370/blog-1.jpg" alt="Blog Image"></a>
                                </div>
                                <div class="content">
                                    <ul class="meta">
                                        <li><i class="far fa-calendar"></i><a href="#">2021년 6월 1일</a></li>
                                        <li><i class="far fa-eye"></i> 201 조회수</li>
                                    </ul>
                                    <h5 class="title"><a href="blog-details-right-sidebar.html">독캣 바버샵</a></h5>
                                    <div class="desc">
                                        <p>100% 예약제로 운영되는 통유리 오픈형 반려동물 미용실 독캣 바버샵입니다. 소중한 가족과 교감하며 미용 스트레스 최소화를 지향합니다.</p>
                                    </div>
                                    <a href="${pageContext.request.contextPath}/store/store" class="link">예약하러 가기</a>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6 col-12 learts-mb-40">
                            <div class="blog">
                                <div class="image">
                                    <a href="blog-details-right-sidebar.html"><img src="${pageContext.request.contextPath}/resources/mainResources/images/blog/s370/blog-2.jpg" alt="Blog Image"></a>
                                </div>
                                <div class="content">
                                    <ul class="meta">
                                        <li><i class="far fa-calendar"></i><a href="#">2021년 6월 1일</a></li>
                                        <li><i class="far fa-eye"></i> 158 조회수</li>
                                    </ul>
                                    <h5 class="title"><a href="blog-details-right-sidebar.html">두잇 케어</a></h5>
                                    <div class="desc">
                                        <p>100% 예약제로 운영되는 펫시터 업체 두잇 케어입니다. 소중한 가족과 교감하며 쾌적한 산책과 휴식을 지향합니다.</p>
                                    </div>
                                    <a href="blog-details-right-sidebar.html" class="link">예약하러 가기</a>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6 col-12 learts-mb-40">
                            <div class="blog">
                                <div class="image">
                                    <a href="blog-details-right-sidebar.html"><img src="${pageContext.request.contextPath}/resources/mainResources/images/blog/s370/blog-3.jpg" alt="Blog Image"></a>
                                </div>
                                <div class="content">
                                    <ul class="meta">
                                        <li><i class="far fa-calendar"></i><a href="#">2021년 6월 1일</a></li>
                                        <li><i class="far fa-eye"></i> 119 조회수</li>
                                    </ul>
                                    <h5 class="title"><a href="blog-details-right-sidebar.html">독캣 스테이</a></h5>
                                    <div class="desc">
                                        <p>100% 예약제로 운영되는 애견 호텔 독캣 스테이입니다. 소중한 가족과의 쾌적한 휴식을 지향합니다. 반려동물과 함께 독캣 스테이만의 편안하고 우수한 서비스를 만끽하세요.</p>
                                    </div>
                                    <a href="blog-details-right-sidebar.html" class="link">예약하러 가기</a>
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