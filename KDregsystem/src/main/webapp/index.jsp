<%@ page contentType="text/html;charset=UTF-8" language="java" import = "java.io.*,java.util.*,classes.User" %>
<!DOCTYPE html>
<html language="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,minimum-scale=1,maximum-scale=10">
    <title>Main page</title>
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
                    if(curruser != null) {
                        out.println(curruser.getLogin());
                    }
                %>
                <form action="/auth">
                    <input type="submit" value="Profile">
                </form>
            </div>
        </header>

        <div class="container clearfix">
            <main class="content">
                <p class="label">Welcome!</p>
                <div class="block2" style="text-align: justify;">
                    <p><b>Coffee Center</b> is a chain coffee shop. These are friendly city establishments with excellent coffee, intelligent public and nice interiors, where people meet and are charged with new impressions.</p></br>
                    <p>In addition to the best coffee, we prepare Fast food: French fries, burgers, sandwiches, chicken strips. As well as Slow food - a healthy varied menu for every day: healthy breakfasts, salads, pastas, soups and set lunches.</p></br>
                    <p>Homemade desserts are our pride! We have collected a collection of dozens of proven delicious recipes. Our confectioners fill the coffee shop windows with mind-blowing desserts, cakes and all kinds of sweets every day.</p>
                </div>
            </main>
        </div>

        <footer class="footer">
            <p style="font-size: 15px; margin: 0; padding: 10px 1em;">@ 2022 KaplichyiDV</p>
        </footer>
    </div>
</body>
</html>
