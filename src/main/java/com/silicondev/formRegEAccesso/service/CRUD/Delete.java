package com.silicondev.formRegEAccesso.service.CRUD;

import com.silicondev.formRegEAccesso.dao.UserAuthenticationDao;
import com.silicondev.formRegEAccesso.model.UserAuthentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class Delete {

    @Autowired
    UserAuthenticationDao userAuthenticationDao;

    public boolean deleteUserAuthentication (UserAuthentication userAuthentication){
        try {
            userAuthenticationDao.deleteById(userAuthentication.getId());
            return true;
        }
        catch (Error e){
            return false;
        }
    }

  }
