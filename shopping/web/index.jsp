<%-- 
    Document   : index
    Created on : Mar 22, 2021, 8:26:04 PM
    Author     : suhaniarora
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <div class="navbar">
            <div class="navbarcontainer">
                <div class="navbarleft">
                    <img src="data:image/jpeg;base64,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" alt="website logo"/>
                    <a href="./"><h3> <span>MYNTRA</span></h3></a>
                </div>
                <div class="navbar__right">
                    <span><a href="./">Home</a></span>
                    <span><a href="cart.jsp">Cart</a></span>
                    <span><a href="logOut">Log Out</a></span>
                </div>
            </div>
        </div>
<link rel="stylesheet" href="navbar.css">
        <title>Home Page</title>
    </head>
    <body>
        <div class="itemsContainer">
            <%
                    try{
                        Connection connection = DriverManager.getConnection("jdbc:derby://localhost:1527/SUHANI","suhani","suhani");
                        Statement statement=connection.createStatement();
                        String sql ="select * from products";
                        ResultSet resultSet = statement.executeQuery(sql);
                        while(resultSet.next()){
                            int id=resultSet.getInt("id");
                            String img=resultSet.getString("img");
                            String name=resultSet.getString("name");
                            String price=resultSet.getString("price");
                    %>
                    <div class="card" style="width: 18rem;">
                        <img src="<%=img%>" class="card-img-top" alt="...">
                        <div class="card-body">
                        <h5 class="card-title"><%=name%></h5>
                        <p class="card-text"><%=price%></p>
                      
                        <a  class="btn btn-primary" href="addToCart1?id=<%=id%>">Add to Cart</a>
                    </div>
</div>
                    <%
                    }
                    connection.close();
                    } catch (Exception e) {
                    e.printStackTrace();
                    }
                    %>
        </div>
    </body>
</html>