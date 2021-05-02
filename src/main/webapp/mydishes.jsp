<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta charset="utf-8">
    <title> sss </title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <script src="/jquery/jquery-2.1.1.min.js"></script>
    <script src="/bootstrap/js/bootstrap.min.js"></script>
    <script src="/layui/layui.all.js"></script>
    <script src="/layui/layui.js"></script>
    <link rel="stylesheet" href="/layui/css/layui.css" type="text/css">
    <link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css"
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
  <a href="">菜品模块</a>
  <a><cite>我的菜品</cite></a>
</span>
<div>
    <label>&nbsp;</label>
</div>
<div>
    <div style="width: 300px">
        <form action="${pageContext.request.contextPath}/queryDishesByPage2"  method="post">
            <div class="layui-inline layui-show-xs-block"  style="margin-left: 10px;">

                <input type="text" id="dishesName"  name="dishesName"   placeholder="菜品名（请输入名称）" autocomplete="on" class="layui-input">
            </div>
            <div class="layui-inline layui-show-xs-block">
                <input class="layui-btn"  type="submit" lay-filter="sreach" ><i class="layui-icon">&#xe615;</i>
            </div>
        </form>
    </div>
</div>
</div>
</div>


<table class="layui-table">
    <thead>
    <tr>
        <th>菜品编号</th>
        <th>菜品名</th>
        <th>菜品已售数量</th>
        <th>菜品介绍</th>
        <th>菜品状态</th>
        <th>菜品价格</th>
        <th>店家编号</th>
        <th>店家名称</th>
        <th>菜品开关</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${pageinfo.list }" var="str">
        <tr>
            <td>${str.dishesId }</td>
            <td>${str.dishesName }</td>
            <td>${str.dishesSellNumber }</td>
            <td>${str.dishesIntroduction }</td>
            <td>
                <c:if test="${str.dishesState==0}"><label style="color: red">待审核</label></c:if>
            <c:if test="${str.dishesState==1}"><label style="color: red">审核不通过</label></c:if>
            <c:if test="${str.dishesState==2}"><label style="color: red">审核通过</label></c:if>
                <c:if test="${str.dishesState==3}"><label style="color: red">审核通过</label></c:if>
                <c:if test="${str.dishesState==4}"><label style="color: red">审核通过</label></c:if></td>
            <td>￥${str.dishesPrice}</td>
            <td>${str.shopId}</td>
            <td>${str.shopName}</td>

            <td>
                <c:if test="${str.dishesState==3}"><input type="checkbox"  onchange="check(this)" title="开关" /></c:if>
                <c:if test="${str.dishesState==4}"><input type="checkbox" onchange="check(this)" title="开关" /></c:if>
                  <c:if test="${str.dishesState==0}"><input type="checkbox" title="开关 " disabled/></c:if>
                <c:if test="${str.dishesState==1}"><input type="checkbox" title="开关"  disabled/></c:if>
                  <c:if test="${str.dishesState==2}"><input type="checkbox" onchange="check(this)" title="开关" /></c:if>

               </td>
            <td> <a class="layui-btn layui-btn-sm <!-- layui-btn-normal -->"
                    title="编辑" onclick="" href="${pageContext.request.contextPath}/refreshdishes.jsp?dishesName=${str.dishesName}&dishesId=${str.dishesId}&dishesIntroduction=${str.dishesIntroduction}&dishesPrice=${str.dishesPrice}&dishesState=${str.dishesState}"><i
                    class="layui-icon layui-icon-edit"></i>编辑</a><a class="layui-btn layui-btn-sm <!-- layui-btn-danger -->" title="删除" onclick="javascript:return confirm('确定移除该菜品？');" href="${pageContext.request.contextPath}/deleteDishes?dishesId=${str.dishesId }">
                <i class="layui-icon layui-icon-delete"></i>删除</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</div>
<div class="layui-card-body">
    <a href="<c:url value='/queryDishesByPage2?pn=1'></c:url>">首页</a>
    <c:if test="${pageinfo.hasPreviousPage }">
        <a href="<c:url value='/queryDishesByPage2?pn=${pageinfo.pageNum-1 }'></c:url>">上一页</a>
    </c:if>
    <form action="${pageContext.request.contextPath}/queryDishesByPage2" method="get">
        <input type="text" name="pn" value="${pageinfo.pageNum }"><input
            type="submit" value="跳转">
    </form>
    <c:if test="${pageinfo.hasNextPage }">
        <a
                href="<c:url value='/queryDishesByPage2?pn=${pageinfo.pageNum+1 }'></c:url>">下一页</a>
    </c:if>
    <a
            href="<c:url value='/queryDishesByPage2?pn=${pageinfo.pages }'></c:url>">尾页</a>
    <p>第${pageinfo.pageNum }页 共${pageinfo.pages }页
        总共${pageinfo.total }条记录数
</div>

<script src="js/jquery-3.4.1.min.js"></script>
<script src="layui/layui.js"></script>
<script src="js/admin.js"></script>
</body>
<script>
   function check(btn) {
       if(btn.checked==true){
           $.ajax({
               url:'${pageContext.request.contextPath}/updateDishesState'
               ,type:'post'
               ,data:{
                   dishesId:${str.dishesId},
                   dishesState:3
               }
               ,dataType:'json'
               ,success:function (data) {
                   layer.alert("添加成功");
           })
       }
   }
</script>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css"
      type="text/css">
<link rel="stylesheet" href="layui/css/layui.css" type="text/css">
</body>
</html>