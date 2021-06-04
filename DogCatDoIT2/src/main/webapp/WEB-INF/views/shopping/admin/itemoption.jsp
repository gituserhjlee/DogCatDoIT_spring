<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<table style='width: 100%; margin: 10px auto 30px; border-spacing: 0;'>

	
	<tbody id='listReplyBody'>
	<c:forEach var="vo" items="${options}">
	  
	    <tr>
	        <td colspan='2' valign='top' style='padding:5px 5px; border-top: 2px solid #555555;'>
				<h5>옵션명: ${vo.optionName}</h5>
	        </td>
	    </tr>
	    
	    <tr>
	        <td style='padding:7px 5px;'>
	            <button type='button' class='btn btnDetailOptionLayout btn-danger' data-optionNum='${vo.optionId}'>상세옵션</button>
				<button class="deleteReply btn btn-outline-danger" style="cursor: pointer;" data-optionNum='${vo.optionId}' >삭제</button>
	        </td>
	
	    
	    </tr>
	
	    <tr class='replyAnswer' style='display: none;'>
	        <td colspan='2' style=' border:1px solid #555555;'>
	            <div id='listdetailoption${vo.optionId}' class='answerList' style='border-top: 1px solid #ccc;'>
	            
	            </div>
	            <div style='clear: both; padding: 10px 10px;'>
	           
	            
	                <div class="form-group" >
	                	이름
	                    <input type="text" class="form-control"  placeholder="ex. s, m, l">
	                 </div>
	                 <div class="form-group" >
	                	수량
	                    <input type="number" class="form-control">
	                 </div>
	            </div>
	             <div style='padding: 0 13px 10px 10px; text-align: right;'>
	                <button type='button' class='btn SendDetail btn-danger' data-optionNum='${vo.optionId}'>상세옵션 등록</button>
	            </div>
	        
			</td>
	    </tr>
	  
	</c:forEach>
	</tbody>

</table>
