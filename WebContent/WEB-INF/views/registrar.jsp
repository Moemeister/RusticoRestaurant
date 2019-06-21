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
		
		$("#ids").val("");
		$("#nom").val("");
		$("#ub").val("");
		$("#timeOp").val("");
		$("#timeCl").val("");
		$("#mesas").val("");
		$("#ge").val("");
		
		
	}
	
	
</script>
<button onclick="location.href='${pageContext.request.contextPath}/sucursales'" value="BACK">BACK</button>
<form:form action="${pageContext.request.contextPath}/savesucursal" method="post" modelAttribute="sucursal">

	<form:input id="ids" type="hidden" name="id" path="idSucursal" value="${sucursal.idSucursal}"/>
	<label>Nombre de Sucursal: </label>
	<form:input id="nom" type="text" name="nombre" path="sucursal" value="${sucursal.sucursal}"/><br>
	<form:errors path="sucursal" cssStyle="color:red;"></form:errors><br>
	
	<label>Ubicacion</label>
	<form:input id="ub" type="text" name="ubicacion" path="ubicacion"  value="${sucursal.ubicacion}"/><br>
	<form:errors path="ubicacion" cssStyle="color:red;"></form:errors><br>
	
	<label>Horario de Entrada</label>
	<form:input id="timeOp" type="time" name="hEntrada" path="open"  value="${sucursal.open}"/><br>
	<form:errors path="open" cssStyle="color:red;"></form:errors><br>
	
	<label>Horario de Salida</label>
	<form:input id="timeCl" type="time" name="hSalida" path="close" value="${sucursal.close}"/><br>
	<form:errors path="close" cssStyle="color:red;"></form:errors><br>
	
	<label>Cantidad de Mesas</label>
	<form:input id="mesas" type="number" name="nMesas" path="nMesas" value="${sucursal.nMesas}"/><br>
	<form:errors path="nMesas" cssStyle="color:red;"></form:errors><br>
	
	<label>Nombre del Gerente</label>
	<form:input id="ge" type="text" name="gerente" path="gerente" value="${sucursal.gerente}"/><br>
	<form:errors path="gerente" cssStyle="color:red;"></form:errors><br>
	<input type="submit" value="Agregar Sucursal"><br>
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
</form:form>
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
</body>
</html>