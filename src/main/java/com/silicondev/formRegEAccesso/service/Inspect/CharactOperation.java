package com.silicondev.formRegEAccesso.service.Inspect;

import com.silicondev.formRegEAccesso.model.User;
import org.springframework.stereotype.Service;

@Service
public class  CharactOperation{

    public static String uppCaseOnlyFirstLetter(){

        return "";
    }

    public User uppCaseRules(User user){

        String strName = user.getName().toLowerCase();
        user.setName(strName.substring(0, 1).toUpperCase() + strName.substring(1));

        String strSurname = user.getSurname().toLowerCase();
        user.setSurname(strSurname.substring(0, 1).toUpperCase() + strSurname.substring(1));

        String strCountryOfBirth = user.getCountryOfBirth().toLowerCase();
        user.setCountryOfBirth(strCountryOfBirth.substring(0, 1).toUpperCase() + strCountryOfBirth.substring(1));

        String strCityOfBirth = user.getCityOfBirth().toLowerCase();
        user.setCityOfBirth(strCityOfBirth.substring(0, 1).toUpperCase() + strCityOfBirth.substring(1));

        String strEmail = user.getUserAuthenticationList().get(0).getEmail().toLowerCase();
        user.getUserAuthenticationList().get(0).setEmail(strEmail);

        return user;
    }
}
