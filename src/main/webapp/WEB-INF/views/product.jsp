<%--
  Created by IntelliJ IDEA.
  User: Евгений
  Date: 20.05.2019
  Time: 1:53 PM
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
<div class="w3-top">
    <c:import url="menuBar.jsp"/>
</div>
<div class="w3-container" style="padding:128px 16px">
    <c:if test="${product eq 'laptop'}">
    <h3 class="w3-center"><fmt:message key="laptops"/></h3>
    <p class="w3-center w3-large"><fmt:message key="actuallyWhatYouNeed"/></p>
    </c:if>
    <c:if test="${product eq 'desktop'}">
    <h3 class="w3-center"><fmt:message key="desktops"/></h3>
    <p class="w3-center w3-large"><fmt:message key="somethingPowerful"/></p>
    </c:if>
    <c:if test="${product eq 'tablet'}">
    <h3 class="w3-center"><fmt:message key="tablets"/></h3>
    <p class="w3-center w3-large"><fmt:message key="bestForTrip"/></p>
    </c:if>
    <c:if test="${product eq 'accessorie'}">
    <h3 class="w3-center"><fmt:message key="accessories"/></h3>
    <p class="w3-center w3-large"><fmt:message key="dontForget"/></p>
    </c:if>
    <div class="w3-center w3-grayscale w3-padding" style="margin-top:25px">
        <div class="w3-card w3-border">
            <input class="w3-input" type="text" id="Search" onkeyup="searchItem()" placeholder="<fmt:message key="search"/>...">
        </div>
    </div>
    <div class="w3-row-padding w3-grayscale">
        <c:forEach var="item" items="${productsList}">
            <c:if test="${item.getType().getType() eq product && item.getAmount()>0}">
                <div class="w3-col l3 m6 w3-margin-bottom target">
                    <form method="post" action="/order">
                        <input type="hidden" name="product_id" value="${item.getId()}">
                        <div class=" w3-card">
                            <img src="${pageContext.request.contextPath}/images/${item.getImage()}"
                                 style="width:100%; height:300px;">
                            <div class="w3-container">
                                <h3>${item.getManufacturer().getName()} ${item.getName()}</h3>
                                <p class="w3-opacity">${item.getPrice()}<i class="fa fa-dollar"></i></p>
                                <p>${item.getDescription()}</p>
                                <c:if test="${user.getRole() eq 'client'}">
                                <p>
                                    <button class="w3-button w3-light-grey w3-block" type="submit" name="command"
                                            value="orderPage"><i class="fa"><fmt:message key="buy"/></i></button>
                                </p>
                                </c:if>
                            </div>
                        </div>
                    </form>
                </div>
            </c:if>
        </c:forEach>
    </div>
</div>
    <footer class="w3-center w3-black w3-padding-64">
        <c:import url="blocks/footer.jsp"/>
    </footer>
</body>
<script>
    function searchItem() {
        var input = document.getElementById("Search");
        var filter = input.value.toLowerCase();
        var nodes = document.getElementsByClassName('target');
        for (var i = 0; i < nodes.length; i++) {
            if (nodes[i].innerText.toLowerCase().includes(filter)) {
                nodes[i].style.display = "block";
            } else {
                nodes[i].style.display = "none";
            }
        }
    }
</script>
</html>
