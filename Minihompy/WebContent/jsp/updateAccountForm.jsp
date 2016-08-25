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
      <form action="${pageContext.request.contextPath}/account/updateAccount" method="post">
      	<table width='80%' border='1'>
		<tr>
			<th>거래대상</th>
			<td><input type="text" value="<c:out value="${account.description}"/>" name="description"></td>
		</tr>
		<tr>
			<th>금액</th>
			<td><input type="text" value="<c:out value="${account.amount}" />" name="amount"></td>
		</tr>
		<tr>
			<th>결제유형</th>
			<td>
			<input type="radio" name="payment" value="d">전자(카드 등)
			<input type="radio" name="payment" value="c">현금
			</td>
		</tr>
		<tr>
			<th>유형</th>
			<td><select name="categoryNo">
					<option value="1">식비</option>
					<option value="2">문화생활비</option>
					<option value="3">건강관리비</option>
					<option value="4">의류미용비</option>
					<option value="5">교통비</option>
					<option value="6">차량유지비</option>
					<option value="7">학비</option>
					<option value="8">사회생활비</option>
					<option value="9">유흥비</option>
					<option value="10">금융보험비</option>
					<option value="11">저축</option>
					<option value="12">통신비</option>
					<option value="13">기타소비</option>
					<option value="50">월급</option>
					<option value="51">금융소득(주식배당금)</option>
					<option value="52">금융소득(이자)</option>
					<option value="53">금융소득(계약만기)</option>
					<option value="54">임대소득</option>
					<option value="55">기타소득</option>
				</select>			
			</td>
		</tr>
		<tr>
			<th>날짜</th>
			<fmt:formatDate var="regDate" value="${account.tranDate}" pattern="yyyy/MM/dd HH:mm:ss" />
			<td><input type="text" value="<c:out value="${regDate}"/>" name="tranDate">
			yyyy/MM/dd HH:mm:ss 형식</td>
		</tr>
		<tr>
			<th>상세내용</th>
			<td><textarea name="note" rows="3" cols="70"><c:out value="${account.note}" /></textarea></td>
		</tr>
		</table>
		<input type="hidden" name="sortNo" value="${account.sortNo}">
		<input type="hidden" name="userNo" value="${account.userNo}">		
		<button type="submit">수정</button>
      </form>
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