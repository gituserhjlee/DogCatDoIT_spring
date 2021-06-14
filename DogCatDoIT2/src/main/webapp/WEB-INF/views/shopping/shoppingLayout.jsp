<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>독캣두잇</title>
<meta name="robots" content="noindex, follow" />
<meta name="description" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
<title>Ogani | Template</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/elegant-icons.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/nice-select.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/jquery-ui.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/slicknav.min.css"
	type="text/css">


<!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon"
	href="${pageContext.request.contextPath}resources/mainResources/images/favicon.png">

<!-- CSS
	============================================ -->
<!-- Main Style CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/mainResources/css/style.css">
	<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css"
	type="text/css">
<!-- 독캣두잇 폰트 -->
<link href="https://fonts.googleapis.com/css?family=Jua:400"
	rel="stylesheet">
<!-- Vendor CSS (Bootstrap & Icon Font) -->

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/mainResources/css/vendor/font-awesome-pro.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/mainResources/css/vendor/themify-icons.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/mainResources/css/vendor/customFonts.css">

<!-- Plugins CSS (All Plugins Files) -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/mainResources/css/plugins/select2.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/mainResources/css/plugins/perfect-scrollbar.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/mainResources/css/plugins/swiper.min.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/mainResources/css/plugins/ion.rangeSlider.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/mainResources/css/plugins/photoswipe.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/mainResources/css/plugins/photoswipe-default-skin.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/mainResources/css/plugins/magnific-popup.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/mainResources/css/plugins/slick.css">

<style>
.starR{
  background: url('${pageContext.request.contextPath}/resources/shopAdmin/images/star.png') no-repeat right 0;
  background-size: auto 100%;
  width: 30px;
  height: 30px;
  display: inline-block;
  text-indent: -9999px;
  cursor: pointer;
}
.starR.on{
  background: url('${pageContext.request.contextPath}/resources/shopAdmin/images/star2.png') no-repeat right 0;
  background-size: auto 100%;
  width: 30px;
  height: 30px;
  display: inline-block;
  text-indent: -9999px;
  cursor: pointer;
}

.starR.on2{
  background: url('${pageContext.request.contextPath}/resources/shopAdmin/images/star2.png') no-repeat right 0;
  background-size: auto 100%;
  width: 30px;
  height: 30px;
  display: inline-block;
  text-indent: -9999px;
  cursor: pointer;
}
</style>

<title>Insert title here</title>
</head>
<body>
	<tiles:insertAttribute name="header" />

	<!-- Header Section Begin -->
	<header class="header">

		<div class="container">
			<div class="row">
			
				<div class="col-lg-6">
					<nav class="header__menu">
						<ul>
							<li class="active"><a
								href="${pageContext.request.contextPath}/shopping/mainPage">DotCatMall
									Home</a></li>
							<li><a href="#">Category</a>
								<ul class="header__menu__dropdown">
									<li><a
										href="${pageContext.request.contextPath}/shopping/dog">강아지</a></li>
									<li><a
										href="${pageContext.request.contextPath}/shopping/cat">고양이</a></li>
								</ul></li>
							<c:if test="${sessionScope.member.userId=='admin'}">
								<li><a
									href="${pageContext.request.contextPath}/shopping/admin/dashboard">Admin
										Page</a></li>
							</c:if>


						</ul>
					</nav>
				</div>
				<div class="col-lg-6">
					<div class="header__cart">
						<ul>
							<li><a href="${pageContext.request.contextPath}/order/wishlist"><i class="fa fa-heart"></i> <span>10</span></a></li>
							<li><a href="${pageContext.request.contextPath}/order/cart"><i class="fa fa-shopping-bag"></i> <span>2</span></a></li>
						</ul>
						<div class="header__cart__price">
							담긴금액: <span>56000원</span>
						</div>
					</div>
				</div>
			</div>
			<div class="humberger__open">
				<i class="fa fa-bars"></i>
			</div>
		</div>
	</header>
	<!-- Header Section End -->

	<!-- Hero Section End -->

	<tiles:insertAttribute name="body" />
	<tiles:insertAttribute name="footer" />
	
<script>
function addCart(str){
	var f=document.oform;
	$("#str").val(str);
	f.action="${pageContext.request.contextPath}/order/orderForm";
	f.submit();
}

</script>

	<!-- Js Plugins -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.nice-select.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.slicknav.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/mixitup.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
	<!-- Vendors JS -->
	<script
		src="${pageContext.request.contextPath}/resources/mainResources/js/vendor/modernizr-3.6.0.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/mainResources/js/vendor/jquery-3.4.1.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/mainResources/js/vendor/jquery-migrate-3.1.0.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/mainResources/js/vendor/bootstrap.bundle.min.js"></script>

	<!-- Plugins JS -->
	<script
		src="${pageContext.request.contextPath}/resources/mainResources/js/plugins/select2.min.js"></script>

	<script
		src="${pageContext.request.contextPath}/resources/mainResources/js/plugins/perfect-scrollbar.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/mainResources/js/plugins/swiper.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/mainResources/js/plugins/slick.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/mainResources/js/plugins/mo.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/mainResources/js/plugins/jquery.instagramFeed.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/mainResources/js/plugins/jquery.ajaxchimp.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/mainResources/js/plugins/jquery.countdown.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/mainResources/js/plugins/imagesloaded.pkgd.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/mainResources/js/plugins/isotope.pkgd.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/mainResources/js/plugins/jquery.matchHeight-min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/mainResources/js/plugins/ion.rangeSlider.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/mainResources/js/plugins/photoswipe.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/mainResources/js/plugins/photoswipe-ui-default.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/mainResources/js/plugins/jquery.zoom.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/mainResources/js/plugins/ResizeSensor.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/mainResources/js/plugins/jquery.sticky-sidebar.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/mainResources/js/plugins/product360.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/mainResources/js/plugins/jquery.magnific-popup.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/mainResources/js/plugins/jquery.scrollUp.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/mainResources/js/plugins/scrollax.min.js"></script>

	<script
		src="${pageContext.request.contextPath}/resources/mainResources/js/main.js"></script>
	
	
	<script>
	$('.starRev span').click(function(){
		  $(this).parent().children('span').removeClass('on');
		  $(this).addClass('on').prevAll('span').addClass('on');
		  return false;
		});
	
	</script>
	
</body>
</html>