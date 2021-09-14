package com.silicondev.formRegEAccesso.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.silicondev.formRegEAccesso.model.User;
import com.silicondev.formRegEAccesso.model.UserAuthentication;
import com.silicondev.formRegEAccesso.service.CRUD.Insert;
import com.silicondev.formRegEAccesso.service.Inspect.CharactOperation;
import com.silicondev.formRegEAccesso.service.Inspect.VerifyOperation;
import com.silicondev.formRegEAccesso.service.Inspect.JsonOperation;
import com.silicondev.formRegEAccesso.service.Inspect.RegExOperation;
import com.silicondev.formRegEAccesso.service.Utility.CSVConnection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;
import java.sql.Date;

//<-- 2) Blocco della registrazione (operazioni CRUD: INSERT)-->

@Controller
public class RegistrationController {

    @Autowired
    JsonOperation jsonOperation;

    @Autowired
    RegExOperation regExOperation;

    @Autowired
    CharactOperation charactOperation;

    @Autowired
    CSVConnection cSVConnection;

    @Autowired
    VerifyOperation verifyOperation;

    @Autowired
    Insert insert;


    //API per l'accesso alla pagina di registrazione
    @RequestMapping(value = "/registrationPage", method = RequestMethod.GET)
    public String registrationPage() {
        System.out.println("registrationPage");
        return "registrationPage";
    }

    //API per effettuare la registrazione
    @RequestMapping(value = "/registrationDoing",
            method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE,
            consumes = MediaType.APPLICATION_JSON_VALUE)
    public  @ResponseBody User registrationDoing(@RequestBody String jsonReq){

        System.out.println("registrationDoing---------------------------------------------------");
        System.out.println(jsonReq);


        try {
            //Controllo sulla conversione in obj User
            User userJson = jsonOperation.createObjectFromJson(jsonReq);

            //istanzio gli oggetti che rappresentano i nostri campi
            UserAuthentication userAuthentication= userJson.getUserAuthenticationList().get(0);
            String userName = userJson.getName();
            String userSurname = userJson.getSurname();
            Date userDateOfBirth = userJson.getDateOfBirth();
            String userCountryOfBirth = userJson.getCountryOfBirth();
            String userCityOfBirth = userJson.getCityOfBirth();
            String userGender = userJson.getGender();
            String userFiscalCode = userJson.getFiscalCode();
            String userUsername = userAuthentication.getUsername();
            String userPassword = userAuthentication.getPassword();
            String userEmail = userAuthentication.getEmail();
            String userTelephone = userAuthentication.getTelephone();
            boolean userSubscribtion1 = userAuthentication.getSubscription1();
            boolean userSubscribtion2 = userAuthentication.getSubscription2();

            //Stampa dei campi e controllo
            try {
                System.out.println(userName);
                System.out.println(userSurname);
                System.out.println(userDateOfBirth);
                System.out.println(userCountryOfBirth);
                System.out.println(userCityOfBirth);
                System.out.println(userGender);
                System.out.println(userFiscalCode);
                System.out.println(userUsername);
                System.out.println(userEmail);
                System.out.println(userPassword);
                System.out.println(userTelephone);
                System.out.println(userSubscribtion1);
                System.out.println(userSubscribtion2);
            }catch (Error error){
                System.out.println("errore obj Json sbagliato nella stampa");
                return null;
            }

            //Controllo sui campi dell'obj
            if(
                regExOperation.regExName(userName)&&
                regExOperation.regExSurname(userSurname)&&
                regExOperation.regExCountryOfBirth(userCountryOfBirth)&&
                regExOperation.regExCityOfBirth(userCityOfBirth)&&
                regExOperation.regGender(userGender)&&
                regExOperation.regExFiscalCode(userFiscalCode)&&
                regExOperation.regExUsername(userUsername)&&
                regExOperation.regExEmail(userEmail)&&
                regExOperation.regExPassword(userPassword)&&
                regExOperation.regExTelephone(userTelephone)
            ){

                try {
                    //Controllo del codice Fiscale
                    if (cSVConnection.verifyFiscalCode(userJson)){
                        System.out.println("CSVConnection");

                        //controllo se user e email non sono gia presenti nel DB
                        if(!verifyOperation.verifyUsernameInDB(userUsername)&&!verifyOperation.verifyEmailInDB(userEmail)){

                            //normalizzo i dati prima di inserirli nel db
                            charactOperation.uppCaseRules(userJson);

                            //Controllo se esiste già quell'utente nel DB
                            User userFounded= verifyOperation.verifyFiscalCodeInDBAndRetUser(userFiscalCode);


                            try {
                                if (userFounded !=null){
                                    //associazione all'User gia' esistente e aggiunta dell'account
                                    insert.insertUser(userFounded, userAuthentication, true);

                                    System.out.println("ACCOUNT INSERITO");
                                    return userJson;

                                }
                                else{

                                    //inserisco l'User e il suo account
                                    insert.insertUser(userJson, userAuthentication, false);

                                    System.out.println("UTENTE INSERITO");
                                    return userJson;
                                }
                            }
                            catch (Error e){
                                System.out.println("Errore nel Database nel momento di inserimento utente e/o user");
                                return null;
                            }
                        }
                        else{
                            System.out.println("errore gia presenti nel DB");
                            return null;
                        }
                    }
                    else {
                        System.out.println("errore CF");
                        return null;
                    }

                }catch ( IOException e){
                    System.out.println("errore IO");
                    return null;
                }
            }
            else{
                System.out.println("errore Json pattern RegExp sbagliato2");
                return null;
            }
            //jsonReq.getUser().getCityOfBirth();
        }
        catch (JsonProcessingException e) {
        System.out.println("JsonProcessingException");
        return null;
        }
    }

}
