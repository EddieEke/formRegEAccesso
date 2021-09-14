package com.silicondev.formRegEAccesso.service.Test;

import com.silicondev.formRegEAccesso.dao.UserAuthenticationDao;
import com.silicondev.formRegEAccesso.dao.UserDao;
import com.silicondev.formRegEAccesso.model.User;
import com.silicondev.formRegEAccesso.model.UserAuthentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProvaService {
    @Autowired
    public UserDao userDao;


    //(-->6)Metodi Service delle prove

    public List<User> takeMyName(){

        List<User> myUserList= userDao.findAll();

        //UserImpl.findAll();

        return myUserList;
    }


}
