<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Detalles de Categoría</title>
</head>
<body>
    <h1>Detalles de la Categoría</h1>
    
   
	 <%@include file="../template/fecha.html" %>
    <h2>Nombre de la Categoría</h2>
    <p>${categoria.nameCategory}</p>
    
    <h2>Total</h2>
    <p>${total}</p>

    <h2>Movimientos Asociados</h2>
    <table border="1">
        <thead>
            <tr>
                <th>Concepto</th>
                <th>Fecha</th>
                <th>Monto</th>
                <th>Cuenta Origen</th>
                <th>Cuenta Destino</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="movimiento" items="${movimientos}">
                <tr>
                    <td>${movimiento.concept}</td>
                    <td>${movimiento.date}</td>
                    <td>${movimiento.amount}</td>
                    <td>${movimiento.origin}</td>
                    <td>${movimiento.destiny}</td>
                    <td> <a href="#" class="deleteMovement" data-idCategoria="${categoria.idCategory}"data-id="${movimiento.idMovement}" data-nombre="${movimiento.concept}" >Eliminar</a> </td>
                	<td> <a href="ContabilidadController?ruta=UpdateFormMovement&idMovimiento=${movimiento.idMovement}" >Editar</a> </td>
                	
                </tr>
            </c:forEach>
        </tbody>
    </table>
    
    <br><br>
    <a href="ContabilidadController?ruta=showdashboard" >Regresar</a>
</body>
<script type="text/javascript">

document.addEventListener("DOMContentLoaded", function() {
    document.querySelectorAll(".deleteMovement").forEach(function(eliminarLink) {
        eliminarLink.addEventListener("click", function(event) {
            event.preventDefault();
            
            var idMovimiento = this.getAttribute("data-id");
            var conceptoMovimiento = this.getAttribute("data-nombre");
            var  idCategoria =  this.getAttribute("data-idCategoria");
            var origen = "mostrarCategoria";
            
            var confirmacion = confirm("¿Desea eliminar este movimiento: " + conceptoMovimiento + "?");
            
            if (confirmacion) {
                // Redirige al controlador para eliminar la categoría
                window.location.href = "ContabilidadController?ruta=deleteMovement&idMovimiento=" + idMovimiento + "&idCategoria="+ idCategoria + "&vistaOrigen=" + origen;
            }
        });
    });
});

</script>
</html>
