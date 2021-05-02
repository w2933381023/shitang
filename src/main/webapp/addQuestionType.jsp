
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>添加试题类型</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<script src="jquery/jquery-2.1.1.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="layui/layui.all.js"></script>
<script src="layui/layui.js"></script>
<link rel="stylesheet" href="layui/css/layui.css" type="text/css">
<script src="ztree/jquery.ztree.all-3.5.min.js"></script>
<link rel="stylesheet" href="ztree/zTreeStyle.css" type="text/css">
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css"
	type="text/css">
</head>
<body>
	<div class="layui-fluid">
		<div class="layui-col-md12">
			<form class="layui-form layui-form-pane" action="addQuesType.action" id="frm-reg">
				<div class="layui-form-item">
					<label class="layui-form-label">类型名称</label>
					<div class="layui-input-inline layer-inputs">
						<input type="text" name="quesTypeName" id="quesTypeName"
							placeholder="请输入试题类型名称" class="layui-input">
					</div>
					<div class="layui-form-mid layui-word-aux">长度不超过20字符</div>
				</div>
				<div class="layui-form-item" style="margin-left: 50px;">
					<button class="layui-btn" id="execute" >
						<i class="layui-icon layui-icon-form"></i>添加
					</button>
				</div>
			</form>
		</div>
	</div>
</body>

</html>