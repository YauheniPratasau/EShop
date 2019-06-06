<%--
  Created by IntelliJ IDEA.
  User: Евгений
  Date: 20.05.2019
  Time: 1:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<body>
<div class="w3-top">
    <div class="w3-bar w3-white w3-card" id="myNavbar">

        <c:choose>
            <c:when test="${auth}">
                <button class="w3-button w3-bar-item" style="padding-bottom: -8px;"><img src="images/user.png">
                </button>
                <button class="w3-button w3-bar-item"  style="padding-bottom: -8px;"><img src="images/shopping-basket-button.png">
                </button>
                <form method="post">
                    <button name="command" value="logout" type="submit"
                            class="w3-button w3-bar-item"  style="padding-bottom: -8px;"><img src="images/logout.png"></button>
                </form>
            </c:when>
            <c:otherwise>
                <button onclick="document.getElementById('login').style.display='block'"
                        class="w3-bar-item w3-button w3-wide">
                    LOGIN
                </button>
            </c:otherwise>
        </c:choose>

        <div class="w3-right w3-hide-small">
            <button class="w3-bar-item w3-button" style="font-weight: bold">HOME</button>
            <button class="w3-button w3-bar-item" href="${pageContext.request.contextPath}/laptops">
                <i class="fa">
                </i> LAPTOPS
            </button>
            <button class="w3-button w3-bar-item">
                <i class="fa"></i> DESKTOP COMPUTERS
            </button>
            <button class="w3-button w3-bar-item"><i class="fa"></i>
                IPAD&TABLETS
            </button>
            <button class="w3-button w3-bar-item" href="${pageContext.request.contextPath}/accessories"><i
                    class="fa"></i>
                ACCESORIES
            </button>
        </div>
        <a href="javascript:void(0)" class="w3-bar-item w3-button w3-right w3-hide-large w3-hide-medium" onclick="w3_open()">
            <i class="fa fa-bars"></i>
        </a>
    </div>
</div>
</body>
</html>
