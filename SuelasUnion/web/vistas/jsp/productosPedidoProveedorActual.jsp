<%-- 
    Document   : productosPedidoProveedorActual
    Created on : 14/12/2020, 11:53:17 AM
    Author     : MANUEL
--%>



<%@page import="DTO.ProductoPedidoProveedor"%>
<%@page import="DTO.Tira"%>
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
  
            <!-- END HEADER MOBILE-->

            <!-- MENU SIDEBAR-->
        
            <!-- END MENU SIDEBAR-->

            <!-- PAGE CONTAINER-->
            <div class="">
                <!-- HEADER DESKTOP-->
            
                <!-- END HEADER DESKTOP-->

                <!-- MAIN CONTENT-->

                <div class="main-content">
                    <div class="section__content section__content--p30">
                        <div class="container-fluid">
                            <!-- Aquí empieza lo de buscar -->



                            <!-- Aquí empieza la tabla con los campos -->
                            <div class="row ">
                                <div class="col-md-12">
                                    <div class="table-responsive m-b-40">

                                        <table class="table table-borderless table-data3">
                                            <thead>
                                                <tr>
                                                    <th class="text-center">#</th>

                                                    <th class="text-center">PRODUCTO</th>
                                                    <th class="text-center">CANTIDAD</th>
                                                    <th class="text-center">PRECIO</th>
                                                    <th class="text-center">VALOR</th>
                                                    <th></th>


                                                </tr>
                                            </thead>
                                            <%

                                                List<ProductoPedidoProveedor> list = (List<ProductoPedidoProveedor>) request.getSession().getAttribute("listaProductosPedidoProveedorActual");
                                                int indice = 1;
                                                for (ProductoPedidoProveedor elem : list) {
                                            %>
                                            <%
                                                String tipo = elem.getProducto().getTipoProducto();
                                                String nombreProducto = "";
                                                if (tipo.equals("1")) {
                                                    nombreProducto = "Plantilla" + " " + elem.getProducto().getPlantilla().getModelo();
                                                }
                                                if (tipo.equals("2")) {
                                                    nombreProducto = "Suela PVC" + " " + elem.getProducto().getSuela().getModelo();
                                                }
                                                if (tipo.equals("3")) {
                                                    nombreProducto = "Suela Expanso" + " " + elem.getProducto().getSuela().getModelo();
                                                }
                                                if (tipo.equals("4")) {
                                                    nombreProducto = "Tira" + " " + elem.getProducto().getTira().getModelo();
                                                }
                                                if (tipo.equals("5")) {
                                                    nombreProducto = "Salpa";
                                                }
                                            %>
                                            <tbody>
                                                <tr>

                                                    <td class="text-center"><%=indice%></td>

                                                    <td class="text-center"><%= nombreProducto%></td>
                                                    <td class="text-center"><%=elem.getCantidad()%></td>
                                                    <td class="text-center"><%=elem.getPrecio()%></td>
                                                    <td class="text-center"><%=elem.getTotal()%></td>
                                                        <td>   <a   class="btn-danger" href="../../ControladorPedidoProv?accion=eliminarProductoActual&id=<%=elem.getProducto().getId() %>"> Eliminar</a></td>







                                                </tr>
                                                <%
                                                        indice++;
                                                    }
                                                %>
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
