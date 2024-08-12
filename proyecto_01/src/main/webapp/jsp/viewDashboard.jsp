<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard</title>
</head>
<body>
	<h1>Estado de la Contabilidad</h1>
	<c:if test="${param.mensaje != null}">
        <p style="color: green;">${param.mensaje}</p>
    </c:if>
	
	
	<%@include file="../template/fecha.html" %>
    <h2>Consolidado de las Cuentas</h2>
     <table border="1">
        <thead>
            <tr>
                <th>Nombre</th>
                <th>Saldo</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="cuenta" items="${cuentas}">
                <tr>
                    <td> <a href="ContabilidadController?ruta=showaccount&cuentaId=${cuenta.idAccount}">${cuenta.nameAccount}</a> </td>
                    <td>${cuenta.total}</td>
                    <td> <a href="ContabilidadController?ruta=registerFormIncome&cuentaId=${cuenta.idAccount}&origen=showdashboard" >Registrar un Nuevo Ingreso</a></td>
                    <td> <a href="ContabilidadController?ruta=registerFormOutcome&cuentaId=${cuenta.idAccount}&origen=showdashboard" >Registrar un Nuevo Egreso</a></td>

   					<td> <a href="ContabilidadController?ruta=registerFormTransference&cuentaId=${cuenta.idAccount}&origen=showdashboard" >Registrar una Nueva Transferencia</a></td>
                    
                </tr>
            </c:forEach>
        </tbody>
    </table>
    
     <h2>Categoría de Ingreso</h2>
    <table border="1">
        <thead>
            <tr>
                <th>Nombre de Categoría</th>
                <th>Total</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="categoria" items="${ingresos}">
                <tr>
                    <td> <a href="ContabilidadController?ruta=showcategory&categoriaId=${categoria.idCategory}" >${categoria.nameCategory}</a> </td>
                    <td>${totalIngresos[categoria.nameCategory]}</td> 
                   
                    
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <h2>Categoría de Egreso</h2>
    <table border="1">
        <thead>
            <tr>
                <th>Nombre de Categoría</th>
                <th>Total</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="categoria" items="${egresos}">
                <tr>
                    <td> <a href="ContabilidadController?ruta=showcategory&categoriaId=${categoria.idCategory}" >${categoria.nameCategory} </a> </td>
                    <td>${totalEgresos[categoria.nameCategory]}</td> 
                    
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <h2>Categoría de Transferencia</h2>
    <table border="1">
        <thead>
            <tr>
                <th>Nombre de Categoría</th>
                <th>Total</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="categoria" items="${transferencias}">
                <tr>
                    <td> <a href="ContabilidadController?ruta=showcategory&categoriaId=${categoria.idCategory}" >${categoria.nameCategory}</a> </td>
                    <td>${totalTransferencias[categoria.nameCategory]}</td> 
                    
                </tr>
            </c:forEach>
        </tbody>
    </table>
    
    <h2>Movimientos</h2>
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
                     <td> <a href="#" class="deleteMovement" data-id="${movimiento.idMovement}" data-nombre="${movimiento.concept}" >Eliminar</a> </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <br><br>
    <a href="ContabilidadController?ruta=showFormAccount" >Crear Cuenta(Falta controlar borrado en cascada)</a>
    <br><br>
    <a href="ContabilidadController?ruta=showFormCategory" >Crear Categoria</a>
    <a href="ContabilidadController?ruta=cerrarSesion">Cerrar Sesión</a>
    
    
    
    
    
    
    
    
    
    
    
    
    <script type="text/javascript">
    document.addEventListener("DOMContentLoaded", function() {
        document.querySelectorAll(".eliminarCuenta").forEach(function(eliminarLink) {
            eliminarLink.addEventListener("click", function(event) {
                event.preventDefault();
                
                var idCuenta = this.getAttribute("data-id");
                var nombreCuenta = this.getAttribute("data-nombre");
               
                
                var confirmacion = confirm("¿Desea eliminar esta cuenta: " + nombreCuenta + "?");
                
                if (confirmacion) {
                    // Redirige al controlador para eliminar la cuenta
                    window.location.href = "ContabilidadController?ruta=eliminarCuenta&idCuenta=" + idCuenta ;
                }
            });
        });
    });
    
    
    
    
    document.addEventListener("DOMContentLoaded", function() {
        document.querySelectorAll(".eliminarCategoria").forEach(function(eliminarLink) {
            eliminarLink.addEventListener("click", function(event) {
                event.preventDefault();
                
                var idCategoria = this.getAttribute("data-id");
                var nombreCategoria = this.getAttribute("data-nombre");
                
                var confirmacion = confirm("¿Desea eliminar esta categoría: " + nombreCategoria + "?");
                
                if (confirmacion) {
                    // Redirige al controlador para eliminar la categoría
                    window.location.href = "ContabilidadController?ruta=eliminarCategoria&idCategoria=" + idCategoria;
                }
            });
        });
    });
    
    
    document.addEventListener("DOMContentLoaded", function() {
        document.querySelectorAll(".deleteMovement").forEach(function(eliminarLink) {
            eliminarLink.addEventListener("click", function(event) {
                event.preventDefault();
                
                var idMovimiento = this.getAttribute("data-id");
                var conceptoMovimiento = this.getAttribute("data-nombre");
                var origen = "verDashboard";
                
                var confirmacion = confirm("¿Desea eliminar este movimiento: " + conceptoMovimiento + "?");
                
                if (confirmacion) {
                    // Redirige al controlador para eliminar la categoría
                    window.location.href = "ContabilidadController?ruta=deleteMovement&idMovimiento=" + idMovimiento + "&vistaOrigen=" + encodeURIComponent(origen);
                }
            });
        });
    });
    
    
</script>
    
    
    
    
    
</body>
</html>