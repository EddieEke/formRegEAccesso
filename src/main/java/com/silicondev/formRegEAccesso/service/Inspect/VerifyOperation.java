package com.silicondev.formRegEAccesso.service.Inspect;


import com.silicondev.formRegEAccesso.dao.UserAuthenticationDao;
import com.silicondev.formRegEAccesso.dao.UserDao;
import com.silicondev.formRegEAccesso.model.User;
import com.silicondev.formRegEAccesso.model.UserAuthentication;
import com.silicondev.formRegEAccesso.service.CRUD.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class VerifyOperation {

    @Autowired
    UserDao userDao;

    @Autowired
    Select select;

    @Autowired
    UserAuthenticationDao userAuthenticationDao;

    public boolean verifyUsernameInDB(String username){
        try {
            UserAuthentication uA;
            uA = select.getAllUsername(username);
            if (uA!=null){
                return true;
            }
            else {
                return false;
            }
        }
        catch (Exception e){
            System.out.println("Errore nel Database");
            return false;
        }

    }

    public User verifyFiscalCodeInDBAndRetUser(String fiscalCode){

        try {
            User user= new User();
            user = select.getAllFiscalCode(fiscalCode);
            if (user!=null){
                return user;
            }
            else {
                return null;
            }
        }
        catch (Exception e){
            System.out.println("Errore nel Database");
            return null;
        }
    }

    public UserAuthentication verifyEmailAndReturnUA(String email){
        UserAuthentication uA = new UserAuthentication();
        uA = select.getAllEmail(email);
        return uA;

    }

    public boolean verifyPasswordForUA(UserAuthentication uA, String password){
        boolean res;
        res= uA.getPassword().equals(password)?true:false;
        return res;

    }

    public boolean verifyEmailInDB( String email){
        try {
            UserAuthentication uA;
            uA = select.getAllEmail(email);
            if (uA!=null){
                return true;
            }
            else {
                return false;
            }
        }
        catch (Exception e){
            System.out.println("Errore nel Database");
            return false;
        }
    }
}
