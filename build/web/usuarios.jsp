
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="config.Conexao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
        <link rel="stylesheet" href="css/styles.css"/>
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js"></script>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de usuários</title>
    </head>
    <body>

        <%
            Statement st = null;
            ResultSet rs = null;
        %>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="#">Users List</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Link</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Dropdown
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">Action</a>
                            <a class="dropdown-item" href="#">Another action</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Something else here</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
                    </li>
                </ul>
                <form class="form-inline my-2 my-lg-0" style="margin-left: 1400px">
                    <span > <small>
                            <%
                                String nameUser = (String) session.getAttribute("nameUser");
                                out.print(nameUser);

                                if (nameUser == null) {
                                    response.sendRedirect("index.jsp");
                                };
                            %>
                        </small> </span>

                    <a href="logout.jsp"><i class="fa-solid fa-right-from-bracket ml-1"></i></a>

                </form>
            </div>
        </nav>
        <div class="container">
            <div class="row mt-4 mb-4">
                <div class="col-md-6">
                    <button class="btn btn-info" data-toggle="modal" data-target="#Modal">New user</button>
                </div>
                <div class="col-md-6">
                    <form class="form-inline direita">
                        <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-info my-2 my-sm-0" type="submit">Search</button>
                    </form>
                </div>
            </div>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Name</th>
                        <th scope="col">Email</th>
                        <th scope="col">Role</th>
                    </tr>
                </thead>
                <tbody>

                    <%
                        st = new Conexao().conectar().createStatement();
                        rs = st.executeQuery("SELECT * FROM usuarios ORDER BY ID asc");
                        while (rs.next()) {%>

                    <tr>
                        <td><%= rs.getString(1)%></td>
                        <td><%= rs.getString(2)%></td>
                        <td><%= rs.getString(3)%></td>
                        <td><%= rs.getString(5)%></td>
                    </tr>

                    <% }%>

                </tbody>
            </table>
        </div>
    </body>
</html>

<!-- Modal -->
<div class="modal fade" id="Modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form id="cadastro-form" class="form" action="" method="post">
                <div class="modal-body">

                    <h3 class="text-center text-info">New User</h3>
                    <div class="form-group">
                        <label for="username" class="text-info">Name:</label><br>
                        <input type="text" name="txtname" id="txtname" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label for="username" class="text-info">Email:</label><br>
                        <input type="text" name="txtemail" id="txtemail" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label for="username" class="text-info">Password:</label><br>
                        <input type="text" name="txtpass" id="txtpass" class="form-control" required>
                    </div>
                    <div class="form-group text-info">
                        <label for="exampleFormControlSelect1">Role</label>
                        <select class="form-control"  name="txtrole" id="txtrole">
                            <option>ADMINISTRADOR</option>
                            <option>CLIENTE</option>
                            <option>ESTAGIARIO</option>
                            <option>EFETIVADO</option>
                        </select>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="submit" name="btn-save" class="btn btn-primary">Save changes</button>
                </div>
            </form>
        </div>
    </div>
</div>

<%
    if (request.getParameter("btn-save") != null) {
        String name = request.getParameter("txtname");
        String email = request.getParameter("txtemail");
        String password = request.getParameter("txtpass");
        String role = request.getParameter("txtrole");
        
        st = new Conexao().conectar().createStatement();
        rs = st.executeQuery("SELECT * FROM usuarios where email = '"+email+"'");
                    while (rs.next()) {
                        rs.getRow();
                        if(rs.getRow() != 0){
                         out.print("<script>alert('Usuário já cadastrado!');</script>");
                         return;
                        }
                    }

        st.executeUpdate("INSERT INTO usuarios (name,email,pass,role) VALUES ('" + name + "','" + email + "','" + password + "','" + role + "')");
        response.sendRedirect("usuarios.jsp");
    }
%>
