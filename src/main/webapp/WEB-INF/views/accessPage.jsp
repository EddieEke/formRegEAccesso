<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="java.util.*"%>

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
            //EVENTI------------






            // Example starter JavaScript for disabling form submissions if there are invalid fields
            (function () {
                'use strict'

                // Fetch all the forms we want to apply custom Bootstrap validation styles to
                var forms = document.querySelectorAll('.needs-validation')

                // Loop over them and prevent submission
                Array.prototype.slice.call(forms).forEach(function (form) {
                    form.addEventListener('submit', function (event) {
                        if (!form.checkValidity()) {
                            event.preventDefault()
                            event.stopPropagation()
                        }
                        form.classList.add('was-validated')
                    }, false)
                })
            });
            $(document).ready(function(){
                $("#sendForm").on("click", function(){
                    console.log("button form clicked");

                    $("#labelerror").hide();
                    var count =0;
                    //email to valid
                    if($("#email").val().match("^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$")){
                      count++;
                      $("#email").removeClass("is-invalid");
                      console.log("okemail");
                    }
                    else{
                      $("#email").addClass("is-invalid");
                      console.log("needs-validation");
                    }
                    //password to valid
                    if($("#password").val().match("^(?!^.{20})[^\s-]")){
                        count++;
                        $("#password").removeClass("is-invalid");
                        $(".bi-info-circle").css("color","#333");
                        console.log("okpassword");
                    }
                    else{
                        $("#password").addClass("is-invalid");
                        $(".bi-info-circle").css("color","#dc3545");
                        console.log("needs-validation");
                    }
                    if(count==2){



                        //AJAX ACCESSO------------
                          json ={
                              "value": $("#email").val()+ " " +$("#password").val(),

                            }

                        $.ajax({
                            type : "POST",
                            contentType : "application/json",
                            data : JSON.stringify(json),
                            url : "/accessDoing",
                            dataType : "json",
                            cache : !1,
                            success: function(res){
                                console.log(res);

                                if(res.value==="enterPage"){
                                    $("#labelerror").css("color","green ");
                                    $("#labelerror").html("Accesso alla pagina personale <svg xmlns='http://www.w3.org/2000/svg' style='color:#28a745' width='16' height='16' fill='currentColor' class='bi bi-check-lg' viewBox='0 0 16 16'><path d='M13.485 1.431a1.473 1.473 0 0 1 2.104 2.062l-7.84 9.801a1.473 1.473 0 0 1-2.12.04L.431 8.138a1.473 1.473 0 0 1 2.084-2.083l4.111 4.112 6.82-8.69a.486.486 0 0 1 .04-.045z'/></svg>");
                                    $("#labelerror").show();
                                    setTimeout(
                                        function() {
                                            window.location = "/myAccountPage";
                                        }, 3000
                                    );


                                }
                                else{
                                    $("#labelerror").show();
                                    $("#labelerror").text(res.value);
                                }
                            },
                            error: function (err){
                                console.log(err);

                                $("#labelerror").show();
                                $("#labelerror").text(err);
                            }
                        });
                    }
                    else{
                        $("#labelerror").show();
                    }

                });
            });

        </script>
            <style>


                .form-signin {
                    width: 100%;
                    max-width: 330px;
                    padding: 15px;
                    margin: 0 auto;
                }
                .form-signin .checkbox {
                    font-weight: 400;
                }
                .form-signin .form-control {
                    position: relative;
                    box-sizing: border-box;
                    height: auto;
                    padding: 10px;
                    font-size: 16px;
                }
                .form-signin .form-control:focus {
                    z-index: 2;
                }
                .form-signin input[type="email"] {
                    margin-bottom: -1px;
                    border-bottom-right-radius: 0;
                    border-bottom-left-radius: 0;
                }
                .form-signin input[type="password"] {
                    margin-bottom: 10px;
                    border-top-left-radius: 0;
                    border-top-right-radius: 0;
                }
                .title, small, button, #labelerror{
                    font-family: 'Inter', sans-serif;
                }
                .title{
                    font-size:2em !important;
                    font-weight:1000 !important;
                }
                .font-lighter-normal {
                    line-height: 100% !important;
                }
                button{
                    font-size:17px !important;
                    font-weight:500!important;
                }
                #labelerror{
                    color:#dc3545;
                }
                a{
                    color:#fff;
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
          <a class="nav-item nav-link active" href="${pageContext.request.contextPath}/myAccountPage">MyAccount<span class="sr-only">(current)</span></a>
          <a class="nav-item nav-link active" href="${pageContext.request.contextPath}/registrationPage">Registrati<span class="sr-only">(current)</span></a>
          <a class="nav-item nav-link active" href="${pageContext.request.contextPath}/logoutPage">Esci<span class="sr-only">(current)</span></a>
        </div>
        </div>
      </div>
      <nav class="navbar navbar-dark bg-dark">
        <button id="butNav" class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarToggleExternalContent" aria-controls="navbarToggleExternalContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
      </nav>
    </div>

        <br><br><br>
        <form class="form-signin font-weight-normal">
            <p class="h3 mb-3 title">Accedi</p><br><br>
            <div class="form-group ">
                 <label for="inputEmail" class="sr-only">Email address</label>
                 <input id="email" "type="text" id="inputEmail" class="form-control" placeholder="Email" required >
                 <div class="invalid-feedback">
                   Inserire un email valida
                   <span class="d-inline-block help" tabindex="0" data-toggle="tooltip" title="L'email deve avere un massimo di 30 caratteri ed essere in un formato valido">
                       <i disabled class="bi bi-info-circle" style="color:#dc3545;pointer-events: none;"></i>
                   </span>
                 </div>

            </div>
            <div class="form-group ">
                <label for="inputPassword" class="sr-only">Password</label>
                <input id="password" type="text" id="inputPassword" class="form-control" placeholder="Password" required>
                 <div class="invalid-feedback">
                   Inserire una password valida
                   <span class="d-inline-block help" tabindex="0" data-toggle="tooltip" title="La password deve avere un massimo di 20 lettere senza spazi">
                       <i disabled class="bi bi-info-circle" style="color:#dc3545;pointer-events: none;"></i>
                   </span>
                 </div>
            </div>
            <div class="checkbox mb-3 font-lighter-normal">
                 <small>
                     Il tuo indirizzo email serve per accedere al tuo account
                 </small>
            </div>
            <button class="btn btn-lg btn-primary btn-block" id ="sendForm" type="button">Sign In</button>
            <br>
            <label id="labelerror" style="color:#dc3545 !important">

            </label>
        </form>


    </BODY>
</HTML>