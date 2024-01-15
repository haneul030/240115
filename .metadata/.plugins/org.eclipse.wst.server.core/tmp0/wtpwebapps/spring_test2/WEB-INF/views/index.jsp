<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<jsp:include page="layout/header.jsp"/>
<jsp:include page="layout/nav.jsp"/>

<div class="container my-3">
	<h3>index</h3>
</div>

<P> The time on the server is ${serverTime}. </P>

<jsp:include page="layout/footer.jsp"/>


