<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<HTML>
    <HEAD>
        <!-- Include jQuery -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

        <!-- Include Bootstrap -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

        <!-- Include Fonts -->
        <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300&display=swap" rel="stylesheet">
        <script>

        </script>
        <style>
                h1,p, a{
                    font-family: SF Pro Text,SF Pro Icons,Helvetica Neue,Helvetica,Arial,sans-serif;

                }
                a .btn{
                  font-size: 50px;

                }

                .center{
                    float:right;
                }

        </style>
    </HEAD>
    <BODY>
        <div class="pos-f-t">
          <div class="collapse" id="navbarToggleExternalContent">
            <div class="bg-dark p-4">
            <div class="navbar-nav">
              <a class="nav-item nav-link active" href="${pageContext.request.contextPath}/homePage">Home <span class="sr-only">(current)</span></a>
              <c:if test="${!msg}" >
                <a class="nav-item nav-link active" href="${pageContext.request.contextPath}/accessPage">Accedi<span class="sr-only">(current)</span></a>
              </c:if>
              <c:if test="${msg}" >
                <a class="nav-item nav-link active" href="${pageContext.request.contextPath}/myAccountPage">MyAccount<span class="sr-only">(current)</span></a>
              </c:if>
                <a class="nav-item nav-link active" href="${pageContext.request.contextPath}/registrationPage">Registrati<span class="sr-only">(current)</span></a>
              <c:if test="${msg}" >
                <a class="nav-item nav-link active" href="${pageContext.request.contextPath}/logoutPage">Esci<span class="sr-only">(current)</span></a>
              </c:if>
            </div>
            </div>
          </div>
          <nav class="navbar navbar-dark bg-dark">
            <button id="butNav" class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarToggleExternalContent" aria-controls="navbarToggleExternalContent" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
          </nav>
        </div>
        <br><br>
        <div class="row ">
            <div class="col-md-4">
                <h1 class="text-dark" style="color:#212529 !important">HomePage <c:if test="${msg}" > di ${userAuthentication.user.name}</c:if></p>
            </div>
        </div>
        <br><br><br>
        <a class="btn btn-default" style="border-color:gray; font-size: 20px;" href="${pageContext.request.contextPath}/accessPage">Accedi al sito</a>
        <c:if test="${msg}" >
            <a class="btn btn-default" style="border-color:gray; font-size: 20px;" href="${pageContext.request.contextPath}/myAccountPage">Mio Account</a>                    </div>
        </c:if>
        <a class="btn btn-default" style="border-color:gray; font-size: 20px;" href="${pageContext.request.contextPath}/registrationPage">Registrati</a>                    </div>
        <c:if test="${msg}" >
            <a class="btn btn-default" style="border-color:gray; font-size: 20px;" href="${pageContext.request.contextPath}/logoutPage">Fai il logout</a>
        </c:if>
    </BODY>
</HTML>