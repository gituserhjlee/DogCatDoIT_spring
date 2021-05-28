<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="container">
	<div class="header-top">
		<div class="header-brand"><a href="${pageContext.request.contextPath}/"><span class="logo">SPRING</span></a></div>
				
		<div class="login header-login">
			<c:if test="${empty sessionScope.member}">
				<a href="javascript:dialogLogin();">로그인</a>
				<i></i>
				<a href="${pageContext.request.contextPath}/member/member">회원가입</a>
			</c:if>
			<c:if test="${not empty sessionScope.member}">
				<span style="color:blue;">${sessionScope.member.userName}</span>님 <i></i>
				<c:if test="${sessionScope.member.userId=='admin'}">
					<a href="${pageContext.request.contextPath}/admin">관리자</a> <i></i>
				</c:if>
				<a href="${pageContext.request.contextPath}/member/logout"> 로그아웃 </a>
			</c:if>
		</div>
	</div>
</div>

<div class="container">
	<nav class="navbar navbar-expand-sm bg-light navbar-light">
		<a class="navbar-brand" href="#"><i class="bi bi-app-indicator"></i></a>
		
		<ul class="navbar-nav">
			 <li class="nav-item">
			 	 <a class="nav-link" href="#">회사 소개</a>
			 </li>
			 
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#" id="navbardrop1" data-toggle="dropdown">
					커뮤니티
				</a>
				<ul class="dropdown-menu" aria-labelledby="navbardrop1">
					<li><a class="dropdown-item" href="#">방명록</a></li>
					<li><a class="dropdown-item" href="${pageContext.request.contextPath}/bbs/list">게시판</a></li>
					<li><a class="dropdown-item" href="#">답변형 게시판</a></li>
					<li><a class="dropdown-item" href="#">포토갤러리</a></li>
					<li><hr class="dropdown-divider"></li>
					<li><a class="dropdown-item" href="#">자료실</a></li>
					<li><a class="dropdown-item" href="#">채팅</a></li>
				</ul>
			</li>

			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#" id="navbardrop2" data-toggle="dropdown">
					스터디룸
				</a>
				<ul class="dropdown-menu" aria-labelledby="navbardrop2">
					<li><a class="dropdown-item" href="#">프로그래밍</a></li>
					<li><a class="dropdown-item" href="#">데이터베이스</a></li>
					<li><a class="dropdown-item" href="#">웹</a></li>
					<li><a class="dropdown-item" href="#">질문과 답변</a></li>
					<li><a class="dropdown-item" href="#">스케쥴러</a></li>
				</ul>
			</li>
			
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#" id="navbardrop3" data-toggle="dropdown">
					고객 센터
				</a>
				<ul class="dropdown-menu" aria-labelledby="navbardrop3">
					<li><a class="dropdown-item" href="#">자주하는질문</a></li>
					<li><a class="dropdown-item" href="#">공지사항</a></li>
					<li><a class="dropdown-item" href="#">1:1문의</a></li>
					<li><a class="dropdown-item" href="#">질문과답변</a></li>
					<li><a class="dropdown-item" href="#">이벤트</a></li>
				</ul>
			</li>
		</ul>
			
		<ul class="navbar-nav ml-auto">
			<c:if test="${not empty sessionScope.member}">
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="navbardrop4" data-toggle="dropdown">
						마이 페이지
					</a>
					<ul class="dropdown-menu" aria-labelledby="navbardrop4">
						<li><a class="dropdown-item" href="#">정보확인</a></li>
						<li><a class="dropdown-item" href="#">일정관리</a></li>
						<li><a class="dropdown-item" href="#">포토 앨범</a></li>
						<li><a class="dropdown-item" href="#">쪽지</a></li>
						<li><hr class="dropdown-divider"></li>
						<li><a class="dropdown-item" href="${pageContext.request.contextPath}/member/pwd">정보수정</a></li>
					</ul>
				</li>
			</c:if>
			<li class="nav-item">
				<a class="nav-link" href="#"><i class="bi bi-grid-3x3-gap-fill"></i></a>
			</li>
		</ul>
	</nav>
</div>

<script>
function dialogLogin() {
    $("#modalUserId").val("");
    $("#modalUserPwd").val("");
	$("#modalLogin").modal("show");	
    $("#modalUserId").focus();
}

function modalSendLogin() {
	var f=document.modalLoginForm;
	
    if(!f.userId.value) {
    	f.userId.focus();
    	return false;
    }	

    if(!f.userPwd.value) {
    	f.userPwd.focus();
    	return false;
    }	

   f.action="${pageContext.request.contextPath}/member/login"; 
   f.submit();
}
</script>

<div id="modalLogin" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title text-center" style="font-family: 나눔고딕, 맑은 고딕, sans-serif;">회원 로그인</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			</div>
			<div class="modal-body">
				<form name="modalLoginForm" method="post">
					<div class="form-group">
						<label for="modalUserId">아이디</label>
						<input class="form-control" id="modalUserId" name="userId" type="text" placeholder="아이디">
					</div>
					<div class="form-group">
						<label for="modalUserPwd">패스워드</label>
						<input class="form-control" id="modalUserPwd" name="userPwd" type="password" placeholder="패스워드">
					</div>
			        
					<div class="form-group">
						<button class="btn btn-lg btn-primary btn-block" type="button" onclick="modalSendLogin();">로그인 <i class="bi bi-check2"></i></button>
					</div>
                    
					<div class="text-center">
						<button type="button" class="btn btn-link" onclick="location.href='${pageContext.request.contextPath}/member/member';">회원가입</button>
						<button type="button" class="btn btn-link">아이디찾기</button>
						<button type="button" class="btn btn-link">패스워드찾기</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
