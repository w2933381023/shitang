<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta charset="utf-8">
    <title> sss </title>
    <%--<script type="text/javascript">
        // 函数名为 runoob
        window.onload=function runoob(){
            window.location.href="queryUserById";
        }
    </script>--%>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <script src="../jquery/jquery-2.1.1.min.js"></script>
    <script src="../bootstrap/js/bootstrap.min.js"></script>
    <script src="../layui/layui.all.js"></script>
    <script src="../layui/layui.js"></script>
    <link rel="stylesheet" href="../layui/css/layui.css" type="text/css">
    <script src="../ztree/jquery.ztree.all-3.5.min.js"></script>
    <link rel="stylesheet" href="../ztree/zTreeStyle.css" type="text/css">
    <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css"
          type="text/css">
    <script>
        layui.use('element', function(){
            var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块

            //监听导航点击
            element.on('nav(demo)', function(elem){
                //console.log(elem)
                layer.msg(elem.text());
            });
        });
    </script>
</head>
<body>
<span class="layui-breadcrumb" lay-separator="—">
  <a href="">首页</a>
  <a href="">用户模块</a>
  <a><cite>店家管理</cite></a>
</span>
<div>
    <label>&nbsp;</label>
</div>

<form action="${pageContext.request.contextPath}/queryShopByPage2"  method="post">
    <div class="layui-inline layui-show-xs-block"  style="margin-left: 10px;">

        <input type="text" id="shopName"  name="shopName"   placeholder="店家名（请输入名称）" autocomplete="on" class="layui-input">
    </div>
    <!-- <div class="layui-inline layui-show-xs-block">
    <label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;排序方式：</label>
                <select name="sort" id="sort" lay-filter="sort">
                <option value="0" selected="selected">时间排序</option>
                <option value="1">xx排序</option>
                <option value="2">xx排序</option>
            </select>
    </div> -->
    <div class="layui-inline layui-show-xs-block">
        <input class="layui-btn"  type="submit" lay-filter="sreach"><i class="layui-icon">&#xe615;</i>
    </div>
</form>
</div>
</div>


<table class="layui-table layui-form">
    <thead>
    <tr>
        <th>店家编号</th>
        <th>店家名称</th>
        <th>店家管理者姓名</th>
        <th>联系电话</th>
        <th>店家介绍</th>
        <th>店家状态</th>
        <th>用户编号</th>
        <th>店家图片</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${pageinfo.list }" var="str">
        <tr>
            <td>${str.shopId }</td>
            <td>${str.shopName }</td>
            <td>${str.masterName }</td>
            <td>${str.contactNumber }</td>
            <td>${str.shopIntroduction }</td>
            <td>${str.shopState}</td>
            <td>${str.userId}</td>
            <td><img src="/Restaurant_war_exploded/images/${str.shopImage}" alt="没找到"></td>
            <td> <a class="layui-btn layui-btn-sm <!-- layui-btn-normal -->"
                    title="编辑" onclick="" href="${pageContext.request.contextPath}/jsp/refreshshop.jsp?shopName=${str.shopName}&shopId=${str.shopId}&shopIntroduction=${str.shopIntroduction}&masterName=${str.masterName}&shopState=${str.shopState}&contactNumber=${str.contactNumber}&userId=${str.userId}"><i
                    class="layui-icon layui-icon-edit"></i>编辑</a><a class="layui-btn layui-btn-sm <!-- layui-btn-danger -->" title="删除" onclick="javascript:return confirm('确定移除该店家？');" href="${pageContext.request.contextPath}/deleteShop?shopId=${str.shopId }">
                <i class="layui-icon layui-icon-delete"></i>删除</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</div>
<div class="layui-card-body">
    <a href="<c:url value='/queryShopByPage2?pn=1'></c:url>">首页</a>
    <c:if test="${pageinfo.hasPreviousPage }">
        <a href="<c:url value='/queryShopByPage2?pn=${pageinfo.pageNum-1 }'></c:url>">上一页</a>
    </c:if>
    <form action="${pageContext.request.contextPath}/queryShopByPage2" method="get">
        <input type="text" name="pn" value="${pageinfo.pageNum }"><input
            type="submit" value="跳转">
    </form>
    <c:if test="${pageinfo.hasNextPage }">
        <a
                href="<c:url value='/queryShopByPage2?pn=${pageinfo.pageNum+1 }'></c:url>">下一页</a>
    </c:if>
    <a
            href="<c:url value='/queryShopByPage2?pn=${pageinfo.pages }'></c:url>">尾页</a>
    <p>第${pageinfo.pageNum }页 共${pageinfo.pages }页
        总共${pageinfo.total }条记录数
</div>

<script src="js/jquery-3.4.1.min.js"></script>
<script src="layui/layui.js"></script>
<script src="js/admin.js"></script>
</body>

<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css"
      type="text/css">
<link rel="stylesheet" href="layui/css/layui.css" type="text/css">
</body>
</html>