<%@ page contentType="text/html;charset=UTF-8" language="java" import = "java.io.*,java.util.*,classes.User" %>

<html lang="ru">
<head>
    <meta name="viewport" content="width=device-width,minimum-scale=1,maximum-scale=10">
    <title>Sign In</title>
    <link rel="stylesheet" href="css/style.css">
    <script type="text/javascript">
        function setFocus(){
            document.getElementById("login").focus();
        }
    </script>
</head>
<body onload="setFocus()">
    <div class="content-wrapper">
        <header class="header">
            <div class="logo"><a href="index.jsp"><img src="static/Group 3.svg"></a></div>
            <nav class="menu">
                <ul>
                    <li><a href="index.jsp">Main</a></li>
                    <li><a href="/menu">Products</a></li>
                    <li><a href="/chat">Chat</a></li>
                </ul>
            </nav>
            <div class="authcheck">
                <%
                    User curruser = (User)session.getAttribute("user");
                    if(curruser == null) {
                        out.print("Sesson is not found");
                    }
                    else {
                        out.print("You sign in as: <br/>");
                        out.println(curruser.getLogin());
                    }
                %>
                <form action="/auth">
                    <input type="submit" value="Profile">
                </form>
            </div>
        </header>

        <div class="container clearfix">
            <div class="block1">
                <form action="/signin">
                    <p class="label" style="text-align: start;">Sign In</p>
                    <div class="signUpPanel">
                        <div class="signUpDiv"><input type="text" name="login"  id="login" placeholder="Login" required aria-selected="true"></div>
                        <div class="signUpDiv"><input type="password" name="password"  id="password" placeholder="Password" required></div>
                        <input type="submit" value="Sign In" id="btn_add">
                        <%
                            if(request.getParameter("login") != null || request.getParameter("password") != null) { %>
                                <p style="color:red">An authorization error occurred</p>
                            <%}
                        %>
                    </div>
                </form>
                <a href="signup.jsp">Sign Up</a>
            </div>
        </div>

        <footer class="footer">
            <p style="font-size: 15px; margin: 0; padding: 10px 1em;">@ 2022 KaplichyiDV</p>
        </footer>
    </div>
</body>
</html>
