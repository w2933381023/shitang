<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="utf-8">
		<title>添加管理员</title>
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
	</head>
	<body>
	<script type="text/javascript">
	layui.use('form', function(){
	        var form = layui.form; 
	        form.render();
	   });
	</script>
        <div class="layui-fluid">
			<div class="layui-col-md12">
				<form class="layui-form layui-form-pane" action="saveQuestion.action" id="frm-reg" >
					<div class="layui-form-item">
						<label class="layui-form-label">问题内容</label>
						<div class="layui-input-inline layer-inputs">
							<input type="text" name="quesContent" id="quesContent" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">选项A</label>
						<div class="layui-input-inline layer-inputs">
							<input type="text" name="selectionA" id="selectionA" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">选项B</label>
						<div class="layui-input-inline layer-inputs">
							<input type="text" name="selectionB" id="selectionB" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">选项C</label>
						<div class="layui-input-inline layer-inputs">
							<input type="text" name="selectionC" id="selectionC" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">选项D</label>
						<div class="layui-input-inline layer-inputs">
							<input type="text" name="selectionD" id="selectionD" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">答案</label>
						<div class="layui-input-inline layer-inputs">
							<input type="text" name="quesAnswer" id="quesAnswer" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">题目类型</label>
						<div class="layui-input-inline layer-inputs">
							<select name="quesType.quesTypeId" id="quesType.quesTypeId" lay-filter="system_role_id">
							<c:forEach items="${quesType}" var="quesType">
								<option value="${quesType.quesTypeId}">${quesType.quesTypeName}</option>
							</c:forEach>
							</select>
						</div> 
					</div>
				<div class="layui-form-item" style="margin-left: 50px;">
                         <input type="submit" value="添加" class="layui-btn">
                    </div>
				</form>
			</div>
		</div>	
    </body>
</html>