<%--
  Created by IntelliJ IDEA.
  User: Евгений
  Date: 19.05.2019
  Time: 11:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:600px">
    <div class="w3-center"><br>
        <span onclick="document.getElementById('registration').style.display='none'" class="w3-button w3-xlarge w3-hover-red w3-display-topright w3-padding" title="Close">&times;</span>
    </div>
    <form class="w3-container" action="">
        <div class="w3-section w3-large">
            <label><b>Username</b></label>
            <input class="w3-input w3-border w3-margin-bottom" type="text" placeholder="Enter Username" name="username" required>
            <label><b>Password</b></label>
            <input class="w3-input w3-border w3-margin-bottom" type="password" placeholder="Enter Password" name="psw" required>
            <label><b>Confirm Password</b></label>
            <input class="w3-input w3-border w3-margin-bottom" type="password" placeholder="Confirm Password" name="cpsw" required>
            <label><b>E-mail</b></label>
            <input class="w3-input w3-border w3-margin-bottom" type="text" placeholder="email" name="email" required>
            <label><b>Name</b></label>
            <input class="w3-input w3-border w3-margin-bottom" type="text" placeholder="Name" name="name" required>
            <label><b>Surname</b></label>
            <input class="w3-input w3-border w3-margin-bottom" type="text" placeholder="Surname" name="surname" required>
            <label><b>Address</b></label>
            <input class="w3-input w3-border" type="password" placeholder="Address" name="address" required>
            <button class="w3-button w3-block w3-black w3-section w3-padding" type="submit">Register</button>
        </div>
    </form>
    <div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
        <button onclick="document.getElementById('registration').style.display='none'" type="button" class=" w3-hover-opacity w3-red w3-medium w3-padding" style="border:none;">Cancel</button>
        <span class="w3-right w3-padding w3-hide-small" style="cursor: pointer; text-decoration: underline"><a onclick="document.getElementById('registration').style.display='none';document.getElementById('login').style.display='block'">Login</a></span>
    </div>
</div>
</body>
</html>