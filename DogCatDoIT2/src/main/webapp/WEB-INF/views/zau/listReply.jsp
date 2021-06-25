<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<table style='width: 100%; margin: 10px auto 30px; border-spacing: 0;'>
	<thead id='listReplyHeader'>
		<tr height='35'>
		    <td colspan='2'>
		       <div style='clear: both;'>
		           <div style='float: left;'><span style='color: #3EA9CD; font-weight: bold;'>댓글 ${replyCount}개</span> <span>[댓글 목록, ${pageNo}/${total_page} 페이지]</span></div>
		           <div style='float: right; text-align: right;'></div>
		       </div>
		    </td>
		</tr>
	</thead>
	
	<tbody id='listReplyBody'>
	<c:forEach var="vo" items="${listReply}">
	    <tr height='35' style='background: #eee;'>
	       <td width='50%' style='padding:5px 5px; border:1px solid #ccc; border-right:none;'>
				<span><b>${vo.name}</b></span>
	        </td>
	       <td width='50%' style='padding:5px 5px; border:1px solid #ccc; border-left:none;' align='right'>
				<span>${vo.regi_date}</span> |
				<c:choose>
					<c:when test="${sessionScope.member.userId==vo.userId || sessionScope.member.userId=='admin'}">
						<span class="deleteReply" style="cursor: pointer;" data-replyNum='${vo.replyNum}' data-pageNo='${pageNo}'>삭제</span>
					</c:when>
					<c:otherwise>
						<span class="notifyReply">신고</span>
					</c:otherwise>
				</c:choose>
	        </td>
	    </tr>
	    <tr>
	        <td colspan='2' valign='top' style='padding:5px 5px;'>
				${vo.content}
	        </td>
	    </tr>
	    
	    <tr>
	        <td style='padding:7px 5px;'>
	            <button type='button' class='btn btn-light btnReplyAnswerLayout' data-replyNum='${vo.replyNum}'>답글 <span id="answerCount${vo.replyNum}">${vo.answerCount}</span></button>
	        </td>
	        <td style='padding:7px 5px;' align='right'>
                <button type='button' class='btn btn-light btnSendReplyLike' data-replyNum='${vo.replyNum}' data-replyLike='1' title="좋아요"><i class="bi bi-hand-thumbs-up"></i> 좋아요<span>${vo.likeCount}</span></button>
                <button type='button' class='btn btn-light btnSendReplyLike' data-replyNum='${vo.replyNum}' data-replyLike='0' title="싫어요"><i class="bi bi-hand-thumbs-down"></i> 싫어요<span>${vo.disLikeCount}</span></button>	        
	        </td>
	    </tr>
	
	    <tr class='replyAnswer' style='display: none;'>
	        <td colspan='2'>
	            <div id='listReplyAnswer${vo.replyNum}' class='answerList' style='border-top: 1px solid #ccc;'></div>
	            <div style='clear: both; padding: 10px 10px;'>
	                <div style='float: left; width: 3%;'>└</div>
	                <div style='float: left; width:97%; text-align: right;'>
	                    <textarea class='boxTA' style='width:99%; height: 70px;'></textarea>
	                 </div>
	            </div>
	             <div style='padding: 0 13px 10px 10px; text-align: right;'>
	                <button type='button' class='btn btn-light btnSendReplyAnswer' data-replyNum='${vo.replyNum}'>답글 등록</button>
	            </div>
	        
			</td>
	    </tr>
	</c:forEach>
	</tbody>
	
	<tfoot id='listReplyFooter'>
		<tr height='40' align="center">
			<td colspan='2' >
				${paging}
			</td>
		</tr>
	</tfoot>
</table>
