package com.silicondev.formRegEAccesso.service.Utility;

import com.silicondev.formRegEAccesso.model.User;
import com.silicondev.formRegEAccesso.model.UserAuthentication;
import org.springframework.boot.web.servlet.server.Session;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;

@Service
public class ManagementSession {

    public void createSession(HttpSession session,UserAuthentication userAuthentication){
        session.setAttribute("userAuthentication", userAuthentication);
        session.setMaxInactiveInterval(3600);
        System.out.println("Sessione creata (tempo della sessione 1 ora)");
    }

    public void destroySession(HttpSession session){
        if (session != null) {
            session.invalidate();
        }
    }

    public UserAuthentication getUserAuthenticationFromSession(HttpSession session){
        UserAuthentication uA = (UserAuthentication)session.getAttribute("userAuthentication");

        return uA;
    }

    public boolean verifySession(HttpSession session){
        if ((UserAuthentication)session.getAttribute("userAuthentication")!=null){
            System.out.println("L'utente ha effettuato l'accesso in precedenza");
            return true;
        }
        else {
            System.out.println("L'utente non e' loggato");
            return false;
        }
    }

}
