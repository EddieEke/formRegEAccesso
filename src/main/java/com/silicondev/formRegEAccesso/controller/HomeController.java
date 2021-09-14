package com.silicondev.formRegEAccesso.controller;

import com.silicondev.formRegEAccesso.model.UserAuthentication;
import com.silicondev.formRegEAccesso.service.Utility.ManagementSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


//<-- 1) Blocco della home page (operazioni CRUD://)-->

@Controller
public class HomeController {

    @Autowired
    ManagementSession managementSession;

    //API per l'accesso alla home page
    @RequestMapping(value="/homePage", method= RequestMethod.GET)
    public ModelAndView homePage(HttpServletRequest request){
        System.out.println("homePage----------------------------------");

        ModelAndView mv = new ModelAndView("homePage");

        //verifico se l'utente ha fatto la sessione
        HttpSession session = request.getSession();
        if(managementSession.verifySession(session)){
            mv.addObject("msg","true");

            //prendi l'userAuthentication dalla sessione
            UserAuthentication userAuthentication = managementSession.getUserAuthenticationFromSession(session);

            mv.addObject(userAuthentication);
            return mv;
        }
        else{
            mv.addObject("msg","false");
        }
        return mv;
    }
}
