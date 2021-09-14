<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="java.util.*"%>

<!DOCTYPE html>
<HTML>
    <HEAD>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
    <style>

    </style>
    </HEAD>
    <BODY>

       <nav class="navbar navbar-toggleable-md navbar-light bg-faded">
		<a class="navbar-brand" href="${pageContext.request.contextPath}/homePage">Home</a>
    		<div class="collapse navbar-collapse" id="navbarSupportedContent">
    			<ul class="navbar-nav mr-auto">
    				<li class="nav-item">
    					<a class="nav-link" href="${pageContext.request.contextPath}/accessPage">Accedi</a>
    				</li>
    				<li class="nav-item">
    					<a class="nav-link" href="${pageContext.request.contextPath}/myAccountPage">MyAccount</a>
    				</li>
    				<li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/registrationPage">Registrati</a>
                    </li>
    				<li class="nav-item">
    					<a class="nav-link" href="${pageContext.request.contextPath}/logoutPage">Esci</a>
    				</li>
    			</ul>
    		</div>
    	</nav>

    </BODY>
</HTML>