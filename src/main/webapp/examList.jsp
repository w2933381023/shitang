<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="utf-8">
		<title>管理员文章</title>
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
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" type="text/css">
	</head>
	<body>
			<div class="layui-col-md12">
				<div class="layui-navs">
					<span class="layui-breadcrumb" lay-separator="—">
						<a href="javascript:;">考试管理</a>
						<a><cite>考试列表页面</cite></a>
					</span>
					<a class="layui-btn layui-btn-small" style="line-height:1.6em;float:right;height: 36px;" href="javascript:location.replace(location.href);" title="刷新">
						<i class="layui-icon layui-icon-refresh" style="line-height:36px;font-size: 16px;"></i>
					</a>
				</div>
			</div>
			<div class="layui-col-md12">
				<div class="layui-card">
					
					<div class="layui-card-body">
						<table class="layui-table layui-form">
							<thead>
								<tr>
									<th>ID</th>
									<th>试卷类型</th>
									<th>试题数量</th>
									<th>考试时间</th>
									<th>每题分值</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<tr>
								<c:forEach items="${tests.list}" var="test">
									<tr>
										<td>${test.testId}</td>
										<td>${test.quesType}</td>
										<td>${test.quesNum}</td>
										<td>${test.time}</td>
										<td>${test.grade}</td>
										
										<td>
											<a class="layui-btn layui-btn-sm layui-btn-normal" title="开始答题" href="makeTest.action?testId=${test.testId}"><i class="layui-icon layui-icon-edit"></i>开始答题</a>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="page" style="text-align: center">
						<ul class="pagination">
						<c:if test="${tests.hasPreviousPage}">
							<li class="disabled"><a href="queryTests.action?pn=${tests.pageNum-1}">上一页</a></li> 
						</c:if>
						${tests.pageNum}页 共${tests.pages}页 总${tests.total}记录数
						<c:if test="${tests.hasNextPage}">
							<li><a href="queryTests.action?pn=${tests.pageNum+1}">下一页</a></li>
						</c:if>
						</ul>
					</div>
				</div>
			</div>
    </body>
</html>