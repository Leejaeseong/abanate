<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<jsp:include page="header.jsp"/>
<jsp:include page="comHeader.jsp"/>

<body style="background-image: url('../img/mycoup/error-background.jpg');">

	<div class="h-100 row align-items-center text-center">
		<div class="w-100">
			<p>처리를 진행 하는 과정에서 문제가 발생하였습니다.</p>
			<p>관리자에게 문의하여 주십시오.</p>
			<h2>[오류코드] ${errStatusCode}</h2>
			<h2>[오류내용] ${erroMsg}</h2>
			<%-- 
			<ul>
			<c:forEach items="${exception.getStackTrace()}" var="stack">
				<li>${stack.toString()}</li>
			</c:forEach>
			</ul>
			--%>
			<button type="button" class="btn btn-danger" onclick="goMain();">돌아가기 <i class="fas fa-undo-alt"></i></button>
		</div>
	</div>
	
<jsp:include page="comFooter.jsp"/>
<jsp:include page="footer.jsp"/>

</body>
</html>