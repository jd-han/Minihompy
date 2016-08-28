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
<style type="text/css">
table#category{
width: 100%;
}

table#category tr:HOVER{
font-weight: bold;
}

table#category th{
text-align: center;
font-size: 16px;
}

table#category tr{
height: 25px;
font-size: 15px;
line-height: 25px;
}

a{
text-decoration: none;
}

.date{
text-align: center;
}
.description{
text-align: center;
}

table#category tr td.categoryName{
text-align: center;
}
table#category tr td.won{
text-align: right;
}
table#category tr td.amount{
text-align: right;
}
table#category tr td.percent{
text-align: right;
}
table#category tr.total td:first-child{
text-align: center;
}
table#category tr.total{
font-weight: bold;
}






table#list{
width: 100%;
}

table#list th{
text-align: center;
font-size: 16px;
}

table#list tr{
height: 25px;
font-size: 15px;
line-height: 25px;
}

table#list tr:HOVER{
font-weight: bold;
cursor: pointer;
}

table#list tr td.won{
text-align: right;
}
table#list tr td.amount{
text-align: right;
}




</style>

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
      
		<table id="category" class="table table-striped">
		<tr>
			<th>유형</th>
			<th colspan="2">금액</th>
			<th>비중</th>
		</tr>
		<c:forEach var="account" items="${resultSumList}">
			<tr>			
			<td class ="categoryName"><c:out value="${account.categoryName}" /></td>
			
			<td class="won">
			&#8361
			</td>
			<td class="amount">
			<fmt:formatNumber value="${account.amount}" type="number" var="currencyTypeAmount"/>
			<c:out value="${currencyTypeAmount}" />

			<c:if test="${account.amount >= 0}">
				<fmt:formatNumber value="${account.amount / sumOfRevenue}" type="percent" var="percentAmount" pattern="0.00%"/>			
			</c:if>
			<c:if test="${account.amount < 0}">
				<fmt:formatNumber value="${account.amount / sumOfExpense}" type="percent" var="percentAmount" pattern="0.00%"/>
			</c:if>
				<td class="percent"><c:out value="${percentAmount}" /></td>			
			</tr>
		</c:forEach>
		<tr class="total">
			<td>총합</td>
			<td class="won">
			&#8361
			</td>
			<td class="amount">
			<fmt:formatNumber value="${sumOfExpense+sumOfRevenue}" type="number" var="currencyTypeAmount"/>
			<c:out value="${currencyTypeAmount}" />
			</td>
			<td></td>
		</tr>
		</table>
		<p>
		
<table id="list" class="table table-striped table-hover">
		<tr>
			<th>날짜</th>
			<th>내역</th>
			<th colspan="2">금액</th>
		</tr>
		<c:forEach var="account" items="${resultAccountList}">
			<tr onclick="location.href='detailAccount?no=<c:out value="${account.sortNo}"/>'">
			<td class="date">
				<fmt:formatDate var="regDate" value="${account.tranDate}" pattern="yyyy-MM-dd"/>
				<c:out value="${regDate}"/>
			</td>
			<td class="description"><c:out value="${account.description}" /></td>			
			<td class="won">
			&#8361
			</td>
			<td class="amount">
			<fmt:formatNumber value="${account.amount}" type="number" var="currencyTypeAmount"/>
			<c:out value="${currencyTypeAmount}" />
			</td>			
		
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

<script type="text/javascript">
		var amountArr = document.querySelectorAll(".amount")
	
	for(var i=0; i<amountArr.length; i++){
		var amount = amountArr[i]
		console.dir(amount)
		console.log(parseInt(amount.innerText))
		if(parseInt(amount.innerText)<0){
			amount.style="color: red"
		}else{
			amount.style="color: blue"
		}
	}
</script>


</body>
</html>