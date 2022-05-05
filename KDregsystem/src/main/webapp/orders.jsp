<%@ page contentType="text/html;charset=UTF-8" language="java" import = "java.io.*,java.util.*,classes.User,classes.Order" %>

<html language="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,minimum-scale=1,maximum-scale=10">
    <title>Menu</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="content-wrapper">
        <header class="header">
            <div class="logo"><a href="index.jsp"><img src="static/Group 3.svg"></a></div>
            <nav class="menu">
                <ul>
                    <li><a href="index.jsp">Main</a></li>
                    <li><a href="/menu">Menu</a></li>
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
                <p class="label">Orders</p>
                <div class="orders">
                <%
                    ArrayList<Order> orders = (ArrayList<Order>) request.getAttribute("orders");
                    for(Order order : orders) {
                        out.println("<div class='Order'>");
                        out.println("<img src='static/Item.svg'>");
                        out.println("<div>ID: " + order.getId() + "</div>");
                        out.println("<div>Product Id: " + order.getProduct_Id() + "</div>");
                        out.println("<div>Amount: " + order.getAmount() + "</div>");
                        out.println("<div>Customer ID: " + order.getCustomer_ID() + "</div>");
                        out.println("<div>Customer name: " + order.getCustomer_Name() + "</div>");
                        out.println("<div>Order date: " + order.getOrder_Date() + "</div>");
                        out.println("<form action='/item'><input type='hidden' name='id' id='id' value='" + order.getProduct_Id() + "'>");
                        out.println("<div style='text-align: end;'><input type='submit' value='More' style='background: #3EAE7F; color: #DED8D8'></div></form>");
                        out.println("</div>");
                    }
                %>
                </div>
            </main>
        </div>

        <footer class="footer">
            <p style="font-size: 30px; margin: 0; padding: 10px 1em;"></p>
        </footer>
    </div>
</body>

</html>
