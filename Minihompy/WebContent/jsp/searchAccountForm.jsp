<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.searchTable {
width: 100%;
}

.searchTable th{
width: 100px;
}

</style>

</head>
<body>
	<c:import url="/include/header.jsp" />
	<div class="container-fluid">
		<!-- Begin page content -->
		<div class="container" id="maincontainer">
			<div class="page-header">
				<!-- 제목 -->
				<c:import url="/include/accountTop.jsp" />
			</div>

			<form action="${pageContext.request.contextPath}/account/searchAccount" method="post">
			<table class="searchTable">
				<tr>
				<th>특정기간 조회</th>
				<td>
					<input type="text" name="startDay">
					~
					<input type="text" name="endDay"> <input type="submit" value="조회">
				</td>
				</tr>
			</table>
			</form>
			<form action="${pageContext.request.contextPath}/account/searchAccount" method="post">
				<table class="searchTable">
					<tr>
					<th>기간 조회</th>
					<td>
						<input type="text" name="day">
						<input type="submit" value="조회">
					</td>
					</tr>
				</table>				
			</form>
			<form action="${pageContext.request.contextPath}/account/searchAccount" method="post">
				<table class="searchTable">
					<tr>
					<th>유형별 조회</th>
					<td>
						<input type="radio" name="payment" value="c">현금
						<input type="radio" name="payment" value="d">카드 등 전자거래
						<input type="submit" value="조회">
					</td>
					</tr>
				</table>				
			</form>
			<form action="${pageContext.request.contextPath}/account/searchAccount" method="post">
				<table class="searchTable">
					<tr>
					<th>항목별 조회</th>
					<td>
						<input type="checkbox" name="categoryNo" value="1">식비
						<input type="checkbox" name="categoryNo" value="2">문화생활비
						<input type="checkbox" name="categoryNo" value="3">건강관리비
						<input type="checkbox" name="categoryNo" value="4">의료미용비
						<input type="checkbox" name="categoryNo" value="5">교통비
						<input type="checkbox" name="categoryNo" value="6">차량유지비
						<input type="checkbox" name="categoryNo" value="7">학비
						<input type="checkbox" name="categoryNo" value="8">사회생활비
						<input type="checkbox" name="categoryNo" value="9">유흥비
						<input type="checkbox" name="categoryNo" value="10">금융보험비
						<input type="checkbox" name="categoryNo" value="11">저축
						<input type="checkbox" name="categoryNo" value="12">통신비
						<input type="checkbox" name="categoryNo" value="13">기타소비
						<input type="checkbox" name="categoryNo" value="50">월급
						<input type="checkbox" name="categoryNo" value="51">금융소득(주식배당금)
						<input type="checkbox" name="categoryNo" value="52">금융소득(이자)
						<input type="checkbox" name="categoryNo" value="53">금융소득(계약만기)
						<input type="checkbox" name="categoryNo" value="54">임대소득
						<input type="checkbox" name="categoryNo" value="55">기타소득
						<input type="submit" value="조회">
					<td>
					</tr>
				</table>
			</form>
		</div>
		<footer class="footer">
		<div class="container">
			<!-- 내용 -->
		</div>
		</footer>
	</div>
	<%@ include file="/include/bottom.jsp"%>

</body>
</body>
</html>