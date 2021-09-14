package com.silicondev.formRegEAccesso.controller;

import com.silicondev.formRegEAccesso.service.Utility.ManagementSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

//<-- 5)Blocco per effettuare il logout (operazioni CRUD: //)-->


@Controller
public class LogoutController {

    @Autowired
    ManagementSession managementSession;

    //API per l'accesso logout page
    @RequestMapping(value="/logoutPage", method=RequestMethod.GET)
    public String logoutPage(HttpServletRequest request){
        System.out.println("logoutPage");
        HttpSession session= request.getSession();
        //verifica che l'utente sia gia' acceduto
        if(managementSession.verifySession(session)){
           //fai il logout
           managementSession.destroySession(session);

           return "homePage";
        }
        else{
            return "errorPage";
        }
    }

}
