<%@ page contentType="text/html;charset=UTF-8" language="java" import = "java.io.*,java.util.*,classes.User,classes.Message" %>
<!DOCTYPE html>
<html language="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,minimum-scale=1,maximum-scale=10">
    <title>Chat</title>
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

        <div class="container clearfix">
            <main class="content">
                <p class="label">Chat</p>
                <div class="chatblock">
                    <%
                        ArrayList<Message> messages = (ArrayList<Message>) request.getAttribute("messages");
                        for(Message message : messages) {
                            out.println("<div><b>" + message.getUsername() + "</b>: " + message.getMessage() + "</div>");
                        }
                    %>
                </div>
                <%
                    if(curruser != null) {
                        out.print("<form action='/sendmessage' style='width: 540px; margin: auto;'>");
                        out.print("<input type='hidden' name='username' id='username' value='" + curruser.getLogin() + "'>");
                        out.print("<div style='display: flex;'>" + curruser.getLogin() + ": <input type='text' name='message' id='message' style='margin: 0;'></div>");
                        out.print("</form>");
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
