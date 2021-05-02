<%-- 
    Document   : login
    Created on : Mar 22, 2021, 10:05:37 PM
    Author     : suhaniarora
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
       <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>login Page</title>
    </head>
    <body>
         <div class="formContainer">
            <form action="loginAuth" method="post">
  <div class="mb-3">
    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="user name" name="username">
    <input type="password" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="password" name="password">

  </div>
  <button type="submit" class="btn btn-primary">Submit</button>
</form>
        </div>
    </body>
</html>
