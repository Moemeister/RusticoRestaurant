<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
	function limpiarCampos(){
		
		$("#ide").val("");
		$("#nombre").val("");
		$("#edad").val("");
		$("#genero").val("");
		$("#status").val("");
	
		
		
	}
	
	
</script>
<%-- <button onclick="location.href='${pageContext.request.contextPath}/profile'" value="BACK">BACK</button>
 --%>
 <form action="${pageContext.request.contextPath}/profile" method="GET">
 <input type="hidden" name="proId" value="${sucursal.idSucursal}">
 		<input type="submit" value="Regresar">	
 </form>
<form:form id="formulario" action="${pageContext.request.contextPath}/saveEmp" method="post" modelAttribute="empleado">
	<form:input id="ide" type="hidden" name="idEmpleado" path="idEmpleado" value="${empleado.idEmpleado}"/>
	
	<label>Nombre del Empleado: </label>
	<form:input id="nombre" type="text" name="nombre" path="nombre" value="${empleado.nombre}"/><br>
	<form:errors path="nombre" cssStyle="color:red;"></form:errors><br>
	
	<label>Edad</label>
	<form:input id="edad" type="text" name="edad" path="edad"  value="${empleado.edad}"/><br>
	<form:errors path="edad" cssStyle="color:red;"></form:errors><br>
	
	<label>G&eacute;nero</label><br>
	<label>Masculino: </label>
	<form:radiobutton id="genero" name="genero" path="genero"  value="false"/>
	
	<label>Femenino: </label>
	<form:radiobutton id="genero" name="genero" path="genero"  value="true"/><br>
	<form:errors path="genero" cssStyle="color:red;"></form:errors><br>
	
	<label>Estado</label>
	
	<label>Activo</label>
	<form:radiobutton id="status" name="estado" path="estado" value="true"/><br>
	
	<label>Inactivo</label>
	<form:radiobutton id="status" name="estado" path="estado" value="false"/><br>
	<form:errors path="estado" cssStyle="color:red;"></form:errors><br>
	
	<input type="hidden" name="proId"  value="${sucursal.idSucursal}"/>
	<input type="submit" value="Agregar Sucursal">
	</form:form>
	<c:choose>
			<c:when test="${resultado==1}">
				<script type="text/javascript">
					limpiarCampos();
				</script>
				<span><b>El cliente fue guardado con &eacute;xito</b></span>
			</c:when>
			<c:when test="${resultado==0}">
				<span><b>Ocurrio un error al guardar al cliente</b></span>
			</c:when>
		</c:choose>


</body>
</html>