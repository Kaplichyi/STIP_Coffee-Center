<%@ page contentType="text/html;charset=UTF-8" language="java" import = "java.io.*,java.util.*,classes.User,classes.Product" %>

<html language="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,minimum-scale=1,maximum-scale=10">
    <title>Product</title>
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
            <main class="content itemsdetails">
                <% Product item = (Product) session.getAttribute("item"); %>
                <div class="item" style="padding: 20px; margin: 0;">
                    <p class="label"><% out.print(item.getName()); %></p>
                    <div style="text-align: right; font-size:24px;">${item.getPrice()} ₽</div>
                    <div style="min-height: 10em;">${item.getDescription()}</div>
                    <%
                        if(curruser != null) {
                            if(curruser.getRole().equals("User")) {
                                out.print("<form action='/order'>");
                                out.print("<p style='font-size: 24px; margin: 0'>Make an order</p>");
                                out.print("<input type='text' name='amount' id='amount' placeholder='Amount' required pattern='[1-9]'>");
                                out.print("<input type='hidden' name='id' id='id' value='" + item.getId() + "'>");
                                out.print("<input type='submit' value='Order'>");
                                out.print("</form>");
                            }
                            else if(curruser.getRole().equals("Employee")) {
                                out.print("<a onclick='return confirmdelete();' href='/delitem?id=" + item.getId() + "'>Delete an item</a>");
                            }
                        }
                    %>
                </div>
            </main>
        </div>

        <footer class="footer">
            <p style="font-size: 15px; margin: 0; padding: 10px 1em;">@ 2022 KaplichyiDV</p>
        </footer>
    </div>
    <script>
        function confirmdelete() {
            if (confirm("Are you sure you want to delete the item?")) {
                return true;
            } else {
                return false;
            }
        }
    </script>
</body>

</html>
