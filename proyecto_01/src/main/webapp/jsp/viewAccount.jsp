<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Detalle de Cuenta</title>
</head>
<body>
    <h1>Detalles de la Cuenta</h1>
    
   
	  <%@include file="../template/fecha.html" %>
    
     <!-- Mostrar mensaje de éxito si está presente -->
    <c:if test="${param.mensaje != null}">
        <p style="color: green;">${param.mensaje}</p>
    </c:if>
    
    
    <h2>Cuenta ${cuenta.nameAccount} </h2>
    <table border="1">
        <thead>
            <tr>
                <th>Saldo</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>${cuenta.total}</td>
            </tr>
        </tbody>
    </table>
    
    <h2>Movimientos de la Cuenta</h2>
    <table border="1">
        <thead>
            <tr>
                <th>Concepto</th>
                <th>Fecha</th>
                <th>Monto</th>
                <th>Cuenta Origen</th>
                <th>Cuenta Destino</th>
                <th>Categoría</th>
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
                    <td>${movimiento.category}</td>
                    <td> <a href="ContabilidadController?ruta=UpdateFormMovement&idMovimiento=${movimiento.idMovement}" >Editar</a> </td>
                    <td> <a href="#" class="deleteMovement" data-idCuenta="${cuenta.idAccount}" data-id="${movimiento.idMovement}" data-nombre="${movimiento.concept}" >Eliminar</a> </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    
    <a href="ContabilidadController?ruta=registerFormIncome&cuentaId=${cuenta.idAccount}" >Registrar un Nuevo Ingreso</a>
    <br><br>
    <a href="ContabilidadController?ruta=registerFormOutcome&cuentaId=${cuenta.idAccount}" >Registrar un Nuevo Egreso</a>
    <br><br>
    <a href="ContabilidadController?ruta=registerFormTransference&cuentaId=${cuenta.idAccount}" >Registrar una Nueva Transferencia</a>
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
            var idCuenta = this.getAttribute("data-idCuenta");
            var origen = "mostrarCuenta";
            
            var confirmacion = confirm("¿Desea eliminar este movimiento: " + conceptoMovimiento + "?");
            
            if (confirmacion) {
                // Redirige al controlador para eliminar la categoría
                window.location.href = "ContabilidadController?ruta=deleteMovement&idMovimiento=" + idMovimiento +"&idCuenta="+ idCuenta + "&vistaOrigen=" + origen;
            }
        });
    });
});


</script>

</html>