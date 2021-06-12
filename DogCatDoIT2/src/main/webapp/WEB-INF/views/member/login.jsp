<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<script type="text/javascript"> 
		function sendLogin(){
			var f = document.loginForm;
			
			if(! f.userId.value){
				alert("아이디를 입력하세요.");
				f.userId.focus();
				return;
			}
			
			if(! f.pwd.value){
				alert("패스워드를 입력하세요.");
				f.pwd.focus();
				return;
			}
			
			f.action= "${pageContext.request.contextPath}/member/login";
			f.submit();
		}
		
	</script>
					<div class="section section-padding">
						<div class="container">
							<div class="row no-gutters">
								<div class="col-lg-6">
									<div class="user-login-register bg-light">
										<div class="login-register-title">
											<h2 class="title">로그인</h2>
											<p class="desc">환영합니다!</p>
										</div>
										<div class="login-register-form">
											<form name="loginForm" method="post">
												<div class="row learts-mb-n50">
													<div class="col-12 learts-mb-50">
														<input type="text" name="userId" class="loginTF" 
															maxlength="15" tabindex="1" placeholder="아이디를 입력하세요">
													</div>
													<div class="col-12 learts-mb-50">
														<input type="password" name="pwd" class="loginTF"
															maxlength="20" tabindex="2" placeholder="비밀번호를 입력하세요"></div>
													<div class="col-12 text-center learts-mb-50">
														<button class="btn btn-dark btn-outline-hover-dark" type="button" onclick="sendLogin();" style="font-family: Jua; font-size: 18px;">로그인</button>
													</div>
													<div class="col-12 learts-mb-50">
														<div class="row learts-mb-n20">
															<div class="col-12 learts-mb-20">
																<a href="${pageContext.request.contextPath}/" class="fw-400">아이디가 기억나지 않으시나요?</a>
															</div>
															<div class="col-12 learts-mb-20">
																<a href="${pageContext.request.contextPath}/" class="fw-400">비밀번호가 기억나지 않으시나요?</a>
															</div>
														</div>
													</div>
												</div>
											</form>
										</div>
									</div>
								</div>
								                <div class="col-lg-6" style="margin-top: 120px;">
                    <div class="user-login-register">
                        <div class="login-register-title">
                            <h2 class="title">회원가입</h2>
                            <p class="desc">아직 독캣두잇의 회원이 아니시라면 가입해주세요!</p>
                        </div>
                        <div class="login-register-form">
                            <form action="#">
                                <div class="row learts-mb-n50">
                                    <div class="col-12 text-center learts-mb-50">
                                        <button class="btn btn-dark btn-outline-hover-dark" onclick="location.href='${pageContext.request.contextPath}/member/member'" style="font-family: Jua; font-size: 18px;">회원가입</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
								
						</div>
					</div>
				</div>