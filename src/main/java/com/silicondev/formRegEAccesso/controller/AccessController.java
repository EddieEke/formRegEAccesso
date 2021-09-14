package com.silicondev.formRegEAccesso.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.silicondev.formRegEAccesso.model.User;
import com.silicondev.formRegEAccesso.model.UserAuthentication;
import com.silicondev.formRegEAccesso.service.Inspect.VerifyOperation;
import com.silicondev.formRegEAccesso.service.Inspect.JsonOperation;
import com.silicondev.formRegEAccesso.service.Inspect.RegExOperation;
import com.silicondev.formRegEAccesso.service.Utility.ManagementSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;


//---------------------------------------------------------------------------------------
//<-- 3)Blocco dell'accesso utente (operazioni CRUD: SELECT)-->

@Controller
public class AccessController {

    @Autowired
    JsonOperation jsonOperation;

    @Autowired
    RegExOperation regExOperation;

    @Autowired
    VerifyOperation verifyOperation;

    @Autowired
    ManagementSession managementSession;


    //API per l'accesso utente
    @RequestMapping(value="/accessPage", method=RequestMethod.GET)
    public String myAccountPage(){
        System.out.println("accessPage");
        return "accessPage";
    }



    //---------------------------------------------------------------------------------------
    //API per l'accesso
    @RequestMapping(value = "/accessDoing",
            method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE,
            consumes = MediaType.APPLICATION_JSON_VALUE)
    public  @ResponseBody String registrationDoing(@RequestBody String jsonReq, HttpServletRequest request){

        System.out.println("accessDoing------------------------------------------------------------------------");
        System.out.println(jsonReq);
        try {
            //Prendo i miei valori email e password
            String emailReq = jsonOperation.takeEmailfromString(jsonReq);
            String passwordReq = jsonOperation.takePasswordfromStringAndPasswIs2Value(jsonReq);

            //Stampa dei campi e controllo

                System.out.println(emailReq);
                System.out.println(passwordReq);

            //Controllo sui valori email e password
            if(
                regExOperation.regExEmail(emailReq)&&
                regExOperation.regExPassword(passwordReq)

            ){

                try {
                    //Controllo dell'email se esiste
                    System.out.println("0 passaggio");
                    UserAuthentication userAuthentication= new UserAuthentication();
                    userAuthentication = verifyOperation.verifyEmailAndReturnUA(emailReq);
                    if (userAuthentication !=null){
                        System.out.println("1 passaggio");
                        //Controllo se la password combacia con quella corrispondente
                        boolean matches= verifyOperation.verifyPasswordForUA(userAuthentication, passwordReq);

                        if (matches) {
                            HttpSession session = request.getSession();
                            System.out.println("2 passaggio");

                            //Controllo se l'utente non ha gia' fatto l'accesso
                            boolean existSession = managementSession.verifySession(session);

                            if (existSession){
                                System.out.println("User gia' loggato");
                                return "{\"value\":\"User gia' loggato\"}";
                            }
                            else{
                                System.out.println("3 passaggio");
                                //Creo la sessione
                                managementSession.createSession(session,userAuthentication);
                                return "{\"value\":\"enterPage\"}";
                            }
                        }
                        else{
                            System.out.println("Email non corrisponde alla password");
                            return "{\"value\":\"User o password non valida\"}";
                        }
                    }
                    else{
                        System.out.println("Email non esistente nel DB");
                        return "{\"value\":\"User o password non valida\"}";
                    }
                }catch ( Error e){
                    System.out.println("errore IO");
                    return "{\"value\":\"user non esistente\"}";
                }
            }
            else{
                System.out.println("errore Json pattern RegExp sbagliato");
                return "{\"value\":\"errore Json pattern RegExp sbagliato\"}";
            }
            //jsonReq.getUser().getCityOfBirth();
        }
        catch (Error e) {
            System.out.println("ErroreJson");
            return "{\"value\":\"ErroreJson\"}";
        }

    }


}
