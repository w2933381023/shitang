<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="updateGood.action" method="post">
<%String str=request.getParameter("id"); %>
<p>请输入要修改的id:<input type="text" name="id" value=<%=str %>>
<p>请输入要修改的goodName:<input type="text" name="goodName">
<p>请输入要修改的price:<input type="text" name="price">
<p>请输入要修改的num:<input type="text" name="num">
<p><input type="submit" value="提交">
</form>
</body>
</html>