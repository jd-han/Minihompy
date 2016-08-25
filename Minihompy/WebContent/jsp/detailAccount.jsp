<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<body>
<c:import url="/include/header.jsp"/>
<div class="container-fluid">
    <!-- Begin page content -->
    <div class="container" id="maincontainer">
      <div class="page-header">
      	<!-- 제목 -->
        <c:import url="/include/accountTop.jsp"/>
      </div>
      	<table width="100%" border="1px">
		<tr>
			<th>거래대상</th>
			<td><c:out value="${account.description}" /></td>
		</tr>
		<tr>
			<th>금액</th>
			<td><c:out value="${account.amount}" /></td>
		</tr>
		<tr>
			<th>결제유형</th>
			<td>
				<c:choose>
					<c:when test="${account.payment==d}">
						<c:out value="전자(카드 등)" />
					</c:when>
					<c:otherwise>
						<c:out value="현금" />
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
		<tr>
			<th>유형</th>
			<td><c:out value="${account.categoryName}" /></td>
		</tr>
		<tr>
			<th>날짜</th>
			<fmt:formatDate var="regDate" value="${account.tranDate}" pattern="yyyy/MM/dd HH:mm:ss" />
			<td><c:out value="${regDate}" /></td>
		</tr>
		<tr>
			<th>상세내용</th>
			<td><c:out value="${account.note}" /></td>
		</tr>
		</table>
		
		<a href='${pageContext.request.contextPath}/account/updateAccountForm?no=<c:out value="${account.sortNo}" />'>수정</a><a href='${pageContext.request.contextPath}/account/deleteAccount?no=<c:out value="${account.sortNo}" />'>삭제</a><a href='${pageContext.request.contextPath}/account/recentList'>전화면으로</a>
    </div>
    <footer class="footer">
      <div class="container">
        <!-- 내용 -->
      </div>
    </footer>
</div>
<%@ include file="/include/bottom.jsp" %>
</body>
</body>
</html>