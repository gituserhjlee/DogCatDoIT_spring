<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript">
// 메뉴 활성화
$(function() {
    var url = window.location.pathname;
    var urlRegExp = new RegExp(url.replace(/\/$/, '') + "$");  
    $('nav>ul>li a').each(function() {
  	  if (urlRegExp.test(this.href.replace(/\/$/, ''))) {
            $(this).addClass('active');
        }
    });
});
</script>
<aside class="main-sidebar hidden-print ">
	<section class="sidebar" id="sidebar-scroll">
		<ul class="sidebar-menu" style="padding-top: 0">
			<li class="nav-level">--- Navigation</li>
			<li class="treeview" id="orderManage">
				<a class="waves-effect waves-dark" href="${pageContext.request.contextPath}/cAdmin/memberManager">
					<span> 회원관리</span>
				</a>
			</li>
			<li class="treeview" id="ItemManage">
				<a class="waves-effect waves-dark" href="${pageContext.request.contextPath}/cAdmin/qualificationManager">
					<span> 자격신청관리</span>
				</a>
			</li>
			<li class="treeview" id="ItemInsert">
				<a class="waves-effect waves-dark" href="${pageContext.request.contextPath}/member/logout">
					<span> Logout</span>
				</a>
			</li>
		</ul>
	</section>
</aside>