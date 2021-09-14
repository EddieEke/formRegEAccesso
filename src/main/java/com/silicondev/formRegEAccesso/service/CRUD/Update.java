package com.silicondev.formRegEAccesso.service.CRUD;

import com.silicondev.formRegEAccesso.dao.UserAuthenticationDao;
import com.silicondev.formRegEAccesso.model.UserAuthentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class Update {

    @Autowired
    UserAuthenticationDao userAuthenticationDao;

    public void updateEmail(){}

    public void updatePassword(){}

    public void updateTelephone(){}

    public void updateSubscription1(){}

    public void updateSubscription2(){}

    public boolean updateUsername(UserAuthentication userAuthentication, String username){
        try {
            userAuthentication.setUsername(username);
            userAuthenticationDao.save(userAuthentication);
            return true;
        }
        catch(Error e){
            return false;
        }
    }
}
