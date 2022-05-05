<%@ page contentType="text/html;charset=UTF-8" language="java" import = "java.io.*,java.util.*,classes.User" %>

<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,minimum-scale=1,maximum-scale=10">
    <title>Personal account</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
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
                <form action="/logout">
                    <input type="submit" value="Sign Out">
                </form>
            </div>
        </header>

        <div class="container clearfix">
            <main class="content">
                <p class="label" style="text-align: start;">There is your account information:</p>
                <div class="block1" style="width: auto;">
                    <%
                        Cookie cookie = null;
                        Cookie[] cookies = null;
                        cookies = request.getCookies();
                        out.println("<div>Login: " + curruser.getLogin() + "</div>");
                        out.println("<div>EMail: " + curruser.getEMail() + "</div>");
                        for (int i = 0; i < cookies.length; i++) {
                            cookie = cookies[i];
                            if(cookie.getName().equals("name")) {
                                out.print("<div>Name: " + cookie.getValue() + "</div>");
                            }
                            else if(cookie.getName().equals("gender")){
                                out.print("<div>Gender: " + cookie.getValue() + "</div>");
                            }
                            else if(cookie.getName().equals("bday")){
                                out.print("<div>Birthday: " + cookie.getValue() + "</div>");
                            }
                        }
                    %>
                </div>
                <%
                    if(curruser.getRole().equals("Employee")) {
                        out.println("<p class='label' style='text-align: start;'>Employee`s function</p>");
                        out.println("<div class='block1' style='width: auto;'>");
                            out.println("<p><a href='/orders'>Client`s orders</a></p>");
                            out.println("<p><a href='/menu'>Add new product</a></p>");
                        out.println("</div>");
                    }
                %>
            </main>
        </div>

        <footer class="footer">
            <p style="font-size: 15px; margin: 0; padding: 10px 1em;">@ 2022 KaplichyiDV</p>
        </footer>
    </div>
</body>
</html>
