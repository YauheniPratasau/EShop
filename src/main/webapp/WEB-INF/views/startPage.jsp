<%--
  Created by IntelliJ IDEA.
  User: Евгений
  Date: 19.05.2019
  Time: 4:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<fmt:setLocale value="${lang_id}"/>
<fmt:setBundle basename="language"/>
<html>
<head>
    <title>EShop</title>
    <c:import url="blocks/resources.jsp"/>
</head>

<body>
<!-- Navbar (sit on top) -->

<div class="w3-top">
    <c:import url="menuBar.jsp"/>
</div>

<c:choose><c:when test="${loginError==null}">
    <div id="login" class="w3-modal" style="display:none"><c:import url="authorization/login.jsp"/></div>
</c:when><c:otherwise>
    <div id="login" class="w3-modal" style="display:block"><c:import url="authorization/login.jsp"/></div>
</c:otherwise></c:choose>
<c:choose><c:when test="${userInfoError==null}">
    <div id="registration" class="w3-modal" style="display:none"><c:import url="authorization/registration.jsp"/></div>
</c:when><c:otherwise>
    <div id="registration" class="w3-modal" style="display:block"><c:import url="authorization/registration.jsp"/></div>
</c:otherwise></c:choose>
<div id="recover" class="w3-modal" style="display:none"><c:import url="authorization/recover.jsp"/></div>

<!-- Sidebar on small screens when clicking the menu icon -->
<nav class="w3-sidebar w3-bar-block w3-black w3-card w3-animate-left w3-hide-medium w3-hide-large" style="display:none"
     id="mySidebar">
    <a href="javascript:void(0)" onclick="w3_close()" class="w3-bar-item w3-button w3-large w3-padding-16">Close ×</a>
</nav>
<a href="javascript:void(0)" class="w3-bar-item w3-button w3-right w3-hide-large w3-hide-medium"
   onclick="w3_open()" style="display: inline;">
    <i class="fa fa-bars"></i>
</a>
<!-- Header with full-height image -->
<header class="bgimg-1 w3-display-container w3-grayscale-min w3-animate-opacity" id="home">
    <div class="w3-display-left w3-display-bottomleft w3-top w3-text-white" style="padding:48px">
        <span class="w3-jumbo w3-hide-small"><fmt:message key="makeYourChoice"/></span><br>
        <span class="w3-xxlarge w3-hide-large w3-hide-medium"><fmt:message key="makeYourChoice"/></span><br>
        <span class="w3-large"><fmt:message key="dontBeScammed"/></span>
        <p>
            <c:choose>
            <c:when test="${auth}">
        <form method="post" action="/laptop">
            <input type="hidden" name="product" value="laptop">
            <button class="w3-button w3-white w3-padding-large w3-large w3-margin-top w3-opacity w3-hover-opacity-off"
                    name="command" value="product" type="submit">
                <fmt:message key="startShopping"/>
            </button>
        </form>
        </c:when>
        <c:otherwise>
            <button class="w3-button w3-white w3-padding-large w3-large w3-margin-top w3-opacity w3-hover-opacity-off"
                    onclick="document.getElementById('login').style.display='block'">
                <fmt:message key="startShopping"/>
            </button>
        </c:otherwise>
        </c:choose>
        </p>

    </div>
    <div class="w3-display-bottomleft w3-text-grey w3-large" style="padding:24px 48px">
        <i class="fa fa-facebook-official w3-hover-opacity"></i>
        <a href="https://instagram.com/evgenii.protasov"><i class="fa fa-instagram w3-hover-opacity"></i></a>
        <i class="fa fa-snapchat w3-hover-opacity"></i>
        <i class="fa fa-pinterest-p w3-hover-opacity"></i>
        <i class="fa fa-twitter w3-hover-opacity"></i>
        <i class="fa fa-linkedin w3-hover-opacity"></i>
    </div>
</header>
<!-- About Section -->
<!-- Contact Section -->
<div class="w3-container w3-light-grey" style="padding:128px 16px">
    <h3 class="w3-center"><fmt:message key="contact"/></h3>
    <p class="w3-center w3-large"><fmt:message key="getInTouch"/></p>
    <div style="margin-top:48px">
        <p><i class="fa fa-map-marker fa-fw w3-xxlarge w3-margin-right"></i> <fmt:message key="grodnoBy"/></p>
        <p><i class="fa fa-phone fa-fw w3-xxlarge w3-margin-right"></i> <fmt:message key="phone"/>: +375 33 673-42-25
        </p>
        <p><i class="fa fa-envelope fa-fw w3-xxlarge w3-margin-right"> </i> Email: jprotossswork@gmail.com</p>
        <br>
        <form method="post">
            <p><input class="w3-input w3-border" type="text" placeholder="<fmt:message key="name"/>" required
                      name="name"></p>
            <p><input class="w3-input w3-border" type="text" placeholder="Email" required name="email"></p>
            <p><input class="w3-input w3-border" type="text" placeholder="<fmt:message key="subject"/>" required
                      name="subject"></p>
            <p><input class="w3-input w3-border" type="text" placeholder="<fmt:message key="message"/>" required
                      name="message"></p>
            <p>
                <button class="w3-button w3-black w3-right" type="submit" name="command" value="sendMessage">
                    <fmt:message key="sendMessage"/> <i class="fa fa-paper-plane"></i>
                </button>
            </p>
        </form>
    </div>
</div>
<!-- Footer -->
<footer class="w3-center w3-black w3-padding-64">
    <c:import url="blocks/footer.jsp"/>
</footer>
</body>
<script>
    var mySidebar = document.getElementById("mySidebar");

    function w3_open() {
        if (mySidebar.style.display === 'block') {
            mySidebar.style.display = 'none';
        } else {
            mySidebar.style.display = 'block';
        }
    }

    function w3_close() {
        mySidebar.style.display = "none";
    }
</script>
</html>
