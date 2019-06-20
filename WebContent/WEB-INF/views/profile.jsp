<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
	<tr>
		<th>Nombre de Empleado</th>
	</tr>
	<c:forEach items="${empleado}" var="empleado">
		<tr>
			<td>${empleado.nombre}</td>
			
			<%-- <td>
			<form name="editarSucursal" action="${pageContext.request.contextPath}/edit" method="post">
            		<input type="hidden" name="editId" value="${sucursal.idSucursal}">
            		<input type="Submit" value="Editar">
				</form>
			</td> --%>
		</tr>
	</c:forEach>
	
</table>
</body>
</html>