package com.silicondev.formRegEAccesso.service.CRUD;

import com.silicondev.formRegEAccesso.dao.UserAuthenticationDao;
import com.silicondev.formRegEAccesso.dao.UserDao;
import com.silicondev.formRegEAccesso.model.User;
import com.silicondev.formRegEAccesso.model.UserAuthentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;




@Service
public class Select {
    @Autowired
    UserDao userDao;
    @Autowired
    UserAuthenticationDao userAuthenticationDao;

    public UserAuthentication getAllUsername(String username){

        UserAuthentication userAuthentication= userAuthenticationDao.findByUsername(username);
        return userAuthentication;
    }

    public User getAllFiscalCode(String fiscalCode){

        User user= userDao.findByFiscalCode(fiscalCode);
        return user;
    }

    public UserAuthentication getAllEmail(String email){
        UserAuthentication uA = new UserAuthentication();
        uA = userAuthenticationDao.findByEmail(email);

        return uA;

    }


    public void getAllCountry(){}

    public void getAllCity(){}

}

