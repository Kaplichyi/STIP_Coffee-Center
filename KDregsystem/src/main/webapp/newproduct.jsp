<%@ page contentType="text/html;charset=UTF-8" language="java" import = "java.io.*,java.util.*,classes.User" %>
<!DOCTYPE html>
<html language="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,minimum-scale=1,maximum-scale=10">
    <title>New Product</title>
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
                <form action="/auth">
                    <input type="submit" value="Profile">
                </form>
            </div>
        </header>

        <div class="block1" style="width: auto;">
            <p class="label" style="text-align: start;">Product information</p>
            <form action="/newitem">
                <div><input type="text" name="name" id="name" placeholder="Name" pattern="[A-Za-z]{3,12}" required></div>

                <div><input type="text" name="price" id="price" placeholder="Price" pattern="[1-9][0-9]{0,4}" required></div>

                <div><textarea type="text" name="description" id="description" placeholder="Description"></textarea></div>

                <div><input type="submit" value="Add"></div>
            </form>
        </div>

        <footer class="footer">
            <p style="font-size: 15px; margin: 0; padding: 10px 1em;">@ 2022 KaplichyiDV</p>
        </footer>
    </div>
</body>
</html>
