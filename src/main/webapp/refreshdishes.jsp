<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta charset="utf-8">
    <title>菜品编辑</title>
    <script src="../jquery/jquery-2.1.1.min.js"></script>
    <script src="../bootstrap/js/bootstrap.min.js"></script>
<%--    <script src="../layui/layui.all.js"></script>--%>
    <script src="../layui/layui.js"></script>
    <link rel="stylesheet" href="../layui/css/layui.css" type="text/css">
    <script src="../ztree/jquery.ztree.all-3.5.min.js"></script>
    <link rel="stylesheet" href="../ztree/zTreeStyle.css" type="text/css">
    <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css"
          type="text/css">
    <script src="/jquery/jquery-2.1.1.min.js"></script>
    <script src="/bootstrap/js/bootstrap.min.js"></script>
 <%--   <script src="/layui/layui.all.js"></script>--%>
    <script src="/layui/layui.js"></script>
    <link rel="stylesheet" href="/layui/css/layui.css" type="text/css">
    <script src="/ztree/jquery.ztree.all-3.5.min.js"></script>
    <link rel="stylesheet" href="/ztree/zTreeStyle.css" type="text/css">
    <link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css"
          type="text/css">
    <%
        String dishesName = request.getParameter("dishesName");
        String dishesId = request.getParameter("dishesId");
        String dishesIntroduction = request.getParameter("dishesIntroduction");
        String dishesState = request.getParameter("dishesState");
        String dishesPrice = request.getParameter("dishesPrice");
    %>
</head>
<script type="text/javascript">
    function onClick(){
        window.location.href="${pageContext.request.contextPath}/queryDishesByPage";
    }
</script>
<body>
<div class="layui-fluid">
    <div class="layui-col-md12">
        <form class="layui-form layui-form-pane" action="${pageContext.request.contextPath}/updateDishes" method="post" id="frm-reg">
            <div class="layui-form-item">
                <label class="layui-form-label">菜品编号</label>
                <div class="layui-input-inline layer-inputs">
                    <input readonly="readonly" type="text" name="dishesId" id="dishesId" value="<%=dishesId%>"
                    placeholder="" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">菜品名</label>
                <div class="layui-input-inline layer-inputs">
                    <input type="text" name="dishesName" id="dishesName" value="<%=dishesName%>"
                           placeholder="请修改菜品名" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
            <label class="layui-form-label">菜品描述</label>
            <div class="layui-input-inline layer-inputs">
                <input type="text" name="dishesIntroduction" id="dishesIntroduction" value="<%=dishesIntroduction%>"
                       placeholder="请修改菜品描述" class="layui-input">
            </div>
        </div>
            <div class="layui-form-item">
                <label class="layui-form-label">菜品价格</label>
                <div class="layui-input-inline layer-inputs">
                    <input type="text" name="dishesPrice" id="dishesPrice" value="<%=dishesPrice%>"
                           placeholder="请修改菜品价格" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">菜品状态</label>
                <div class="layui-input-inline layer-inputs">
                    <input type="text" name="dishesState" id="dishesState" value="<%=dishesState%>"
                           placeholder="请修改菜品状态" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item" style="margin-left: 50px; width: 200px;float: left;" >
                <input type="submit" class="layui-btn" id="execute" onclick="javascript:return confirm('确定信息无误了吗？');">

            </div>
            <div style="float: left;width: 200px">
                <button type="button" class="layui-btn" id="execute" onclick="onClick()">返回</button>
            </div>
        </form>
    </div>
</div>
</body>

</html>
<script src="js/jquery-3.4.1.min.js"></script>
<script src="layui/layui.js"></script>
<script src="js/admin.js"></script>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css"
      type="text/css">
<link rel="stylesheet" href="layui/css/layui.css" type="text/css">