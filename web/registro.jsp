<%-- 
    Document   : registro
    Created on : 28/05/2024, 10:00:23 PM
    Author     : SADValenz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro</title>
        <link rel="stylesheet" href="estilos/estilos.css">
    </head>
    <script>
        
       function validarCorreo(){
            var id=document.getElementById("correo").value;
            var expresion = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/; 

            if (id === null || id.trim() === "") {
                alert("El campo de correo no debe estar vacio.");
                return false;
            } else if (id.match(expresion)) {
                return true;
            } else {
                alert("El formato de correo no esta correcto.");
                return false;
            }
        }
        function validarContrasena(){
            var contrasena=document.getElementById("contrasena").value;
            var expresion = /^[a-zA-Z0-9]+$/; 

            if (contrasena === null || contrasena.trim() === "") {
                alert("El campo de contraseña no puede estar vacío.");
                return false;
            } else if (contrasena.match(expresion)) {
                return true;
            } else {
                alert("El campo de contraseña debe contener numeros o letras sin caracteres especiales");
                return false;
            }
        }
        function validarNombre() {
        var nombre=document.getElementById("nombre").value;
        const regex = /^[A-Za-záéíóúÁÉÍÓÚüÜñÑ]{1,50}$/;
        if (nombre === null || nombre.trim() === "") {
                alert("El campo de nombre no puede estar vacío.");
                return false;
            } else if (regex.test(nombre)) {
                return true;
            } else {
                alert("El campo de nombre debe contener letras y un nombre");
                return false;
            }
        }
        function validarApellido() {
            var apellido=document.getElementById("apellido").value;
            const regex = /^[A-Za-záéíóúÁÉÍÓÚüÜñÑ]{1,50}$/;
            if (apellido === null || apellido.trim() === "") {
                alert("El campo de apellido no puede estar vacío.");
                return false;
            } else if (regex.test(apellido)) {
                return true;
            } else {
                alert("El campo de apellido debe contener letras y un apellido");
                return false;
            }    
        }
        function validarTelefono() {
            var telefono=document.getElementById("telefono").value;
            const regex = /^\d{10}$/;
            if (telefono === null || telefono.trim() === "") {
                alert("El campo de telefono no puede estar vacío.");
                return false;
            } else if (regex.test(telefono)) {
                return true;
            } else {
                alert("El campo de telefono debe contener solo 10 numeros");
                return false;
            }
        }   
        function redireccionar(){
            var correo=document.getElementById("correo").value;
            var contrasena=document.getElementById("contrasena").value;
            var telefono=document.getElementById("telefono").value;
            var apellido=document.getElementById("apellido").value;
            var nombre=document.getElementById("nombre").value;
            var sexo=document.getElementById("sexo").value;
            
            if(validarContrasena()&&validarCorreo()&&validarNombre()&&validarTelefono()&&validarApellido()){
                window.location.href="SVRegistro?correo="+correo+"&contrasena="+contrasena+"&telefono="+telefono+"&apellido="+apellido+"&nombre="+nombre+"&sexo="+sexo;
            }
            
        }
        
    </script>
    <%
        HttpSession sesion=request.getSession();
        String procedencia=request.getHeader("referer");
            if((procedencia==null)||(sesion.isNew())){
                response.sendRedirect("index.jsp");
                return;
            } 
    %>
    <body class="registro-body">
        <nav class="barraNavegacion">
                <div class="titulo-pagina">
                    <a>Registro</a>
                </div>
                <ul class="Menu-barra-navegacion">
                    <li class="elemento-barra"><a href="index.jsp">Pagina Principal</a></li>
                </ul>
            </nav>
        <section class="contenido">
        <table id="esqueleto-Inicio">
            <tr>
                <td>
                    <div class="padre">
                        <div class="Contenedor-Registro">
                            <h1 id="titulo-Index">Ingrese sus datos</h1>
                            <form action="SVRegistro">
                                <p class="contenedor-Input">
                                    <b>Nombre:</b><input id="nombre" type="text" name="Nombre" class="entradaDatos" /> <br>
                                </p>
                                <p class="contenedor-Input">
                                    <b>Apellido: </b><input id="apellido" type="text" name="Apellido" class="entradaDatos" /> 
                                </p>
                                <p class="contenedor-Input">
                                    <b>Telefono: </b><input id="telefono" type="number" name="Apellido" class="entradaDatos" /> 
                                </p>
                                <p class="contenedor-Input">
                                    <b>Correo:</b><input id="correo" type="text" name="ID" class="entradaDatos"/> <br>
                                </p>
                                <p class="contenedor-Input">
                                    <b>Contraseña: </b><input id="contrasena" type="password" name="Contrasena" class="entradaDatos" /> 
                                </p>
                                <p class="contenedor-Input">
                                    <b>Sexo: </b>
                                    <select id="sexo" name="sexo">
                                        <option>Mujer</option>
                                        <option>Hombre</option>
                                    </select>
                                </p>
                                <input class="boton" type="button" onclick="redireccionar();" value="Registrarse"/>
                            </form>
                        </div>
                    </div>
                </td>
            </tr>
            
            <tr>
                <td>
                    <div id="mensaje-error">
                        <h2>
                            <%
           String mensaje=request.getParameter("mensaje");
           if(!(mensaje==null))out.println("<br>"+mensaje.replace("_", " "));
           %>
                        </h2>
                    </div>
                </td>
            </tr>
        </table>
        
     </section>
    </body>
</html>