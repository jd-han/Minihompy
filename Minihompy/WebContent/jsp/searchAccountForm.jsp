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

			<form action="${pageContext.request.contextPath}/account/searchAccountByTerm" method="post">
				<!-- 
				<input type="hidden" name="userNo" value="${LOGIN_USER_INFO.userNo}">
				 -->
				<input type="hidden" name="userNo" value="1">
				<table class="searchTable">
					<tr>
					<th>기간 조회</th>
					<td>
						<input type="text" name="startDate">
						~
						<input type="text" name="endDate"> <input type="submit" value="조회">
						<h6>yyyy/MM/dd 양식으로 입력하세요</h6>
					</td>
					</tr>
				</table>
				<hr>
			</form>
			<form action="${pageContext.request.contextPath}/account/searchAccountByPayment" method="post">
			
			
				<!-- 
				<input type="hidden" name="userNo" value="${LOGIN_USER_INFO.userNo}">
				 -->
				<input type="hidden" name="userNo" value="1">
				
				
				<table class="searchTable">
					<tr>
					<th>유형별 조회</th>
					<td>
						<input type="radio" name="payment" value="c">현금
						<input type="radio" name="payment" value="d">카드 등 전자거래
						<br>
						<input type="text" name="startDate" value="">
						~
						<input type="text" name="endDate" value=""> <input type="submit" value="조회">
						<h6>yyyy/MM/dd 양식으로 입력하세요</h6>
					</td>
					</tr>
				</table>				
			</form>
				<hr>
			<form action="${pageContext.request.contextPath}/account/searchAccountByCategory" method="post">
				<!-- 
				<input type="hidden" name="userNo" value="${LOGIN_USER_INFO.userNo}">
				 -->
				<input type="hidden" name="userNo" value="1">
				<table class="searchTable">
					<tr>
					<th>항목별 조회</th>
					<td>
						<input type="checkbox" name="categoryNo" value="1" id="categoryNo1"><label for="categoryNo1">식비</label>
						<input type="checkbox" name="categoryNo" value="2" id="categoryNo2"><label for="categoryNo2">문화생활비</label>
						<input type="checkbox" name="categoryNo" value="3" id="categoryNo3"><label for="categoryNo3">건강관리비</label>
						<input type="checkbox" name="categoryNo" value="4" id="categoryNo4"><label for="categoryNo4">의료미용비</label>
						<input type="checkbox" name="categoryNo" value="5" id="categoryNo5"><label for="categoryNo5">교통비</label>
						<input type="checkbox" name="categoryNo" value="6" id="categoryNo6"><label for="categoryNo6">차량유지비</label>
						<input type="checkbox" name="categoryNo" value="7" id="categoryNo7"><label for="categoryNo7">학비</label>
						<input type="checkbox" name="categoryNo" value="8" id="categoryNo8"><label for="categoryNo8">사회생활비</label>
						<input type="checkbox" name="categoryNo" value="9" id="categoryNo9"><label for="categoryNo9">유흥비</label>
						<input type="checkbox" name="categoryNo" value="10" id="categoryNo10"><label for="categoryNo10">금융보험비</label>
						<input type="checkbox" name="categoryNo" value="11" id="categoryNo11"><label for="categoryNo11">저축</label>
						<input type="checkbox" name="categoryNo" value="12" id="categoryNo12"><label for="categoryNo12">통신비</label>
						<input type="checkbox" name="categoryNo" value="13" id="categoryNo13"><label for="categoryNo13">기타소비</label>
						<input type="checkbox" name="categoryNo" value="50" id="categoryNo50"><label for="categoryNo50">월급</label>
						<input type="checkbox" name="categoryNo" value="51" id="categoryNo51"><label for="categoryNo51">금융소득(주식배당금)</label>
						<input type="checkbox" name="categoryNo" value="52" id="categoryNo52"><label for="categoryNo52">금융소득(이자)</label>
						<input type="checkbox" name="categoryNo" value="53" id="categoryNo53"><label for="categoryNo53">금융소득(계약만기)</label>
						<input type="checkbox" name="categoryNo" value="54" id="categoryNo54"><label for="categoryNo54">임대소득</label>
						<input type="checkbox" name="categoryNo" value="55" id="categoryNo55"><label for="categoryNo55">기타소득</label>
					<br>
					기간
						<input type="text" name="startDate" value="">
						~
						<input type="text" name="endDate" value=""> <input type="submit" value="조회">
						<h6>yyyy/MM/dd 양식으로 입력하세요</h6>
					<td>
					</tr>
				</table>
			</form>
				<hr>
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