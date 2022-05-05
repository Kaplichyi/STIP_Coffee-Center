<%@ page contentType="text/html;charset=UTF-8" language="java" import = "java.io.*,java.util.*,classes.User,classes.Product" %>

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
                <p class="label">Our products</p>
                <div class="block2">
                    <form action="/menu" style="margin: 0; text-align: center;">
                        <input type="text" name="searchreq" placeholder="Item name" style="width: auto;">
                        <input type="submit" value="Search" style="width: auto;">
                    </form>
                </div>
                <div class="products">
                <%
                    ArrayList<Product> products = (ArrayList<Product>) request.getAttribute("products");
                    for(Product product : products) {
                        out.println("<div class='Item'>");
                        out.println("<img src='static/Item.svg'>");
                        out.println("<form action='/item'><div><p>" + product.getName() + "</p><p style='font-size: 26px; text-align: right;'>" + product.getPrice() + " ₽</p></div>");
                        out.println("<input type='hidden' name='id' id='id' value='" + product.getId() + "'>");
                        out.println("<div style='text-align: end;'><input type='submit' value='More'></div></form>");
                        out.println("</div>");
                    }
                %>
                </div>
                <%
                    if(curruser != null) {
                        if(curruser.getRole().equals("Employee")) {%>
                            <div class='block1' style='width: auto;'>
                                <a href='/newproduct.jsp' style='font-size:32px;'>+ Add new product</a>
                            </div>
                        <%}
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
