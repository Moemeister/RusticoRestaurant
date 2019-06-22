
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
		
		$("#ids").val("");
		$("#nom").val("");
		$("#ub").val("");
		$("#timeOp").val("");
		$("#timeCl").val("");
		$("#mesas").val("");
		$("#ge").val("");		
	}
</script>
<button class="btn btn-dark" style="margin:20px 30px 0;" onclick="location.href='${pageContext.request.contextPath}/sucursales'" value="BACK">REGRESAR</button>
<form:form action="${pageContext.request.contextPath}/savesucursal" method="post" modelAttribute="sucursal">
	<div class="form-group" style="margin: 0 auto;width:50%;border: 1px solid #FFF;border-radius:10px;padding:30px;">
	<form:input id="ids"  type="hidden" name="id" path="idSucursal" value="${sucursal.idSucursal}"/>
	<label>Nombre de Sucursal: </label>
	<form:input id="nom" class="form-control" type="text" name="nombre" path="sucursal" value="${sucursal.sucursal}"/>
	<form:errors path="sucursal" cssStyle="color:#AF503C;font-weight:normal;"></form:errors><br>
	
	<label>Ubicacion</label>
	<form:input id="ub" class="form-control" type="text" name="ubicacion" path="ubicacion"  value="${sucursal.ubicacion}"/>
	<form:errors path="ubicacion" cssStyle="color:#AF503C;font-weight:normal;"></form:errors><br>
	
	<label>Horario de Entrada</label>
	<form:input id="timeOp" class="form-control" type="time" name="hEntrada" path="open"  value="${sucursal.open}"/>
	<form:errors path="open" cssStyle="color:#AF503C;font-weight:normal;"></form:errors><br>
	
	<label>Horario de Salida</label>
	<form:input id="timeCl" class="form-control" type="time" name="hSalida" path="close" value="${sucursal.close}"/>
	<form:errors path="close" cssStyle="color:#AF503C;font-weight:normal;"></form:errors><br>
	
	<label>Cantidad de Mesas</label>
	<form:input id="mesas" class="form-control" type="number" name="nMesas" path="nMesas" value="${sucursal.nMesas}"/>
	<form:errors path="nMesas" cssStyle="color:#AF503C;font-weight:normal;"></form:errors><br>
	
	<label>Nombre del Gerente</label>
	<form:input id="ge" class="form-control" type="text" name="gerente" path="gerente" value="${sucursal.gerente}"/>
	<form:errors path="gerente" cssStyle="color:#AF503C;font-weight:normal;"></form:errors><br>
	
	<input type="submit" class="btn btn-dark" value="Agregar Sucursal"><br>
	
	
	<c:choose>
			<c:when test="${resultado==1}">
				<script type="text/javascript">
					limpiarCampos();
				</script>
				<script>
					swal("Sucursal Agregada con Éxito", {
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
	</div>
</form:form>

</body>
</html>