<%-- 
    Document   : listaClientes
    Created on : 15/11/2020, 11:42:22 PM
    Author     : ronal
--%>

<%@page import="DTO.Personal"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page import="java.util.List"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>


        <!-- Required meta tags-->
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="au theme template">
        <meta name="author" content="Hau Nguyen">
        <meta name="keywords" content="au theme template">

        <!-- Title Page-->
        <title>Lista  de Personal</title>

        <!-- Favicons -->
        <link rel="icon" type="image/x-icon" href="../images/icon/logo.ico">

        <!-- Fontfaces CSS-->
        <link href="../css/font-face.css" rel="stylesheet" media="all">
        <link href="../vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
        <link href="../vendor/font-awesome-5/css/fontawesome-all.min.css" rel="stylesheet" media="all">
        <link href="../vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">

        <!-- Bootstrap CSS-->
        <link href="../vendor/bootstrap-4.1/bootstrap.min.css" rel="stylesheet" media="all">

        <!-- ../vendor CSS-->
        <link href="../vendor/animsition/animsition.min.css" rel="stylesheet" media="all">
        <link href="../vendor/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet" media="all">
        <link href="../vendor/wow/animate.css" rel="stylesheet" media="all">
        <link href="../vendor/css-hamburgers/hamburgers.min.css" rel="stylesheet" media="all">
        <link href="../vendor/slick/slick.css" rel="stylesheet" media="all">
        <link href="../vendor/select2/select2.min.css" rel="stylesheet" media="all">
        <link href="../vendor/perfect-scrollbar/perfect-scrollbar.css" rel="stylesheet" media="all">

        <!-- Main CSS-->
        <link href="../css/theme.css" rel="stylesheet" media="all">


    </head>

    <body class="animsition">
        <div class="page-wrapper">
            <!-- HEADER MOBILE-->
            <jsp:include page="headerMobile.html" flush="true"/>
            <!-- END HEADER MOBILE-->

            <!-- MENU SIDEBAR-->
            <jsp:include page="menuSiderbar.jsp" flush="true"/>
            <!-- END MENU SIDEBAR-->

            <!-- PAGE CONTAINER-->
            <div class="page-container">
                <!-- HEADER DESKTOP-->
                <jsp:include page="headerDesktop.jsp" flush="true"/>
                <!-- END HEADER DESKTOP-->

                <!-- MAIN CONTENT-->
                <div class="main-content">
                    <div class="section__content section__content--p30"><h1 style="margin-left: 20px;margin-bottom: 50px;">Productos pedidos en una venta</h1>
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-sm">
                                    <h1>Lista Personal</h1>
                                </div>
                            </div><br>
                            <form action="../../ControladorPersonal"  method="GET">
                                <div class="table-responsive table-responsive-data2">
                                    <!-- filtros -->
                                    <div class="row">
                                        <div class="col col-sm-3">
                                            <span class="label label-default">Buscar Personal</span>
                                            <input class="form-control" type="text" name="NombrePersonal"  placeholder="Nombre">
                                        </div>
                                        <div class="col col-sm-3">
                                            <input class="btn btn-primary" href="../../ControladorPersonal?accion=Buscar" type="submit" name="accion" value="Buscar" style="margin-top: 25px;">
                                            <a class="btn btn-success" style="margin-top: 25px;" href="../../ControladorPersonal?accion=formcreate">Agregar Personal</a>
                                        </div>
                                    </div>
                                    <!-- filtros -->
                                </div>
                            </form>
                            <!-- Aquí empieza la tabla con los campos -->
                            <div class="row m-t-30">
                                <div class="col-md-12">
                                    <!-- DATA TABLE-->
                                    <div class="table-responsive m-b-40">
                                        <table class="table table-borderless table-data3">
                                            <thead>
                                                <tr>
                                                    <th class="text-center">ID</th>
                                                    <th class="text-center">NOMBRE</th>
                                                    <th class="text-center">APELLIDO</th>
                                                    <th class="text-center">USUARIO</th>
                                                    <th class="text-center">CONTRASEÑA</th>
                                                    <th class="text-center">ROL</th>
                                                    <th class="text-center">ACCIONES</th>
                                                </tr>
                                            </thead>
                                            <%
                                                System.out.println(request.getSession().getAttribute("listaPersonal").toString());
                                                List<DTO.Personal> list = (List<Personal>) request.getSession().getAttribute("listaPersonal");

                                                for (Personal dto : list) {
                                            %>
                                            <tbody>
                                                <tr>
                                                    <td class="text-center"><%= dto.getId()%></td>
                                                    <td class="text-center"><%= dto.getNombre()%></td>
                                                    <td class="text-center"><%= dto.getApellido()%></td>
                                                    <td class="text-center"><%= dto.getUsuario()%></td>
                                                    <td class="text-center"><%= dto.getContrasena()%></td>
                                                    <td class="text-center"><%= dto.getRolId().getDescripcion()%></td>
                                                    <td class="text-center">
                                                        <a class="btn btn-warning" href="../../ControladorPersonal?accion=formupdate&id=<%= dto.getId()%>" style=" width: 90px">Editar</a>
                                                        <a class="btn btn-danger"  href="../../ControladorPersonal?accion=Delete&id=<%= dto.getId()%>">Eliminar</a>
                                                    </td>
                                                </tr>
                                                <%}%>
                                            </tbody>
                                        </table>
                                    </div>
                                    <!-- END DATA TABLE-->
                                </div>
                            </div>

                            <!-- Aquí termina la tabla-->

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="copyright">
                                        <p>Copyright © 2018 Colorlib. All rights reserved. Template by <a href="https://colorlib.com">Colorlib</a>.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Jquery JS-->
        <script src="../vendor/jquery-3.2.1.min.js"></script>
        <!-- Bootstrap JS-->
        <script src="../vendor/bootstrap-4.1/popper.min.js"></script>
        <script src="../vendor/bootstrap-4.1/bootstrap.min.js"></script>
        <!-- ../vendor JS       -->
        <script src="../vendor/slick/slick.min.js">
        </script>
        <script src="../vendor/wow/wow.min.js"></script>
        <script src="../vendor/animsition/animsition.min.js"></script>
        <script src="../vendor/bootstrap-progressbar/bootstrap-progressbar.min.js">
        </script>
        <script src="../vendor/counter-up/jquery.waypoints.min.js"></script>
        <script src="../vendor/counter-up/jquery.counterup.min.js">
        </script>
        <script src="../vendor/circle-progress/circle-progress.min.js"></script>
        <script src="../vendor/perfect-scrollbar/perfect-scrollbar.js"></script>
        <script src="../vendor/chartjs/Chart.bundle.min.js"></script>
        <script src="../vendor/select2/select2.min.js">
        </script>

        <!-- Main JS-->
        <script src="../js/main.js"></script>

    </body>

</html>
