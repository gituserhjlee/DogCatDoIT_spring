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
<title>독캣두잇-독캣몰</title>
<meta name="robots" content="noindex, follow" />
<meta name="description" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
    <!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/mainResources/images/favicon.png">
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
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
				<c:if test="${not empty sessionScope.cart}">
					<div class="col-lg-6">
						<div class="header__shoppingInfo">
							<ul>
								<li><h4><span class="badge badge-info" title="혜택: 상품 구매시 ${sessionScope.member.shopLevel.rate}% 할인">${sessionScope.member.shopLevel.levelName }</span></h4></li>
								<li><a href="${pageContext.request.contextPath}/order/cart"><i class="fa fa-shopping-bag"></i> <span>${sessionScope.cart.cartCount}</span></a></li>
							</ul>
							<div class="header__cart__price">
								담긴금액:
								<span>
									<fmt:formatNumber type="number" value="${sessionScope.cart.cartTotalItemPrice}" maxFractionDigits="3"/> 원
								</span>
							</div>
						</div>
					</div>
				</c:if>
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

<script src="${pageContext.request.contextPath}/resources/jquery/js/jquery-ui.min.js"></script>	
<script>
$(function(){
	var words=["사료", "내구성","캣타워", "간식", "옷","배변패드","영양제", "장난감", "모래", "고양이","고양이 모래", "고양이 캣타워", "집사", "귀여운", "흡수력","국산", "해외", "강아지","강아지 영양제", "강아지 사료", "건강","배변","츄르","알레르기", "다회용", "프리미엄", "저렴한", "냥이","아기","애기", "강력한", "튼튼한"];
	
	$("#searchkeyword").autocomplete({
		source:words,
		select: function(event, ui) {
            console.log(ui.item);
        },
        focus: function(event, ui) {
            return false;

        }
	});
});
	
</script>
<script>

var convertEngToKor = function(args) {
	var engChosung = "rRseEfaqQtTdwWczxvg"
	var engChosungReg = "[" + engChosung + "]";
	var engJungsung = {k:0,o:1,i:2,O:3,j:4,p:5,u:6,P:7,h:8,hk:9,ho:10,hl:11,y:12,n:13,nj:14,np:15,nl:16,b:17,m:18,ml:19,l:20};
	var engJungsungReg = "hk|ho|hl|nj|np|nl|ml|k|o|i|O|j|p|u|P|h|y|n|b|m|l";
	var engJongsung = {"":0,r:1,R:2,rt:3,s:4,sw:5,sg:6,e:7,f:8,fr:9,fa:10,fq:11,ft:12,fx:13,fv:14,fg:15,a:16,q:17,qt:18,t:19,T:20,d:21,w:22,c:23,z:24,x:25,v:26,g:27};
	var engJongsungReg = "rt|sw|sg|fr|fa|fq|ft|fx|fv|fg|qt|r|R|s|e|f|a|q|t|T|d|w|c|z|x|v|g|";
	var regExp = new RegExp("("+engChosungReg+")("+engJungsungReg+")(("+engJongsungReg+")(?=("+engChosungReg+")("+engJungsungReg+"))|("+engJongsungReg+"))","g");

	var converter = function (args, cho, jung, jong) {
		return String.fromCharCode(engChosung.indexOf(cho) * 588 + engJungsung[jung] * 28 + engJongsung[jong] + 44032);
	};

	var result = args.replace(regExp, converter);
	console.log(result);
	return result;
}

function run(engStr) {
	return convertEngToKor(engStr);	
}

</script>
<script>
function EngCheck(){
	var a=$("#searchkeyword").val();
	var s=run(a);
	url="${pageContext.request.contextPath}/shopping/search?searchkeyword="+s+"&originalkeyword="+a;
	window.location.href=url;
	
}

</script>
	
</body>
</html>