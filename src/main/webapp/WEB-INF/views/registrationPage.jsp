<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<HTML>
  <HEAD>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- Include Date Range Picker -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>
    <!-- Jquery Date Range Picker-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

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
      Array.prototype.slice.call(forms)
        .forEach(function (form) {
          form.addEventListener('submit', function (event) {
            if (!form.checkValidity()) {
              event.preventDefault()
              event.stopPropagation()
            }

            form.classList.add('was-validated')
        }, false)
      })
     })()

      //FORM SELECT dopo selezionati mettili opachi
      function changeOpacityCountryOfBirth(){
        document.getElementById("countryOfBirth").style.opacity = "1";
        document.getElementById("countryOfBirth").style.border = "1px solid #ced4da";
      }

    //Subscribtion

    //false di default
    $('.form-check-input').val('false');

    //EVENTI AVVIO
    $(document).ready(function(){

          $("#labelerror").hide();


          //FORM SELECT dopo selezionati mettili opachi
          if (!$("#countryOfBirth").val("Paese di nascita") ){
             changeOpacityCountryOfBirth();
          }



          //<!-- Date Range Picker -->
          var date_input=$('input[name="dateOfBirth"]'); //our date input has the name "date"
          var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
          var options={
            format: 'dd/mm/yyyy',
            container: container,
            todayHighlight: !0,
            autoclose: !0,
          };
          date_input.datepicker(options);



          //Controllo del button
          $("#sendForm").on("click", function(){
            var count =0;

            //name to valid
            if($("#name").val().match("^[A-Za-z]{1,20}$")){
                count++;
                $("#name").removeClass("is-invalid");
                console.log("okname");
            }
            else{
                $("#name").addClass("is-invalid");
                console.log("needs-validation");
            }
            //surname to valid
            if($("#surname").val().match("^[A-Za-z]{1,20}$")){
                count++;
                $("#surname").removeClass("is-invalid");
                console.log("oksurname");
            }
            else{
                $("#surname").addClass("is-invalid");
                console.log("needs-validation");
            }
            //dateOfBirth to valid
            if($("#dateOfBirth").data('datepicker').getFormattedDate('yyyy-mm-dd').match("[^\s-]")){
                count++;
                $("#dateOfBirth").removeClass("is-invalid");
                console.log("okdateOfBirth");
            }
            else{
                $("#dateOfBirth").addClass("is-invalid");
                console.log("needs-validation");
            }
            //countryOfBirth to valid
            if($("#countryOfBirth").val()){
                count++;
                console.log($("#countryOfBirth").val());
                $("#countryOfBirth").removeClass("is-invalid");
                console.log("okcountryOfBirth");
            }
            else{
                $("#countryOfBirth").addClass("is-invalid");
                console.log("needs-validation2");
            }
            //cityOfBirth to valid
            if($("#cityOfBirth").val().match("^.{1,20}$")){
                count++;
                $("#cityOfBirth").removeClass("is-invalid");
                console.log("okcityOfBirth");
            }
            else{
                $("#cityOfBirth").addClass("is-invalid");
                console.log("needs-validation");
            }

            //fiscalCode to valid
            if($("#fiscalCode").val().match("^([A-Z]{6}[0-9LMNPQRSTUV]{2}[ABCDEHLMPRST]{1}[0-9LMNPQRSTUV]{2}[A-Z]{1}[0-9LMNPQRSTUV]{3}[A-Z]{1})$|([0-9]{16})$")){
                count++;
                $("#fiscalCode").removeClass("is-invalid");
                console.log("okfiscalCode");
            }
            else{
                $("#fiscalCode").addClass("is-invalid");
                console.log("needs-validation");
            }
            //username to valid
            if($("#username").val().match("^\\S+$")){
                count++;
                $("#username").removeClass("is-invalid");
                console.log("okusername");
            }
            else{
                $("#username").addClass("is-invalid");
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

            //telephone to valid
            if($("#telephone").val().match("^(?=.{1,20}$)[0-9]*$")){
                count++;
                $("#telephone").removeClass("is-invalid");
                console.log("oktelephone");
            }
            else{
                $("#telephone").addClass("is-invalid");
                console.log("needs-validation");
            }
            console.log("count e' " + count);


           if(count==10){
                //Gender Value Control
                var genderForjson = "";
                if($('#gender1').prop('checked')){
                    genderForjson = $('#labelgender1').text();
                   }
                if($('#gender2').prop('checked')){
                    genderForjson = $('#labelgender2').text();
                    }
                console.log("gender is "+ genderForjson);


                //Sub1&2 Value Control
                var sub1ForJson=!1;
                var sub2ForJson=!1;
                if($('#flexCheckDefault').prop('checked')){
                    sub1ForJson = !0;
                }
                if($('#flexCheckChecked').prop('checked')){
                    sub2ForJson = !0;
                }
                console.log(sub1ForJson);
                console.log(sub2ForJson);


                //AJAX REGISTRAZIONE------------
                  json ={
                      "name": $("#name").val(),
                      "surname": $("#surname").val(),
                      "gender": genderForjson,
                      "fiscalCode": $("#fiscalCode").val(),
                      "dateOfBirth": $("#dateOfBirth").data('datepicker').getFormattedDate('yyyy-mm-dd'),
                      "countryOfBirth": $("#countryOfBirth").val(),
                      "cityOfBirth": $("#cityOfBirth").val(),
                       "userAuthenticationList": [
                            {
                          "username": $("#username").val(),
                          "email": $("#email").val(),
                          "password": $("#password").val(),
                          "telephone": $("#telephone").val(),
                          "subscription1": sub1ForJson,
                          "subscription2": sub2ForJson
                        }
                    ]
                }

                $.ajax({
                    type : "POST",
                    contentType : "application/json",
                    data : JSON.stringify(json),
                    url : "/registrationDoing",
                    dataType : "json",
                    cache : !1,
                    success: function(res){
                        console.log(res);
                        window.location = "/homePage";
                    },
                    error: function (res){
                        console.log(res);
                        $("#labelerror").show();
                        $("#labelerror").text("Errore prova a ricontrollare il codice fiscale, prova un altro username o una altra email");
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
        .vertical-center {
             background:white;
             display: flex;
             margin: 10px auto;
             justify-content: center;
            }


         .form-control::placeholder { /* Chrome, Firefox, Opera, Safari 10.1+ */

            opacity: 0.5; /* Firefox */
            }
         #dateOfBirth::placeholder {
         font-size: 15px;
            }

        small{ /* Chrome, Firefox, Opera, Safari 10.1+ */

            opacity: 0.8; /* Firefox */
        }
        .form-control {
            display: initial ;
            width: 90%;
            color:#333 !important;
                    }
        .form-group{
        border-width: 1px solid;
        color:#333 !important;
         }

        select {
        opacity: 0.5; /* Firefox */
           -webkit-appearance: none;
           -moz-appearance: none;
           appearance: none;       /* Remove default arrow */
        }
        * {
            margin:0;
            padding:0;
        }
        hr {
            margin-top: 30px;
            /*so you can see it in demo */
            width: 100%
        }
        .demo{
            position: relative; /*so I could use 'top: 30px' */
            top: 30px;
            /*so you can see it in demo*/
            width: 100%;
            border-top:1px solid black;
        }
        select.form-control {
                    display: block;
                    width: 90%;
                    height: calc(1.5em + .75rem + 2px);
                    padding: .375rem .75rem;
                    font-size: 1rem;
                    font-weight: 400;
                    line-height: 1.5;
                    color: #495057;
                    background-color: #fff;
                    background-clip: padding-box;
                    border-radius: .25rem;
                    transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
        }

         img {
        opacity: 0.85; }

        /* Container holding the image and the text */
        .container {
          position: relative;
          text-align: center;
          color: white;
        }

        /* Bottom left text */
        .bottom-left {
          position: absolute;
          bottom: 8px;
          left: 16px;
        }

        /* Top left text */
        .top-left {
          position: absolute;
          top: 8px;
          left: 16px;
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

        /* Centered text */
        .centered {
          font-size: 100%;
          position: absolute;
          top: 50%;
          left: 58%;
          transform: translate(-50%, -50%);
          text-shadow: 0 0 30px rgb(0 0 0 / 50%);
          color: #fff;
          text-align: center;
          padding: 0;
          margin: 0;
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

        .help{cursor: help;}

        .gray{color: #495057 ;}

        .form-group1{
            border-width: thin;
            width: 300px;
        }


          .bg-dark, .nav-item, .bg-dark, .p-4{
         color:#fff;

        }

        a{
         color:#fff;
        }

        br{
            z-index: 2;
            background-color: #fff;
            opacity: 0.9;
            position: absolute;
            top: 44px;
            height: 61px;
            width: 100%;
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
          <a class="nav-item nav-link active" href="${pageContext.request.contextPath}/registrationPage">Registrati<span class="sr-only">(current)</span></a>
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


    <div class="container" style="margin:0px; padding-right: 0px;padding-left: 0px;">
            <img src="https://images.unsplash.com/photo-1579547944064-0180251f94c8?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=292&q=80"
                style="width: 1400px; height: 170px; object-fit: fill;"/>
            <div class="centered">
                <p >Crea il tuo Account</p>
            </div>
    </div>


    <div class="jumbotron vertical-center">
        <form>

            <!-- Name input -->
            <div class="form-group ">
                <input type="name" maxlength="20" class="form-control " id="name" placeholder="Nome" required >
                <div class="invalid-feedback">
                  Inserire un nome valido
                  <span class="d-inline-block help" tabindex="0" data-toggle="tooltip" title="Il nome deve avere un massimo di 20 lettere senza numeri ne simboli">
                      <i disabled class="bi bi-info-circle" style="color:#dc3545;pointer-events: none;"></i>
                  </span>
                </div>

                <small id="messageName" class="text-muted" >
                </small>
            </div>

            <!-- Surname input -->
            <div class="form-group ">
                 <input type="text" maxlength="20" class="form-control" id="surname" placeholder="Cognome" required >
                <div class="invalid-feedback">
                  Inserire un cognome valido
                  <span class="d-inline-block help" tabindex="0" data-toggle="tooltip" title="Il cognome deve avere un massimo di 20 lettere senza numeri ne simboli">
                      <i disabled class="bi bi-info-circle" style="color:#dc3545;pointer-events: none;"></i>
                  </span>
                </div>
            </div>

            <!-- Gender input -->
            <div class="form-group">
                <div class="custom-control custom-radio custom-control-inline">
                  <input  class="custom-control-input" type="radio" name="customRadioInline" id="gender1" checked>
                  <label id="labelgender1" class="custom-control-label" for="gender1">M</label>
                </div>
                <div class="custom-control custom-radio custom-control-inline">
                  <input class="custom-control-input" type="radio"  name="customRadioInline" id="gender2" >
                  <label id="labelgender2" class="custom-control-label" for="gender2">F</label>
                </div>
            </div>

            <!-- DateOfBirth input -->
            <div class="form-group">
                <input class="form-control" id="dateOfBirth" name="dateOfBirth" maxlength="20" placeholder="Data di nascita   dd/mm/yyyy" type="text" required/>
                <div class="invalid-feedback">
                  Inserire la data di nascita valida
                  <span class="d-inline-block help" tabindex="0" data-toggle="tooltip" title="Selezionare una data nel formato dd/mm/yyyy">
                      <i disabled class="bi bi-info-circle" style="color:#dc3545;pointer-events: none;"></i>
                  </span>
                </div>
            </div>
            <!-- CountryOfBirth input -->
            <div class="form-group">
                <select  class="form-control" id="countryOfBirth" aria-label="Default select example" onchange="changeOpacityCountryOfBirth()" required>
                  <option  selected selected="selected" disabled>Paese di nascita</option>
                     <option value = "Afganistan" > Afghanistan </option>
                     <option value = "Albania" > Albania </option>
                     <option value = "Algeria" > Algeria </option>
                     <option value = "Samoa americane" > Samoa americane </option>
                     <option value = "Andorra" > Andorra </option>
                     <option value = "Angola" > Angola </option>
                     <option value = "Anguilla" > Anguilla </option>
                     <option value = "Antigua e Barbuda" > Antigua e Barbuda </option>
                     <option value = "Argentina" > Argentina </option>
                     <option value = "Armenia" > Armenia </option>
                     <option value = "Aruba" > Aruba </option>
                     <option value = "Australia" > Australia </option>
                     <option value = "Austria" > Austria </option>
                     <option value = "Azerbaigian" > Azerbaigian </option>
                     <option value = "Bahamas" > Bahamas </option>
                     <option value = "Bahrain" > Bahrein </option>
                     <option value = "Bangladesh" > Bangladesh </option>
                     <option value = "Barbados" > Barbados </option>
                     <option value = "Bielorussia" > Bielorussia </option>
                     <option value = "Belgio" > Belgio </option>
                     <option value = "Belize" > Belize </option>
                     <option value = "Benin" > Benin </option>
                     <option value = "Bermuda" > Bermuda </option>
                     <option value = "Bhutan" > Bhutan </option>
                     <option value = "Bolivia" > Bolivia </option>
                     <option value = "Bonaire" > Bonaire </option>
                     <option value = "Bosnia ed Erzegovina" > Bosnia ed Erzegovina </option>
                     <option value = "Botswana" > Botswana </option>
                     <option value = "Brasile" > Brasile </option>
                     <option value = "British Indian Ocean Ter" > British Indian Ocean Ter </option>
                     <option value = "Brunei" > Brunei </option>
                     <option value = "Bulgaria" > Bulgaria </option>
                     <option value = "Burkina Faso" > Burkina Faso </option>
                     <option value = "Burundi" > Burundi </option>
                     <option value = "Cambogia" > Cambogia </option>
                     <option value = "Camerun" > Camerun </option>
                     <option value = "Canada" > Canada </option>
                     <option value = "Isole Canarie" > Isole Canarie </option>
                     <option value = "Capo Verde" > Capo Verde </option>
                     <option value = "Isole Cayman" > Isole Cayman </option>
                     <option value = "Repubblica Centrafricana" > Repubblica Centrafricana </option>
                     <option value = "Ciad" > Ciad </option>
                     <option value = "Isole del Canale" > Isole del Canale </option>
                     <option value = "Cile" > Cile </option>
                     <option value = "Cina" > Cina </option>
                     <option value = "Isola di Natale" > Isola di Natale </option>
                     <option value = "Cocos Island" > Cocos Island </option>
                     <option value = "Colombia" > Colombia </option>
                     <option value = "Comore" > Comore </option>
                     <option value = "Congo" > Congo </option>
                     <option value = "Isole Cook" > Isole Cook </option>
                     <option value = "Costa Rica" > Costa Rica </option>
                     <option value = "Costa D'Avorio" > Cote D'Avorio </option>
                     <option value = "Croazia" > Croazia </option>
                     <option value = "Cuba" > Cuba </option>
                     <option value = "Curaco" > Curaçao </option>
                     <option value = "Cipro" > Cipro </option>
                     <option value = "Repubblica Ceca" > Repubblica Ceca </option>
                     <option value = "Danimarca" > Danimarca </option>
                     <option value = "Gibuti" > Gibuti </option>
                     <option value = "Dominica" > Dominica </option>
                     <option value = "Repubblica Dominicana" > Repubblica Dominicana </option>
                     <option value = "Timor Est" > Timor Est </option>
                     <option value = "Ecuador" > Ecuador </option>
                     <option value = "Egitto" > Egitto </option>
                     <option value = "El Salvador" > El Salvador </option>
                     <option value = "Guinea Equatoriale" > Guinea Equatoriale </option>
                     <option value = "Eritrea" > Eritrea </option>
                     <option value = "Estonia" > Estonia </option>
                     <option value = "Etiopia" > Etiopia </option>
                     <option value = "Isole Falkland" > Isole Falkland </option>
                     <option value = "Isole Faroe" > Isole Faroe </option>
                     <option value = "Fiji" > Figi </option>
                     <option value = "Finlandia" > Finlandia </option>
                     <option value = "Francia" > Francia </option>
                     <option value = "Guiana francese" > Guyana francese </option>
                     <option value = "Polinesia Francese" > Polinesia Francese </option>
                     <option value = "French Southern Ter" > French Southern Ter </option>
                     <option value = "Gabon" > Gabon </option>
                     <option value = "Gambia" > Gambia </option>
                     <option value = "Georgia" > Georgia </option>
                     <option value = "Germania" > Germania </option>
                     <option value = "Ghana" > Ghana </option>
                     <option value = "Gibilterra" > Gibilterra </option>
                     <option value = "Gran Bretagna" > Gran Bretagna </option>
                     <option value = "Grecia" > Grecia </option>
                     <option value = "Groenlandia" > Groenlandia </option>
                     <option value = "Grenada" > Grenada </option>
                     <option value = "Guadalupa" > Guadalupa </option>
                     <option value = "Guam" > Guam </option>
                     <option value = "Guatemala" > Guatemala </option>
                     <option value = "Guinea" > Guinea </option>
                     <option value = "Guyana" > Guyana </option>
                     <option value = "Haiti" > Haiti </option>
                     <option value = "Hawaii" > Hawaii </option>
                     <option value = "Honduras" > Honduras </option>
                     <option value = "Hong Kong" > Hong Kong </option>
                     <option value = "Ungheria" > Ungheria </option>
                     <option value = "Islanda" > Islanda </option>
                     <option value = "Indonesia" > Indonesia </option>
                     <option value = "India" > India </option>
                     <option value = "Iran" > Iran </option>
                     <option value = "Iraq" > Iraq </option>
                     <option value = "Irlanda" > Irlanda </option>
                     <option value = "Isola di Man" > Isola di Man </option>
                     <option value = "Israele" > Israele </option>
                     <option value = "Italia" > Italia </option>
                     <option value = "Giamaica" > Giamaica </option>
                     <option value = "Giappone" > Giappone </option>
                     <option value = "Giordania" > Giordania </option>
                     <option value = "Kazakistan" > Kazakistan </option>
                     <option value = "Kenya" > Kenia </option>
                     <option value = "Kiribati" > Kiribati </option>
                     <option value = "Corea del Nord" > Corea del Nord </option>
                     <option value = "Corea del Sud" > Corea del Sud </option>
                     <option value = "Kuwait" > Kuwait </option>
                     <option value = "Kyrgyzstan" > Kirghizistan </option>
                     <option value = "Laos" > Laos </option>
                     <option value = "Lettonia" > Lettonia </option>
                     <option value = "Libano" > Libano </option>
                     <option value = "Lesotho" > Lesotho </option>
                     <option value = "Liberia" > Liberia </option>
                     <option value = "Libia" > Libia </option>
                     <option value = "Liechtenstein" > Liechtenstein </option>
                     <option value = "Lituania" > Lituania </option>
                     <option value = "Lussemburgo" > Lussemburgo </option>
                     <option value = "Macao" > Macao </option>
                     <option value = "Macedonia" > Macedonia </option>
                     <option value = "Madagascar" > Madagascar </option>
                     <option value = "Malesia" > Malesia </option>
                     <option value = "Malawi" > Malawi </option>
                     <option value = "Maldive" > Maldive </option>
                     <option value = "Mali" > Mali </option>
                     <option value = "Malta" > Malta </option>
                     <option value = "Isole Marshall" > Isole Marshall </option>
                     <option value = "Martinica" > Martinica </option>
                     <option value = "Mauritania" > Mauritania </option>
                     <option value = "Mauritius" > Mauritius </option>
                     <option value = "Mayotte" > Mayotte </option>
                     <option value = "Messico" > Messico </option>
                     <option value = "Isole intermedie" > Isole intermedie </option>
                     <option value = "Moldavia" > Moldavia </option>
                     <option value = "Monaco" > Monaco </option>
                     <option value = "Mongolia" > Mongolia </option>
                     <option value = "Monserrat" > Montserrat </option>
                     <option value = "Marocco" > Marocco </option>
                     <option value = "Mozambico" > Mozambico </option>
                     <option value = "Myanmar" > Myanmar </option>
                     <option value = "Nambia" > Nambia </option>
                     <option value = "Nauru" > Nauru </option>
                     <option value = "Nepal" > Nepal </option>
                     <option value = "Antille Olandesi" > Antille Olandesi </option>
                     <option value = "Paesi Bassi" > Paesi Bassi (Olanda, Europa) </option>
                     <option value = "Nevis" > Nevis </option>
                     <option value = "Nuova Caledonia" > Nuova Caledonia </option>
                     <option value = "Nuova Zelanda" > Nuova Zelanda </option>
                     <option value = "Nicaragua" > Nicaragua </option>
                     <option value = "Niger" > Niger </option>
                     <option value = "Nigeria" > Nigeria </option>
                     <option value = "Niue" > Niue </option>
                     <option value = "Norfolk Island" > Norfolk Island </option>
                     <option value = "Norvegia" > Norvegia </option>
                     <option value = "Oman" > Oman </option>
                     <option value = "Pakistan" > Pakistan </option>
                     <option value = "Isola di Palau" > Isola di Palau </option>
                     <option value = "Palestina" > Palestina </option>
                     <option value = "Panama" > Panama </option>
                     <option value = "Papua Nuova Guinea" > Papua Nuova Guinea </option>
                     <option value = "Paraguay" > Paraguay </option>
                     <option value = "Perù" > Perù </option>
                     <option value = "Filippine" > Filippine </option>
                     <option value = "Isola Pitcairn" > Isola Pitcairn </option>
                     <option value = "Polonia" > Polonia </option>
                     <option value = "Portogallo" > Portogallo </option>
                     <option value = "Porto Rico" > Porto Rico </option>
                     <option value = "Qatar" > Qatar </option>
                     <option value = "Repubblica del Montenegro" > Repubblica del Montenegro </option>
                     <option value = "Repubblica di Serbia" > Repubblica di Serbia </option>
                     <option value = "Riunione" > Riunione </option>
                     <option value = "Romania" > Romania </option>
                     <option value = "Russia" > Russia </option>
                     <option value = "Ruanda" > Ruanda </option>
                     <option value = "San Bartolomeo" > San Bartolomeo </option>
                     <option value = "St Eustatius" > St Eustatius </option>
                     <option value = "Sant'Elena" > Sant'Elena </option>
                     <option value = "St Kitts-Nevis" > St Kitts-Nevis </option>
                     <option value = "Santa Lucia" > Santa Lucia </option>
                     <option value = "St Maarten" > St Maarten </option>
                     <option value = "St Pierre & Miquelon" > St Pierre & Miquelon </option>
                     <option value = "St Vincent e Grenadine" > Saint Vincent e Grenadine </option>
                     <option value = "Saipan" > Saipan </option>
                     <option value = "Samoa" > Samoa </option>
                     <option value = "Samoa americana" > Samoa americana </option>
                     <option value = "San Marino" > San Marino </option>
                     <option value = "Sao Tome e Principe" > Sao Tome e Principe </option>
                     <option value = "Arabia Saudita" > Arabia Saudita </option>
                     <option value = "Senegal" > Senegal </option>
                     <option value = "Seychelles" > Seychelles </option>
                     <option value = "Sierra Leone" > Sierra Leone </option>
                     <option value = "Singapore" > Singapore </option>
                     <option value = "Slovacchia" > Slovacchia </option>
                     <option value = "Slovenia" > Slovenia </option>
                     <option value = "Isole Salomone" > Isole Salomone </option>
                     <option value = "Somalia" > Somalia </option>
                     <option value = "Sud Africa" > Sud Africa </option>
                     <option value = "Spagna" > Spagna </option>
                     <option value = "Sri Lanka" > Sri Lanka </option>
                     <option value = "Sudan" > Sudan </option>
                     <option value = "Suriname" > Suriname </option>
                     <option value = "Swaziland" > Swaziland </option>
                     <option value = "Svezia" > Svezia </option>
                     <option value = "Svizzera" > Svizzera </option>
                     <option value = "Siria" > Siria </option>
                     <option value = "Tahiti" > Tahiti </option>
                     <option value = "Taiwan" > Taiwan </option>
                     <option value = "Tagikistan" > Tagikistan </option>
                     <option value = "Tanzania" > Tanzania </option>
                     <option value = "Thailandia" > Thailandia </option>
                     <option value = "Togo" > Togo </option>
                     <option value = "Tokelau" > Tokelau </option>
                     <option value = "Tonga" > Tonga </option>
                     <option value = "Trinidad e Tobago" > Trinidad e Tobago </option>
                     <option value = "Tunisia" > Tunisia </option>
                     <option value = "Turchia" > Turchia </option>
                     <option value = "Turkmenistan" > Turkmenistan </option>
                     <option value = "Turks & Caicos Is" > Turks & Caicos Is </option>
                     <option value = "Tuvalu" > Tuvalu </option>
                     <option value = "Uganda" > Uganda </option>
                     <option value = "Regno Unito" > Regno Unito </option>
                     <option value = "Ucraina" > Ucraina </option>
                     <option value = "Erimati Arabi Uniti" > Emirati Arabi Uniti </option>
                     <option value = "Stati Uniti d'America" > Stati Uniti d'America </option>
                     <option value = "Uraguay" > Uruguay </option>
                     <option value = "Uzbekistan" > Uzbekistan </option>
                     <option value = "Vanuatu" > Vanuatu </option>
                     <option value = "Stato della Città del Vaticano" > Stato della Città del Vaticano </option>
                     <option value = "Venezuela" > Venezuela </option>
                     <option value = "Vietnam" > Vietnam </option>
                     <option value = "Isole Vergini (Brit)" > Isole Vergini (Brit) </option>
                     <option value = "Isole Vergini (USA)" > Isole Vergini (USA) </option>
                     <option value = "Wake Island" > Wake Island </option>
                     <option value = "Wallis e Futana è" > Wallis e Futana è </option>
                     <option value = "Yemen" > Yemen </option>
                     <option value = "Zaire" > Zaire </option>
                     <option value = "Zambia" > Zambia </option>
                     <option value = "Zimbabwe" > Zimbabwe </option>

                </select>
                <div class="invalid-feedback">
                  Selezionare un paese dalla lista
                </div>
            </div>
            <br>

            <!-- CityOfBirth input -->
            <div class="form-group ">
                 <input type="text" class="form-control" id="cityOfBirth" maxlength="20" placeholder="Città di nascita" required >
                <div class="invalid-feedback">
                  Inserire una città valida
                  <span class="d-inline-block help" tabindex="0" data-toggle="tooltip" title="La città deve avere un massimo di 20 lettere">
                      <i disabled class="bi bi-info-circle" style="color:#dc3545;pointer-events: none;"></i>
                  </span>
                </div>
            </div>
            <!-- FiscalCode input -->
            <div class="form-group ">
                 <input type="text" class="form-control" id="fiscalCode" maxlength="16" placeholder="Codice Fiscale" required >
                <div class="invalid-feedback">
                  Inserire un codice fiscale valido
                  <span class="d-inline-block help" tabindex="0" data-toggle="tooltip" title="Il codice fiscale deve essere in un formato valido senza spazi">
                      <i disabled class="bi bi-info-circle" style="color:#dc3545;pointer-events: none;"></i>
                  </span>
                </div>
            </div>
                <span style="color: #cccccc;">________________________________________
               </span><br><br>
            <!-- Username input -->
            <div class="form-group ">
                 <input type="text" class="form-control" maxlength="20" id="username" placeholder="Username" required >
                <div class="invalid-feedback">
                  Inserire un username valido
                  <span class="d-inline-block help" tabindex="0" data-toggle="tooltip" title="L'user deve avere un massimo di 20 lettere senza spazi">
                      <i disabled class="bi bi-info-circle" style="color:#dc3545;pointer-events: none;"></i>
                  </span>
                </div>
            </div>
            <!-- Password input -->
            <div class="form-group">
                <input type="text" class="form-control" maxlength="20" id="password" autocomplete="on" aria-describedby="passwordHelpInline" placeholder="Password" required >
                <span class="d-inline-block help gray" tabindex="0" data-toggle="tooltip" title="La password deve avere un massimo di 20 lettere senza spazi">
                    <i disabled class="bi bi-info-circle" style="pointer-events: none;"></i>
                </span>
                <div class="invalid-feedback">
                  Inserire una password valida
                </div>
            </div>
            <!-- Email input -->
            <div class="form-group ">
                 <input type="email" class="form-control" maxlength="30" id="email" placeholder="Email" required >
                <div class="invalid-feedback">
                  Inserire un email valida
                  <span class="d-inline-block help" tabindex="0" data-toggle="tooltip" title="L'email deve avere un massimo di 30 caratteri ed essere in un formato valido">
                      <i disabled class="bi bi-info-circle" style="color:#dc3545;pointer-events: none;"></i>
                  </span>
                </div>
            </div>

            <span style="color: #cccccc;">________________________________________
                                       </span><br><br>
             <!-- Telephone input -->
            <div class="form-group ">
                 <input type="tel" class="form-control" maxlength="20" id="telephone" placeholder="Telefono" required >
                 <div class="invalid-feedback">
                    Inserire un telefono valido
                    <span class="d-inline-block help" tabindex="0" data-toggle="tooltip" title="Il telefono deve avere 20 numeri senza spazio">
                        <i disabled class="bi bi-info-circle" style="color:#dc3545;pointer-events: none;"></i>
                    </span>
                 </div>
            </div>

            <span style="color: #cccccc;">________________________________________
                           </span><br><br>

            <!-- SubscriptionOne input -->
            <div class="form-check">
              <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
              <label class="form-check-label" for="flexCheckDefault">
                Annunci
              </label>
            </div>

            <!-- SubscriptionTwo input -->
            <div class="form-check">
              <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked" checked>
              <label class="form-check-label" for="flexCheckChecked">
                App, Musica, TV e altro
              </label>
            </div>

            <div class="container">
                <div class="col text-center">
                    <br>
                        <label id="labelerror" class="text-muted" style="color:#dc3545 !important">
                         (Prego ricontrollare i campi inseriti)
                        </label>
                    <br>
                    <div class="container">
                        <button  style="width:140px;" type="button"  id="sendForm" class="btn btn-primary">Procedi</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
<i disabled="" class="bi bi-info-circle" style="pointer-events: none;"></i>  </BODY>
</HTML>