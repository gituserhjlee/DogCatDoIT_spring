<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="content-wrapper">
	<div class="container-fluid">
		<div class="Itemmain" style="font-family: Jua;">

			
				<div style="text-align: center;  font-size: x-large; padding: 20px;">
					${dataCount}개(${page}/${total_page} 페이지)</div>
				<div
					style="display: flex; flex-wrap: wrap; justify-content: space-around;">
					<c:forEach var="i" items="${items}">
						<div class="card" style="width: 30%; border: 4px outset #F79F81; border-radius: 15px;">
							<img class="card-img-top" style="padding: 10px;"
								src="${pageContext.request.contextPath}/uploads/item/${i.saveFileName}"
								alt="Card image cap" width="130px" height="130px"
								onclick="javascript:location.href='${pageContext.request.contextPath}/shopping/admin/optionManage?num=${i.itemId}';">
							<ul class="list-group list-group-flush">
								<li class="list-group-item"
									style="background: #F79F81; color: white; font-family: Jua">${i.itemName}</li>
								
							</ul>
							<div
								style="display: flex; flex-direction: row; justify-content: center; padding: 5px; ">
								<form method="post"
									action="${pageContext.request.contextPath}/shopping/admin/item/delete"
									onsubmit="return deletecheck();">
									<input type="hidden" name="num" value="${i.itemId}">
									<input type="hidden" name="page" value="${page}">
									<button type='submit' class='btn btn-outline-danger'
										style='padding: 10px 20px; border-radius: 10px;  margin-right: 10px; '>삭제</button>
								</form>
								
									<button type='button' class='btn btn-secondary' onclick="location.href='${pageContext.request.contextPath}/shopping/admin/item/update?id=${i.itemId}&page=${page}';"
										 style='padding: 10px 20px; border-radius: 10px; '>수정</button>

								

							</div>

						</div>
					</c:forEach>

				</div>
				${dataCount==0?"등록된 게시물이 없습니다.":paging}

		</div>
	</div>
</div>

<script type="text/javascript">


	$(function() {
		$('#ItemManage').addClass('active');
		$('#ItemInsert').removeClass('active');
		$('#dashboard').removeClass('active');
		$('#orderManage').removeClass('active');
		$('#balju').removeClass('active');
		$('#couponManage').removeClass('active');
		$('#stockManage').removeClass('active');
		$('#levelManage').removeClass('active');
	})
	function deletecheck(){
		if(confirm("정말 삭제하시겠습니까 ? ") == true){
	        alert("삭제되었습니다");
	        return true;
	    }
	    else{
	        return false ;
	    }


	}
	
</script>

