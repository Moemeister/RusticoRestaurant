
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
		body{
		font-weight:bold;
		background-color: #A8A8A8; 
		}
	
	
	</style>
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
 <form style="margin:20px 30px 0;"action="${pageContext.request.contextPath}/profile" method="GET">
 <input type="hidden" name="proId" value="${sucursal.idSucursal}">
 		<input class="btn btn-dark" type="submit" value="Regresar">	
 </form>
<form:form class="form-group" id="formulario" action="${pageContext.request.contextPath}/saveEmp" method="post" modelAttribute="empleado">
	<div class="form-group" style="margin: 0 auto;width:50%;border: 1px solid #FFF;border-radius:10px;padding:30px;">
	<form:input id="ide" type="hidden" name="idEmpleado" path="idEmpleado" value="${empleado.idEmpleado}"/>
	
	<label>Nombre del Empleado: </label>
	<form:input id="nombre" class="form-control" type="text" name="nombre" path="nombre" value="${empleado.nombre}"/>
	<form:errors path="nombre" cssStyle="color:#AF503C;font-weight:normal;"></form:errors><br>
	
	<label>Edad</label>
	<form:input id="edad" class="form-control" type="number" name="edad" path="edad"  value="${empleado.edad}"/>
	<form:errors path="edad" cssStyle="color:#AF503C;font-weight:normal;"></form:errors><br><br>
	
	<label>G&eacute;nero</label><br>
	<label>Masculino </label>
	<form:radiobutton id="genero" name="genero" path="genero"  value="false"/>
	
	<label>Femenino </label>
	<form:radiobutton id="genero" name="genero" path="genero"  value="true"/><br>
	<form:errors path="genero" cssStyle="color:#AF503C;font-weight:normal;"></form:errors><br><br>
	
	<label>Estado</label><br>
	
	<label>Activo</label>
	<form:radiobutton id="status"  name="estado" path="estado" value="true"/>
	
	<label>Inactivo</label>
	<form:radiobutton id="status" name="estado" path="estado" value="false"/><br>
	<form:errors path="estado" cssStyle="color:#AF503C;font-weight:normal;"></form:errors><br>
	
	<input type="hidden" name="proId"  value="${sucursal.idSucursal}"/>
	<input type="submit" class="btn btn-dark" value="Agregar Sucursal">
	</div>
	</form:form>
	<c:choose>
			<c:when test="${resultado==1}">
				<script type="text/javascript">
					limpiarCampos();
				</script>
				<script>
					swal("Empleado Agregado", {
			 	    	icon: "success",
	 		   		});

				</script>
			</c:when>
			<c:when test="${resultado==0}">
				<script>
					swal("Información Inválida", {
			 	    	icon: "error",
	 		   		});

				</script>
			</c:when>
		</c:choose>


</body>
</html>