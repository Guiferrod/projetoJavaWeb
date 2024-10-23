<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="java.sql.*"%>
<%@page import="config.Conexao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <link rel="stylesheet" href="css/loginStyle.css"/>
    <title>Login</title>
</head>

<%
    Statement st = null;
    ResultSet rs = null;
%>
<body>

    <div id="login">
        <div class="container">
            <div id="login-row" class="row justify-content-center align-items-center">
                <div id="login-column" class="col-md-6">
                    <div id="login-box" class="col-md-12">
                        <form id="login-form" class="form" action="" method="post">
                            <h3 class="text-center text-info">Login</h3>
                            <div class="form-group">
                                <label for="username" class="text-info">Username:</label><br>
                                <input type="text" name="txtusername" id="txtusername" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label for="password" class="text-info">Password:</label><br>
                                <input type="password" name="txtpassword" id="txtpassword" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label for="remember-me" class="text-info"><span>Remember me</span> <span><input id="remember-me" name="remember-me" type="checkbox"></span></label><br>
                                <input type="submit" name="submit" class="btn btn-info btn-md" value="submit">
                            </div>
                            <div id="register-link" class="text-right">
                                <a href="#" class="text-info">Register here</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <p align="center" class="text-light mt-2">
                <%
                    String username = request.getParameter("txtusername");
                    String password = request.getParameter("txtpassword");

                    String user = null, pass = null, nameUser = "";

                    st = new Conexao().conectar().createStatement();
                    rs = st.executeQuery("SELECT * FROM usuarios");
                    while (rs.next()) {
                        user = rs.getString(3);
                        pass = rs.getString(4);
                        nameUser = rs.getString(2);

                    }
                    if (username == null || password == null) {
                        out.println("Preencha os dados");
                    } else if (username.equals(user) && password.equals(pass)) {
                        session.setAttribute("nameUser", nameUser);
                        response.sendRedirect("usuarios.jsp");
                    } else {
                        out.println("Acesso negado");
                    }
                %>
            </p>
        </div>
    </div> 
</body>

