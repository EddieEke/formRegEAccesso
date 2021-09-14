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

            $(document).ready(function(){

                //ModifyAccount
                $("#button-username").click(function(){
                    console.log("button");
                    //username to valid
                    var count=0
                    if($("#usernameInput").val().match("^(?!^.{20})[.*\\S.*]")){
                        console.log("okusername0");
                        count++;
                        $("#usernameInput").removeClass("is-invalid");
                        console.log("okusername1");
                    }
                    else{
                        $("#usernameInput").addClass("is-invalid");
                        console.log("needs-validation");
                        $("#labelHidden").css("display","none");

                    }
                    console.log("stampo i count per la prima volta");
                    console.log("count =" +count);

                    $("#usernameInput").focus(function() {
                       $("#usernameTooltip").show();
                    });

                    $("#usernameInput").blur(function() {
                       $("#usernameTooltip").hide();
                    });

                    if(count>0){

                        //AJAX UPDATEACCOUNT------------
                        json ={
                            "value": $("#usernameInput").val(),
                        }
                        $.ajax({
                            type : "POST",
                            contentType : "application/json",
                            data : JSON.stringify(json),
                            url : "/updateAccount",
                            dataType : "json",
                            cache : !1,
                            success: function(res){
                                console.log(res.value);
                                count===0;
                                $("#usernameInput").addClass("is-invalid");
                                $(".invalid-feedback").text(res.value);
                                if(res.value==="Username modificato!"){
                                    $("#labelHidden").text(res.value);
                                    $("#usernameInput").removeClass("is-invalid");
                                    $("#labelHidden").css("display","initial");
                                }
                                if(res.value!=="Username modificato!"){
                                    $("#usernameInput").addClass("is-invalid");
                                    $("#labelHidden").css("display","none");
                                }
                            },
                            error: function (err){
                                console.log(err);
                                count=0;
                                $("#usernameInput").addClass("is-invalid");
                                $(".invalid-feedback").text("Errore del server");
                                $("#labelHidden").css("display","none");


                            }
                        });
                    }
                    else{

                    }
                });

                //DeleteAccount
                $("#buttonForDelete").click(function(){
                    //AJAX ACCESSO------------
                        json ={
                          "value": "",

                        }

                    $.ajax({
                        type : "POST",
                        contentType : "application/json",
                        data : JSON.stringify(json),
                        url : "/deleteAllData",
                        dataType : "json",
                        cache : !1,
                        success: function(res){
                            console.log(res.value);
                            if(res.value==="Account eliminato!"){
                                window.location = "/homePage";
                            }
                            else{
                                $("#labelerror2").show();
                                $("#labelerror2").text(res.value);
                            }
                        },
                        error: function (err){
                            console.log(err);
                            $("#labelerror2").show();
                            $("#labelerror2").text(err.value);
                        }
                    });
                });
            });
        </script>
        <style>


            a{
                color:#fff;
            }

            .left {
              font-size: 100%;
              margin-left: 107px;
              position: absolute;
              top: 50%;
              left: 28%;
              transform: translate(-50%, -50%);
              text-shadow: 0 0 30px rgb(0 0 0 / 50%);
              color: #fff;
              text-align: left;
              padding: 0;
              font-weight: 600;
              font-size: 40px;
              line-height: 1.1;
              font-weight: medium 500;
              letter-spacing: 0;
              font-family: 'Inter', sans-serif;
            }

            u,p{
                font-family: 'Inter', sans-serif !important;
            }
             img {
            opacity: 0.8; }

            /* Container holding the image and the text */
            .container {
              position: relative;
              text-align: center;
              color: black;
            }
            /* Top right text */
            .top-right {
              position: absolute;
              top: 8px;
              right: 16px;
            }

            /* Bottom right text */
            .bottom-right {
              position: absolute;
              bottom: 8px;
              right: 16px;
            }
            .btn{
                cursor: pointer;
                text-align: right;
                float: right;
                padding: 3px 15px;
                background: linear-gradient(#fff,#e3e3e3);
                border-color: #d6d6d6;
                color: #0070c9 !important;
                font-size: 12px;
                line-height: 1.33341;
                font-weight: 400;
                letter-spacing: -.01em;
                font-family: SF Pro Text,SF Pro Icons,Helvetica Neue,Helvetica,Arial,sans-serif;
                min-width: 20px;
                padding: 2px 10px;
                border-radius: 4px;
                cursor: pointer;
                display: inline-block;
                overflow: visible;
                vertical-align: inherit;
            }

            .first-col, .other-col{
                font-size:16px;
                margin: 0;
                padding-bottom: 2px;
                line-height: 1.42861;
                font-weight: 400;
                letter-spacing: -.016em;
                speak: none;
                font-variant: normal;
                text-transform: none;
                -webkit-font-smoothing: antialiased;
                text-rendering: optimizeLegibility;
                    -webkit-tap-highlight-color: rgba(0,0,0,0);

            }
            .first-col{
                font-size: 29px;
                width: 25%;
                color: #333 !important;

            }
            .other-col>.other-p{
                color: #666 !important;

            }

            .col-md-2{
                width: 25% !important;
                box-sizing: initial !important;
            }
            .header-p{
                margin:0;
                color: #333 ;
                margin-bottom:0;
            }


        </style>
    </HEAD>
    <BODY>

        <div class="pos-f-t">
          <div class="collapse" id="navbarToggleExternalContent">
            <div class="bg-dark p-4">
            <div class="navbar-nav">
              <a class="nav-item nav-link active" href="${pageContext.request.contextPath}/homePage">Home <span class="sr-only">(current)</span></a>
              <a class="nav-item nav-link active" href="${pageContext.request.contextPath}/accessPage">Accedi<span class="sr-only">(current)</span></a>
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
        <c:if test="${!msg}" >
            <div class="alert alert-warning alert-dismissible fade show">
                <strong>Errore!</strong> Devi prima effettuare l'accesso per poter visualizzare questa pagina
                <button type="button" class="close" data-dismiss="alert">&times;</button>
            </div>
        </c:if>
        <c:if test="${msg}" >
            <div class="container" style="margin:0px; padding-right: 0px;padding-left: 0px;">
                <img src="https://images.unsplash.com/photo-1579547116322-25caa6d089bc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=292&q=80"
                    style="width: 1400px; height: 170px; object-fit: fill;"/>
                <div class="left">
                    <p >${userAuthentication.user.name} ${userAuthentication.user.surname}</p>
                    <p style="font-size:50%">Il tuo ID è ${userAuthentication.email}</p>
                </div>
            </div>
            <br>
            <br>
            <br>
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-2 col-md-offset-2 first-col" style ="padding-left:0">
                        <p class="text-sm-left">Account</p>
                    </div>
                    <div class="col-md-2 other-col">
                        <p class="text-sm-left header-p">USER</p>
                        <p class="text-sm-left other-p " >${userAuthentication.username}</p>
                        <div class="collapse" id="collapseExample">
                            <input type="text" class="form-control" style=" border:1px solid #e6e6e6" maxlength="20" id="usernameInput" value="${userAuthentication.username}" required >
                            <button type="button" id="button-username"class="btn btn-info">Ok</button>
                            <div class="invalid-feedback " >
                                Inserire un username valido
                                <span id="usernameTooltip"class="d-inline-block help"  tabindex="0" data-toggle="tooltip" title="L'user deve avere un massimo di 20 lettere senza spazi">
                                <i disabled class="bi bi-info-circle" style="color:#dc3545;pointer-events: none;" ></i>
                                </span>
                            </div>
                            <p id="labelHidden" style="color:green;"></p>
                            <br>
                        </div>
                        <p class="text-sm-left header-p">EMAIL</p>
                        <p class="text-sm-left other-p">${userAuthentication.email}</p>
                        <p class="text-sm-left header-p">COMPLEANNO</p>
                        <p class="text-sm-left other-p">${userAuthentication.user.dateOfBirth}</p>
                        <p class="text-sm-left header-p">CITTA</p>
                        <p class="text-sm-left other-p">${userAuthentication.user.cityOfBirth} (${userAuthentication.user.countryOfBirth})</p>
                    </div>
                    <div class="col-md-2 other-col" >
                        <p class="text-sm-left header-p">RAGGIUNGIBILE A</p>
                        <p class="text-sm-left other-p">${userAuthentication.email}</p>
                    </div>
                    <div class="col-md-2 other-col" >
                        <p  id="pForbuttonModifyAccount">
                            <label id="labelerror" style="color:#dc3545 !important;    float:right;">
                            <button  id= "buttonModifyAccount" style="float:right;" class="btn btn-light text-center" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                                Modificare
                            </button>
                        </p>
                    </div>
                </div>
                <span style="color: #cccccc;">_________________________________________________________________________________________________________________________________________
                <br><br>
                <div class="row justify-content-center">
                    <div class="col-md-2 col-md-offset-2 first-col" style ="padding-left:0; float:left">
                        <p class="text-sm-left" >Sicurezza</p>
                    </div>
                    <div class="col-md-2 other-col">
                        <p class="text-sm-left header-p">PASSWORD</p>
                        <p class="text-sm-left other-p">${userAuthentication.password}</p>
                        <p class="text-sm-left header-p">TUOI ACCOUNT </p>
                            <c:forEach items="${listUA}" var="listUA">
                                <p class="text-sm-left header-p">${listUA.username}</p>
                            </c:forEach>
                    </div>
                    <div class="col-md-2 other-col" >
                        <p class="text-sm-left header-p">NUMERO DI TELEFONO AFFIDABILE</p>
                        <p class="text-sm-left other-p">${userAuthentication.telephone}</p>
                    </div>
                    <div class="col-md-2 other-col" >
                        <p class="text-center">
                        <button type="button" class="btn btn-light text-center" >Modificare</button>
                        </p>
                    </div>
                </div>
                <span style="color: #cccccc;">_________________________________________________________________________________________________________________________________________
                <br><br>
                <div class="row justify-content-center">
                    <div class="col-md-2 col-md-offset-2 first-col" style ="padding-left:0">
                        <p class="text-sm-left">Messaggi dal nostro sito</p>
                    </div>
                    <div class="col-md-5 other-col" style="padding:32px">
                        <p class="text-sm-left header-p" style="font-weight:650; color: #666";>ABBONAMENTI</p><br>
                        <p class="text-sm-left header-p" style="font-weight:500; color: #666; font-size:17px">Scegli le email che desideri ricevere da Apple</p>
                        <p class="text-sm-left other-p"></p>
                        <p class="text-sm-left header-p" style="font-size:14px font-weight:400;">Annunci:
                            <c:if test="${userAuthentication.subscription1}">
                                si
                                <svg xmlns="http://www.w3.org/2000/svg" style="color:#28a745" width="16" height="16" fill="currentColor" class="bi bi-check-lg" viewBox="0 0 16 16">
                                  <path d="M13.485 1.431a1.473 1.473 0 0 1 2.104 2.062l-7.84 9.801a1.473 1.473 0 0 1-2.12.04L.431 8.138a1.473 1.473 0 0 1 2.084-2.083l4.111 4.112 6.82-8.69a.486.486 0 0 1 .04-.045z"/>
                                </svg>
                                <p class="text-sm-left other-p" style="font-size:11px;">Stai ricevevendo annunci, consigli e aggiornamenti su prodotti, servizi e software</p>
                            </c:if>
                            <c:if test="${!userAuthentication.subscription1}">
                                no <svg xmlns="http://www.w3.org/2000/svg" style="color:#333; font-size: 0.73em; " width="9" height="9" fill="currentColor" class="bi bi-x-lg" viewBox="0 0 16 16">
                                     <path d="M1.293 1.293a1 1 0 0 1 1.414 0L8 6.586l5.293-5.293a1 1 0 1 1 1.414 1.414L9.414 8l5.293 5.293a1 1 0 0 1-1.414 1.414L8 9.414l-5.293 5.293a1 1 0 0 1-1.414-1.414L6.586 8 1.293 2.707a1 1 0 0 1 0-1.414z"/>
                                   </svg>
                                <p class="text-sm-left other-p" style="font-size:11px;">Non stai ricevevendo annunci, consigli e aggiornamenti su prodotti, servizi e software</p>
                            </c:if>
                        </p>
                        <p class="text-sm-left header-p" style="font-size:14px">App, Musica, TV e altro:
                            <c:if test="${userAuthentication.subscription2}">
                                si
                                <svg xmlns="http://www.w3.org/2000/svg" style="color:#28a745" width="16" height="16" fill="currentColor" class="bi bi-check-lg" viewBox="0 0 16 16">
                                  <path d="M13.485 1.431a1.473 1.473 0 0 1 2.104 2.062l-7.84 9.801a1.473 1.473 0 0 1-2.12.04L.431 8.138a1.473 1.473 0 0 1 2.084-2.083l4.111 4.112 6.82-8.69a.486.486 0 0 1 .04-.045z"/>
                                </svg>
                                <p class="text-sm-left other-p" style="font-size:11px;">Stai ottenendo nuove uscite, contenuti esclusivi, offerte speciali e consigli per app, musica, film, TV, libri, podcast e altro ancora</p>
                            </c:if>
                            <c:if test="${!userAuthentication.subscription2}">
                                no <svg xmlns="http://www.w3.org/2000/svg" style="color:#333; font-size: 0.73em; " width="9" height="9" fill="currentColor" class="bi bi-x-lg" viewBox="0 0 16 16">
                                     <path d="M1.293 1.293a1 1 0 0 1 1.414 0L8 6.586l5.293-5.293a1 1 0 1 1 1.414 1.414L9.414 8l5.293 5.293a1 1 0 0 1-1.414 1.414L8 9.414l-5.293 5.293a1 1 0 0 1-1.414-1.414L6.586 8 1.293 2.707a1 1 0 0 1 0-1.414z"/>
                                   </svg>
                                <p class="text-sm-left other-p" style="font-size:11px;">Non stai ottenendo nuove uscite, contenuti esclusivi, offerte speciali e consigli per app, musica, film, TV, libri, podcast e altro ancora</p>
                            </c:if>
                        </p>
                    </div>
                    <div class="col-md-2 other-col" >
                        <p class="text-center">
                        <button type="button" class="btn btn-light text-center" >Modificare</button>
                        </p>
                    </div>
                </div>
                <span style="color: #cccccc;">_________________________________________________________________________________________________________________________________________
                <br><br>
                <div class="row justify-content-center">
                    <div class="col-md-2 col-md-offset-2 first-col" style="float:left; padding-left: 0px; padding-right: 40px;">
                        <p class="text-sm-left" style ="padding-left:0">Dati e Privacy</p>
                    </div>
                    <div class="col-md-7 other-col" style="padding:0px">

                        <p class="text-sm-left other-p" style="font-weight:650; color: #666;">Cancella il tuo account  <i class="bi bi-trash"></i></p>
                        <p class="text-sm-left header-p" style="font-weight:500; color: #666; font-size:15px">Elimina definitivamente il tuo account e i dati associati da tutte le app e i servizi</p>
                        <p class="text-sm-left other-p"></p>
                        <p class="text-sm-left other-p" style="font-size:11px;">Per la tua sicurezza, verifichiamo tutte le richieste di cancellazione. Questo processo richiede fino a sette giorni.
                                                                                Il tuo account rimarrà attivo durante la verifica.</p>
                        <br><p class="text-center">
                            <button type="button" data-toggle="modal" data-target="#exampleModalDelete" class="btn btn-light text-center" style="float:left !important; font-weight:700;">Elimina</button>
                        </p><br><br><br><br><br>
                    </div>
                </div>
            </div>
        </c:if>
        <!-- Modal -->
        <div class="modal fade" id="exampleModalDelete" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="Font-family: SF Pro Text,SF Pro Icons,Helvetica Neue,Helvetica,Arial,sans-serif;">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Cancella il tuo account  <i class="bi bi-trash"></i></h5><br>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    </button>
                    </div>
                    <div class="modal-body">
                        Sei sicuro di eliminare il tuo account?
                        La cancellazione dell'account è permanente
                        <button id="buttonForDelete"type="button" class="btn btn-primary" style="color:#dc3545 !important; border-color:#dc3545">Elimina</button>
                        <label id="labelerror2"style="color:#dc3545 "></button>
                    </div>
                    <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal" style="color:gray !important;">Indietro</button>
                    </div>
                </div>
            </div>
        </div>
    </BODY>
</HTML>