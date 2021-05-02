<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="layui/layui.all.js"></script>
<script src="layui/layui.js"></script>
<link rel="stylesheet" href="layui/css/layui.css" type="text/css">
</head>
<body>
<form class="layui-form layui-form-pane" action="updateAuth" method="post">
<p><span><input type="text" hidden="true" name="authId" value="${oneAuth.authId }"></span>
<div class="layui-form-item">
						<label class="layui-form-label">权限名称：</label>
						<div class="layui-input-inline layer-inputs">
							<input type="text" name="authName" id="authName"  required="required" value="${oneAuth.authName }" class="layui-input">
						</div>
</div>
<div class="layui-form-item">
						<label class="layui-form-label">权限地址：</label>
						<div class="layui-input-inline layer-inputs">
							<input type="text" name="authUrl" id="authUrl"  required="required" value="${oneAuth.authUrl }" class="layui-input">
						</div>
</div>
<div class="layui-form-item">
						<label class="layui-form-label">依赖权限：</label>
						<div class="layui-input-inline layer-inputs">
							<input type="text" name="authParentRoot" id="authParentRoot"  required="required" value="${oneAuth.authParentRoot }" class="layui-input">
						</div>
</div>
<div class="layui-form-item">
						<label class="layui-form-label">根节点：</label>
						<div class="layui-input-inline layer-inputs">
							<input type="text" name="authIsRoot" id="authIsRoot"  required="required" value="${oneAuth.authIsRoot }" class="layui-input">
						</div>
</div>
<div class="layui-form-item">
						<div class="layui-form-1" style="margin-left: 50px;width: 200px;float: left;">
						<button type="submit" class="layui-btn" id="execute"><i class="layui-icon layui-icon-form"></i>保存</button>
						<button type="reset" class="layui-btn" id="execute"><i class="layui-icon layui-icon-form"></i>重置</button>
						</div>
					</div>
</form>		
</body>
</html>