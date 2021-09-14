package com.silicondev.formRegEAccesso.service.CRUD;

import com.silicondev.formRegEAccesso.dao.UserAuthenticationDao;
import com.silicondev.formRegEAccesso.dao.UserDao;
import com.silicondev.formRegEAccesso.model.User;
import com.silicondev.formRegEAccesso.model.UserAuthentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.*;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaDelete;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.CriteriaUpdate;
import javax.persistence.metamodel.Metamodel;
import java.util.List;
import java.util.Map;

@Service
public class Insert {

    @Autowired
    UserAuthenticationDao userAuthenticationDao;

    @Autowired
    UserDao userDao;

    public boolean insertUser(User user, UserAuthentication userAuthentication, boolean userIsFound){

        if (userIsFound){

            userAuthentication.setUser(user);
            userAuthenticationDao.save(userAuthentication);

            return true;
        }
        else {
            userDao.save(user);
            userAuthentication.setUser(user);
            userAuthenticationDao.save(userAuthentication);
            return true;
        }
    }
}
