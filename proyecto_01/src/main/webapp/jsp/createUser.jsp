<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Crear un nuevo Usuario</title>
</head>
<body>
	<form method="POST" action="../ContabilidadController?ruta=createUser">
		<fieldset>
			<legend>
				<label>Nuevo Usuario</label>
				<label>Nombre:</label><br>
				<input type= "text" id = "nombre" name = "nombre"/> 
				
				<br><br>
				
				<label>Password:</label><br>
				<input type="password" id = "clave" name= "clave"/>
				
				<br><br>
				
				<input type="submit" value="Registrar"/>
			</legend>
		</fieldset>
	</form>
<a href="javascript:history.back()">Cancelar</a>

</body>
</html>