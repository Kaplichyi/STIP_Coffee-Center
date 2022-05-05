<%@ page contentType="text/html;charset=UTF-8" language="java" import = "java.io.*,java.util.*,classes.User" %>

<html lang="ru">
<head>
    <meta name="viewport" content="width=device-width,minimum-scale=1,maximum-scale=10">
    <title>Sign Up</title>
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
                    <input type="submit" value="Login in">
                </form>
            </div>
        </header>
        <div class="block1">
            <form action="/signup">
                <p class="label" style="text-align: start;">Sign Up</p>
                <div><input type="text" name="login" id="login" placeholder="Login" pattern="[A-Za-z0-9]{4,12}" required/></div>

                <div><input type="password" name="password" id="password" placeholder="Password" pattern="[A-Za-z0-9]{6,16}" required/></div>

                <div><input type="text" name="name" id="name" placeholder="Name" pattern="[A-Za-z]{3,12}" required/></div>

                <div><input type="text" name="email" id="email" placeholder="EMail" pattern="[A-Za-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" required/></div>

                <div>Gender</div>
                <div><input type="radio" name="gender" value="Not specify" checked/><label> Not specify</label></div>
                <div><input type="radio" name="gender" value="Male"/><label> Male</label></div>
                <div><input type="radio" name="gender" value="Female"/><label> Female</label></div>
                <div><input type="radio" name="gender" value="Other"/><label> Other</label></div>

                <div>Birthday</div>
                <input type="date" name="bday" id="bday">

                <div><input type="checkbox" name="mailing" id="mailing" value="Agree"> Mailing</div>

                <div><input type="submit" value="Sign Up"></div>
            </form>
        </div>

        <footer class="footer">
            <p style="font-size: 15px; margin: 0; padding: 10px 1em;">@ 2022 KaplichyiDV</p>
        </footer>
    </div>
</body>
</html>
