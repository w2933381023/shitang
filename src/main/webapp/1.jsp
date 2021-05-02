<%--
  Created by IntelliJ IDEA.
  User: 29333
  Date: 2021/3/2
  Time: 20:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta charset="utf-8">
    <title> sss </title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <script src="jquery/jquery-2.1.1.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="layui/layui.all.js"></script>
    <script src="layui/layui.js"></script>
    <link rel="stylesheet" href="layui/css/layui.css" type="text/css">
    <script src="ztree/jquery.ztree.all-3.5.min.js"></script>
    <link rel="stylesheet" href="ztree/zTreeStyle.css" type="text/css">
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css"
          type="text/css">
    <link rel="stylesheet" href="https://www.layuicdn.com/layui/layui.js">
    <script src="https://www.layuicdn.com/layui/layui.js"></script>

</head>
<script>
function submitTable(){

var account = document.getElementById("account").value;

var name=document.getElementById("name").value;

var password=document.getElementById("password").value;

row = document.getElementById("table").insertRow();

if(row!=null){

cell=row.insertCell();

cell.innerHTML=account;

cell = row.insertCell();

cell.innerHTML=name;

cell = row.insertCell();

cell.innerHTML=password;

cell = row.insertCell();

cell.a=

}

return false;

}

</script>
<body>
<form onsubmit="return submitTable()">

    账号：<input type="text" id="account"><br>

    姓名：<input type="text" id="name"><br>

    密码：<input type="password" id="password"><br>

    <input name="submit" type="button" id="submit" value="提交" onclick="return submitTable()">

</form>

<hr>

<table class="layui-table layui-form" border="1" width="50%" align="center" id="table">

    <tr>

        <th>账号</th><th>姓名</th><th>密码</th>

    </tr>

</table>
</body>
</html>
