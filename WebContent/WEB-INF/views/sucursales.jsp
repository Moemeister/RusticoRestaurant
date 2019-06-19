<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/new" method="post">
<input type="submit" value="Nueva Sucursal">
</form>
<table>
	<tr>
		<th>Nombre</th>
	</tr>
	<c:forEach items="${sucursal}" var="sucursal">
		<tr>
			<td>${sucursal.sucursal}</td>
			<td><form name="perfil" action="${pageContext.request.contextPath}/profile" method="post">
            		<input type="hidden" name="id" value="${sucursal.idSucursal}">
            		<input type="submit" value="Ver Perfil">
				</form>
			</td>
			<td>
				<form action="${pageContext.request.contextPath}/delete" method="post"> 
            		<input type="hidden" name="valorId" value="${sucursal.idSucursal}">
            		<input type="submit" class="delete_button" value="Eliminar">
				</form>
			</td>
			<td>
			<form name="editarSucursal" action="${pageContext.request.contextPath}/edit" method="post">
            		<input type="hidden" name="editId" value="${sucursal.idSucursal}">
            		<input type="Submit" value="Editar">
				</form>
			</td>
		</tr>
	</c:forEach>
</table>
</body> 
</html>