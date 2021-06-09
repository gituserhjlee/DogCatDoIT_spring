<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div style="display: flex; flex-wrap: wrap; justify-content: space-around;">
		<c:forEach var="c" items="${coupons}">
			<div class="card" style="width: 30%; border: 2px solid #F79F81; text-align: center; font-family: Jua;">
				<ul class="list-group list-group-flush">
					<li class="list-group-item"
						style="background: #F79F81; color: white;"> ${c.deadline} 까지</li>
					<li class="list-group-item"
						style="background: #F79F81; color: white;">${c.couponName}</li>
					
					<li class="list-group-item"
						style="background: #F79F81; color: white;">남은수량: ${c.stock}</li>
					<li class="list-group-item"
						style="background:white ; color: #F79F81; font-weight: bolder;">총 금액에서<h5> ${c.rate} %</h5></li>
				</ul>
			</div>
		</c:forEach>

	</div>