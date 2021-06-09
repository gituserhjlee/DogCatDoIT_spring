<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:forEach  var="r" items="${reviews}">

<span>${r.score }</span>
<span>${r.content }</span>
<span>${r.registered }</span>
<br>
</c:forEach>