package com.silicondev.formRegEAccesso.controller;

import com.silicondev.formRegEAccesso.model.User;
import com.silicondev.formRegEAccesso.model.UserAuthentication;
import com.silicondev.formRegEAccesso.service.CRUD.Delete;
import com.silicondev.formRegEAccesso.service.CRUD.Select;
import com.silicondev.formRegEAccesso.service.CRUD.Update;
import com.silicondev.formRegEAccesso.service.Inspect.JsonOperation;
import com.silicondev.formRegEAccesso.service.Inspect.RegExOperation;
import com.silicondev.formRegEAccesso.service.Utility.ManagementSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.server.Session;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;


//---------------------------------------------------------------------------------------
//<-- 4)Blocco per controllare i miei dati (operazioni CRUD: UPDATE e DELETE)-->

@Controller
public class MyAccountController {

    @Autowired
    ManagementSession managementSession;

    @Autowired
    RegExOperation regExOperation;

    @Autowired
    Select select;

    @Autowired
    JsonOperation jsonOperation;

    @Autowired
    Update update;

    @Autowired
    Delete delete;

    //API per l'accesso alla pagina personale dell'utente
    @RequestMapping(value="/myAccountPage", method=RequestMethod.GET)
    public ModelAndView myAccountPage(HttpServletRequest request){
        System.out.println("myAccountPage-----------------------------------------");

        ModelAndView mv1 = new ModelAndView("myAccountPage");
        HttpSession session = request.getSession();
        //Coontrollo se l'utente ha fatto l'accesso
        if(managementSession.verifySession(session)) {

            mv1.addObject("msg", "true");
            System.out.println("msg e' true");
            UserAuthentication userAuthentication = managementSession.getUserAuthenticationFromSession(session);
            mv1.addObject(userAuthentication);
            List<UserAuthentication> listUA = userAuthentication.getUser().getUserAuthenticationList();
            mv1.addObject("listUA", listUA);

            for (int i = 0; i < listUA.size(); i++){

                System.out.println(listUA.get(i).getUsername());
            }
            return mv1;
        }
        else{
            mv1.addObject("msg","false");
            System.out.println("msg e' false");
            return mv1;
        }

    }

    //API per l'accesso
    @RequestMapping(value = "/updateAccount",
            method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE,
            consumes = MediaType.APPLICATION_JSON_VALUE)
    public  @ResponseBody
    String updateAccount(@RequestBody String jsonReq, HttpServletRequest request){

        System.out.println("updateAccount------------------------------------------------------------------------");
        System.out.println(jsonReq);

        HttpSession session = request.getSession();
        if(managementSession.verifySession(session)){

            try {
                //prendo l'username dal json
                String username = jsonOperation.takeUsernameFromString(jsonReq);
                if(regExOperation.regExUsername(jsonReq)){
                    //verifico che non siano presenti altri username uguali
                    if(select.getAllUsername(username)==null){

                        //prendo il mio userAuthentication dalla Session
                        UserAuthentication userAuthentication;
                        userAuthentication = managementSession.getUserAuthenticationFromSession(session);
                        if(update.updateUsername(userAuthentication, username)){
                            System.out.println("Username modificato!");
                            return "{\"value\":\"Username modificato!\"}";
                        }
                        else{
                            System.out.println("Problema nel Database");
                            return "{\"value\":\"Errore: Problema nel nostro Database\"}";
                        }
                    }
                    else{
                        System.out.println("Username gia' esistente nel DB");
                        return "{\"value\":\"Errore: esiste gia' un username uguale nel nostro sito\"}";
                    }
                }
                else{
                    System.out.println("user Regex errata");
                    return "{\"value\":\"Errore: caratteri dell'username non validi. Non bisogna inserire spazi\"}";
                }
            }
            catch (Error e){
                System.out.println("Json non valido");
                return "{\"value\":\"Errore: questo e' un json non valido\"}";
            }
        }
        else{
            System.out.println("Utente non loggato");
            return "{\"value\":\"Errore: non sei loggato. Prego rifare l'accesso\"}";
        }
    }

    //API per l'accesso
    @RequestMapping(value = "/deleteAllData",
            method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE,
            consumes = MediaType.APPLICATION_JSON_VALUE)
    public  @ResponseBody
    String deleteAllData(@RequestBody String jsonReq, HttpServletRequest request){

        System.out.println("deleteAllData------------------------------------------------------------------------");
        System.out.println(jsonReq);

        HttpSession session = request.getSession();
        if(managementSession.verifySession(session)){
            //prendo il mio userAuthentication dalla Session
            UserAuthentication userAuthentication;
            userAuthentication = managementSession.getUserAuthenticationFromSession(session);
            System.out.println(userAuthentication.getUsername());
            System.out.println(userAuthentication.getEmail());
            System.out.println(userAuthentication.getPassword());
            System.out.println(userAuthentication.getTelephone());
            System.out.println(userAuthentication.getSubscription1());
            System.out.println(userAuthentication.getSubscription2());
            System.out.println(userAuthentication.getId());
            if(delete.deleteUserAuthentication(userAuthentication)) {

                //procedi a distruggere la sessione
                managementSession.destroySession(session);
                return "{\"value\":\"Account eliminato!\"}";
            }
            else{
                System.out.println("Problema nel database");
                return "{\"value\":\"Errore: Problema nel nostro database\"}";
            }
        }
        else{
            System.out.println("Utente non loggato");
            return "{\"value\":\"Errore: Non puoi eliminare senza fare un accesso\"}";
        }
    }
}

