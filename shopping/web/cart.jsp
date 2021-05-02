<%-- 
    Document   : cart
    Created on : Mar 23, 2021, 4:48:46 PM
    Author     : suhaniarora
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart Page</title>
        <link rel="stylesheet" href="navbar.css">
        <link rel="stylesheet" href="cart.css">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link rel="icon" href="https://cdn0.iconfinder.com/data/icons/kameleon-free-pack-rounded/110/Online-Shopping-512.png">
        <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
        <script>
            function order(){
                alert('Your order has been placed');
            }
        </script>
    </head>
    <body>
        
        <div class="cart">
            <div class="cart__header">Cart</div>
            <div class="cart__container">
                             
                <%
                    try{
                        Class.forName("org.apache.derby.jdbc.ClientDriver");
                        Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/SUHANI", "suhani", "suhani");
                        Statement stmt=con.createStatement();
                        String sql ="select products.name, products.price,products.img, cart.quantity ,cart.id FROM products,cart WHERE products.id=cart.id ";
                        ResultSet rs = stmt.executeQuery(sql);
                        while(rs.next()){
                            int id=rs.getInt("id");
                            int quantity=rs.getInt("quantity");
                            String name=rs.getString("name");
                            String price=rs.getString("price");
                            String img=rs.getString("img");
                    %>
                    <div class="cart__item">
                        <div class="cart__itemLeft">
                            <img src="<%=img%>"/>
                        </div>
                        <div class="cart__itemRight">
                            <p class="cart__itemName"><%=name%></p>
                            <p><span>Price : </span><%=price%></p>
                            <p><span>Quantity : </span><%=quantity%></p>
                            <a href="removeCartItem?id=<%=id%>" class="remove">&#x2715</a>
                        </div>
                    </div>
                    <%
                    }
                    con.close();
                    } catch (Exception e) {
                    e.printStackTrace();
                    }
                    %>                
            </div>
            <button onclick="order()">
                Place Order
            </button>
        </div>
    </body>
</html>