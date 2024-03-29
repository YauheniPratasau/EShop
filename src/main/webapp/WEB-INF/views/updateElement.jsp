<%--
  Created by IntelliJ IDEA.
  User: Евгений
  Date: 09.06.2019
  Time: 9:30 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<fmt:setLocale value="${lang_id}"/>
<fmt:setBundle basename="language"/>
<html>
<head>
    <title>Change</title>
    <c:import url="blocks/resources.jsp"/>
</head>
<body>
<div class="w3-top">
    <c:import url="menuBar.jsp"/>
</div>

<div class="w3-container w3-light-grey" style="padding:128px 16px">
    <div class="w3-margin-top w3-margin-bottom">
        <form method="post" action="/account" class="w3-container">
            <c:choose>
                <c:when test="${product ne null}"><input type="hidden" name="id" value="${product.getId()}"></c:when>
                <c:otherwise><input type="hidden" name="id" value="-1"></c:otherwise>
            </c:choose>
            <h4><fmt:message key="name"/>:</h4>
            <input class="w3-input" style="border-radius: 15px 50px 30px 5px; outline: none"
                   value="<c:if test="${product ne null}">${product.getName()}</c:if>" name="productName">
            <h4><fmt:message key="price"/>:</h4>
            <input class="w3-input" style="border-radius: 15px 50px 30px 5px; outline: none"
                   value="<c:if test="${product ne null}">${product.getPrice()}</c:if>" name="productPrice">
            <h4><fmt:message key="amount"/>:</h4>
            <input class="w3-input" style="border-radius: 15px 50px 30px 5px; outline: none"
                   value="<c:if test="${product ne null}">${product.getAmount()}</c:if>" name="productAmount">
            <h4><fmt:message key="description"/>:</h4>
            <input class="w3-input" style="border-radius: 15px 50px 30px 5px; outline: none"
                   value="<c:if test="${product ne null}">${product.getDescription()}</c:if>" name="productDescription">
            <h4><fmt:message key="image"/>:</h4>
            <input class="w3-input" style="border-radius: 15px 50px 30px 5px; outline: none"
                   value="<c:if test="${product ne null}">${product.getImage()}</c:if>" name="productImage">
            <h4><fmt:message key="manufacturer"/>:</h4>
            <select class="w3-input" style="border-radius: 15px 50px 30px 5px; outline: none" name="manufacturerName">
                <c:forEach var="manufacturer" items="${manufacturers}">
                    <c:choose>
                        <c:when test="${product ne null}">
                            <c:choose>
                                <c:when test="${product.getManufacturer().getName() eq manufacturer.getName()}">
                                    <option selected="selected"
                                            value="${manufacturer.getName()}">${manufacturer.getName()}</option>
                                </c:when>
                                <c:otherwise>
                                    <option value="${manufacturer.getName()}">${manufacturer.getName()}</option>
                                </c:otherwise>
                            </c:choose>
                        </c:when>
                        <c:otherwise>
                            <option value="${manufacturer.getName()}">${manufacturer.getName()}</option>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </select>
            <h4><fmt:message key="type"/>:</h4>
            <select class="w3-input" style="border-radius: 15px 50px 30px 5px; outline: none" name="productType">
                <c:forEach var="type" items="${types}">
                    <c:choose>
                        <c:when test="${product ne null}">
                            <c:choose>
                                <c:when test="${product.getType().getType() eq type.getType()}">
                                    <option selected="selected" value="${type.getType()}">${type.getType()}</option>
                                </c:when>
                                <c:otherwise>
                                    <option value="${type.getType()}">${type.getType()}</option>
                                </c:otherwise>
                            </c:choose>
                        </c:when>
                        <c:otherwise>
                            <option value="${type.getType()}">${type.getType()}</option>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </select>
            <span id="option-container" style="visibility: hidden; position:absolute;"></span>
            <div class="w3-margin-top">
                <button class="w3-padding-16 w3-left w3-button w3-border w3-round-medium w3-border-red"
                        type="submit" name="command" value="account">
                    <fmt:message key="cancel"/> <c:if test="${product ne null}"><fmt:message key="changes"/></c:if>
                </button>
                <button class="w3-padding-16 w3-right w3-button w3-border w3-round-medium w3-border-orange"
                        type="submit" name="command" value="updateProduct">
                    <fmt:message key="save"/> <c:if test="${product ne null}"><fmt:message key="changes"/></c:if>
                </button>
            </div>
        </form>
    </div>
</div>

<footer class="w3-center w3-black w3-padding-64">
    <c:import url="blocks/footer.jsp"/>
</footer>
</body>
</html>