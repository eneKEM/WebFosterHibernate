
<%@page import="pojos.Producto"%>
<%@page import="pojos.Categoria"%>
<%@page import="org.eclipse.jdt.core.compiler.CategorizedProblem"%>

<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
        integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css">
    <link rel="stylesheet" href="css/mycss.css">

    <title>Chistes</title>

</head>

<body>
		<%
		
        ArrayList<Categoria> categorias = (ArrayList<Categoria>) session.getAttribute("categorias");
        ArrayList<Producto> productos = (ArrayList<Producto>) session.getAttribute("productos");
        boolean showC=(boolean) session.getAttribute("showC");
        boolean showP=(boolean) session.getAttribute("showP");
        Producto producto=(Producto) session.getAttribute("producto");
       if(showC||showP){
        %>
    <div class="container ">
    <%}else{ %>
    <div class="container a" style="background-image: url(<%=producto.getFondo() %>);">
    <%} %>
    	
        <header class="row">
			<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                  <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                  <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                  <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner">
                  <div class="carousel-item active">
                    <img class="d-block w-100" src="img/slider1.png" alt="First slide">
                  </div>
                  <div class="carousel-item">
                    <img class="d-block w-100" src="img/slider2.png" alt="Second slide">
                  </div>
                  <div class="carousel-item">
                    <img class="d-block w-100" src="img/slider3.png" alt="Third slide">
                  </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                  <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                  <span class="carousel-control-next-icon" aria-hidden="true"></span>
                  <span class="sr-only">Next</span>
                </a>
              </div>
			

        </header>

        
        <%
        if(showC){
        	 %><div class="row row justify-content-between mt-5 text-center blanc"><%
		for (Categoria c : categorias) {
				
			
        %>
            <div class="col-sm-10 col-md-4 col-lg-3 sombra m-2">
	            <a href="Controller?op=dameproductos&categoria=<%=c.getId() %>">
	                <img src="img/<%=c.getNombre() %>.png">
	                <h3 class="p-2" ><%=c.getNombre() %></h3>
	            </a>
            </div>
        <%}
        }else if(showP){
        	%><div class="row row justify-content-between mt-5 text-center blanc"><%
        	for (Producto p : productos) {
				
			
        %>
        	
            <div class="col-sm-10 col-md-4 col-lg-3 sombra m-2">
	            <a href="Controller?op=verproducto&p=<%=p.getId() %>">
	                <img src=<%=p.getImagen()%>>
	                <h3 class="p-2" ><%=p.getTitulo()%></h3>
	            </a>
            </div>
        <%}
        }else{
        	int media=(int)session.getAttribute("media");
        	%><div class="row row justify-content-center mt-5 text-center "><%
          %>
          <div class="col-8 sombra m-2 blanc">

                <span class="total">
                <%for(int i=0;i<media;i++){ %>
               
                	&#9733;
                <%}%>
                </span>


                <img src=<%=producto.getImagen()%>>
                <h3 class="p-2"><%= producto.getTitulo() %></h3>
                <p class="text-left"><%= producto.getSumario() %></p>
                <span class="rating">
                        <a href="Controller?op=rating&rating=1">&#9733;</a>
                        <a href="Controller?op=rating&rating=2">&#9733;</a>
                        <a href="Controller?op=rating&rating=3">&#9733;</a>
                        <a href="Controller?op=rating&rating=4">&#9733;</a>
                        <a href="Controller?op=rating&rating=5">&#9733;</a>
                        </span>
                        
            </div>
          <%} %>
        </div>

    </div>


    <footer class=" container text-center mt-5">
        <div class="row">
            <div class="col-12 text-white">
                <h1>Foster Hollywood</h1>

            </div>

        </div>
    </footer>


    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
        integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
        integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
        crossorigin="anonymous"></script>
    <script src="js/myjs.js"></script>

</body>

</html>