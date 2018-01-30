<%--
  Created by IntelliJ IDEA.
  User: Wenqiang Luo
  Date: 2018/1/29
  Time: 14:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div style="width:500px;margin:0px auto;text-align:center">
    <table align='center' border='1' cellspacing='0'>
        <tr>
            <td>name</td>
            <td>age</td>
        </tr>
        <c:forEach items="${list}" var="p" varStatus="st">
            <tr>
                <td>${p.getName()}</td>
                <td>${p.getAge()}</td>
            </tr>
        </c:forEach>
    </table>
    <div style="text-align:center">
        <a href="?start=0">首  页</a>
        <c:if test="${page.start!=0}">
        <a href="?start=${page.start-page.count}">上一页</a>
        </c:if>
        <c:if test="${page.start!=page.last}">
        <a href="?start=${page.start+page.count}">下一页</a>
        </c:if>
        <a href="?start=${page.last}">末  页</a>
    </div>
</div>

</body>
</html>
