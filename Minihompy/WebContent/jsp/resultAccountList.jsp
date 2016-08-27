<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
<c:import url="/include/header.jsp"/>
<div class="container-fluid">
    <!-- Begin page content -->
    <div class="container" id="maincontainer">
      <div class="page-header">
      	<!-- 제목 -->
        <c:import url="/include/accountTop.jsp"/>
      </div>
      <h4>검색 결과</h4> 
      
		<table width='100%' border='1'>
		<tr>
			<th>유형</th>
			<th>금액</th>
			<th>비중</th>
		</tr>
		<c:forEach var="account" items="${resultSumList}">
			<tr>			
			<td><c:out value="${account.categoryName}" /></td>
			<fmt:formatNumber value="${account.amount}" type="currency" var="currencyTypeAmount"/>
			<td><c:out value="${currencyTypeAmount}" /></td>
			<c:if test="${account.amount >= 0}">
				<fmt:formatNumber value="${account.amount / sumOfRevenue}" type="percent" var="percentAmount" pattern="0.00%"/>			
			</c:if>
			<c:if test="${account.amount < 0}">
				<fmt:formatNumber value="${account.amount / sumOfExpense}" type="percent" var="percentAmount" pattern="0.00%"/>
			</c:if>
				<td><c:out value="${percentAmount}" /></td>			
			
			</tr>
		</c:forEach>
		<tr>
			<td>총합</td>
			<td colspan="2">
			<fmt:formatNumber value="${sumOfExpense+sumOfRevenue}" type="currency" var="currencyTypeAmount"></fmt:formatNumber>
			<c:out value="${currencyTypeAmount}" />
			</td>
		</tr>
		</table>
		<p>
		
		<table width='100%' border='1'>
		<tr>
			<th>날짜</th>
			<th>내역</th>
			<th>금액</th>
		</tr>
		<c:forEach var="account" items="${resultAccountList}">
			<tr>
			<td>
				<fmt:formatDate var="regDate" value="${account.tranDate}" pattern="yyyy-MM-dd"/>
				<c:out value="${regDate}" />
			</td>
			<td><a href='detailAccount?no=<c:out value="${account.sortNo}" />'><c:out value="${account.description}" /></a></td>
			<fmt:formatNumber value="${account.amount}" type="currency" var="currencyTypeAmount"></fmt:formatNumber>
			<td><c:out value="${currencyTypeAmount}" /></td>
			</tr>
		</c:forEach>
		
		<c:if test="${empty resultAccountList}">
			<tr><td colspan='3'>거래내역이 존재하지 않습니다.</td></tr>
		</c:if>
		</table>
    </div>

    <footer class="footer">
      <div class="container">
        <!-- 내용 -->
      </div>
    </footer>
</div>
<%@ include file="/include/bottom.jsp" %>
</body>
</html>