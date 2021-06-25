<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="icon" href="data:;base64,iVBORw0KGgo=">
	<link href="https://fonts.googleapis.com/css?family=Jua:400" rel="stylesheet">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/cAdmin.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/forms.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/paginate.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/shopAdmin/css/main.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/jquery/css/smoothness/jquery-ui.min.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ui-css.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/icofont/icofont.min.css" type="text/css">
	
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css">
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/util-jquery.js"></script>

	<script type="text/javascript">
	$(function(){
		$(document)
		   .ajaxStart(function(){ // AJAX 시작
			   $("#loadingImage").center();
			   $("#loadingLayout").fadeTo("slow", 0.5);
		   })
		   .ajaxComplete(function(){ // AJAX 종료
			   $("#loadingLayout").hide();
		   });
	});
	</script>
</head>

<body style="background: #fff">
<header style="background: #F79F81; width:100%; height: 50px; line-height: 50px; z-index:8999; position: fixed;">
	<a href="${pageContext.request.contextPath}/">
		<span style="font-family: Jua;  color: #696969; font-size:x-large; padding: 0 90px;">독캣두잇</span>
	</a>
</header>
<div class="wrapper">
	<tiles:insertAttribute name="left"/>
</div>
<div style="margin: 100px 0 0 300px;">
	<tiles:insertAttribute name="body"/>
</div>
<div id="loadingLayout" style="display: none; position: absolute; left: 0; top:0; width: 100%; height: 100%; z-index: 9000; background: #eee;">
	<i id="loadingImage" class="fa fa-cog fa-spin fa-fw" style="font-size: 70px; color: 333;"></i> 
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery/js/jquery.ui.datepicker-ko.js"></script>

</body>
</html>