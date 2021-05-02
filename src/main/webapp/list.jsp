<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body> 
<center>
<form action="insertGood" method="post">
<p>请输入要加入的goodName:<input type="text" name="goodName">
<p>请输入要加入的price:<input type="text" name="price">
<p>请输入要加入的num:<input type="text" name="num">
<p><input type="submit" value="提交">
</form>
<!-- <form action="deleteGood.action" method="post">
<p>请输入要删除的id:<input type="text" name="id">
<p><input type="submit" value="提交">
</form> -->

<table border="1">
<tr><th>id</th><th>goodName</th><th>price</th><th>num</th>
<c:forEach items="${pageinfo.list}" var="str">
<tr>
<td>${str.id }</td>
<td>${str.goodName }</td>
<td>${str.price }</td>
<td>${str.num }</td>
<td><a href="add?id=${str.id }">编辑</a><a href="deleteGood.action?id=${str.id }">删除</a></td>
</tr>
</c:forEach>
</table>

<a href="<c:url value='queryGoodsByPage.action?pn=1'></c:url>">首页</a>
<c:if test="${pageinfo.hasPreviousPage }">
<a href="<c:url value='queryGoodsByPage.action?pn=${pageinfo.pageNum-1 }'></c:url>">上一页</a>
</c:if>
<form action="queryGoodsByPage.action" method="get">
<input type="text" name="pn" value="${pageinfo.pageNum }" ><input type="submit" value="跳转">
</form>
<c:if test="${pageinfo.hasNextPage }">
<a href="<c:url value='queryGoodsByPage.action?pn=${pageinfo.pageNum+1 }'></c:url>">下一页</a>
</c:if>
<a href="<c:url value='/queryGoodsByPage.action?pn=${pageinfo.pages }'></c:url>">尾页</a>
<p>第${pageinfo.pageNum }页 共${pageinfo.pages }页 总共${pageinfo.total }条记录数
</center>
</body>
</html>