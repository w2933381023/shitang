<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<head>
    <meta charset="utf-8">
    <title>登录页面</title>
    <%
        String mess=(String)session.getAttribute("error_mess");
        if("".equals(mess)  || mess==null){

        }
        else{%>
    <script type="text/javascript">
        alert("<%=mess%>");
    </script>
    <%
            session.setAttribute("error_mess", "");
        }%>

    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css" type="text/css" >
</head>
<body>
<div class="content">
    <div class="form sign-in">
        <h2>欢迎回来</h2>
        <form action="/shopLogin" method="post">
            <label>
                <span>用户名:</span>
                <input type="text" name="userName" required />
            </label>
            <label>
                <span>密码:</span>
                <input type="password" name="password" required/>
            </label>
            <button type="submit" class="submit" id="b1">登 录</button>
        </form>
    </div>
    <div class="sub-cont">
        <div class="img">
            <div class="img__text m--up">
                <h2>管理员登录</h2>
                <p>登录后，管理系统吧！</p>
            </div>
            <div class="img__text m--in">
                <h2>店家登录</h2>
                <p>对您的店铺进行管理吧！</p>
            </div>
            <div class="img__btn">
                <span class="m--up">切 换</span>
                <span class="m--in">切 换</span>
            </div>
        </div>
        <div class="form sign-up">
            <h2>欢迎您，管理员！</h2>
            <form action="${pageContext.request.contextPath}/adminLogin" method="post">
                <label>
                    <span>用户名</span>
                    <input  type="text" name="userName" required/>
                </label>
                <label>
                    <span>密码</span>
                    <input type="password" name="password" required/>
                </label>
                <button type="submit" class="submit">登 录</button>
            </form>
        </div>
    </div>
</div>

<script src="<%=request.getContextPath()%>/js/script.js"></script></body>

</html>