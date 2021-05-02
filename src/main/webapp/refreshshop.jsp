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
        String shopName = request.getParameter("shopName");
        String shopId = request.getParameter("shopId");
        String shopIntroduction = request.getParameter("shopIntroduction");
        String shopState = request.getParameter("shopState");
        String masterName = request.getParameter("masterName");
        String contactNumber = request.getParameter("contactNumber");
        String userId = request.getParameter("userId");
    %>
</head>
<script type="text/javascript">
    function onClick(){
        window.location.href="${pageContext.request.contextPath}/queryShopByPage";
    }
</script>
<body>
<div class="layui-fluid">
    <div class="layui-col-md12">
        <form class="layui-form layui-form-pane" action="${pageContext.request.contextPath}/updateShop" method="post" id="frm-reg">
            <div class="layui-form-item">
                <label class="layui-form-label">店家编号</label>
                <div class="layui-input-inline layer-inputs">
                    <input readonly type="text" name="shopId" id="shopId" value="<%=shopId%>"
                           placeholder="" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">店家名称</label>
                <div class="layui-input-inline layer-inputs">
                    <input type="text" name="shopName" id="shopName" value="<%=shopName%>"
                           placeholder="请修改店家名" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">店家描述</label>
                <div class="layui-input-inline layer-inputs">
                    <input type="text" name="shopIntroduction" id="shopIntroduction" value="<%=shopIntroduction%>"
                           placeholder="请修改店家描述" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">店家负责人姓名</label>
                <div class="layui-input-inline layer-inputs">
                    <input type="text" name="masterName" id="masterName" value="<%=masterName%>"
                           placeholder="请修改店家负责人姓名" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">店家联系电话</label>
                <div class="layui-input-inline layer-inputs">
                    <input type="text" name="contactNumber" id="contactNumber" value="<%=contactNumber%>"
                           placeholder="请修改店家联系电话" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">店家状态</label>
                <div class="layui-input-inline layer-inputs">
                    <input type="text" name="shopState" id="shopState" value="<%=shopState%>"
                           placeholder="请修改店家状态" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">用户编号</label>
                <div class="layui-input-inline layer-inputs">
                    <input  type="text" name="userId" id="userId" value="<%=userId%>"
                           placeholder="" class="layui-input">
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