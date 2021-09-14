package com.silicondev.formRegEAccesso.service.Utility;

import com.silicondev.fiscalCodeValidator.FiscalCodeValidatorTest;
import com.silicondev.formRegEAccesso.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

@Service
public class CSVConnection {

    public static void init() throws IOException {

        FiscalCodeValidatorTest ft = new FiscalCodeValidatorTest();
        ft.init();

    }
    public static void init2() throws IOException {

        FiscalCodeValidatorTest ft = new FiscalCodeValidatorTest();
        ft.init2();

    }

    public boolean verifyFiscalCode(User user) throws IOException {
        init();

        try {
            DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
            String dateOfBirthAsString = df.format(user.getDateOfBirth());

            String birthPlace="";

            if (!user.getCountryOfBirth().equals("Italia")){
                birthPlace= user.getCountryOfBirth();
            }else{
                birthPlace=  user.getCityOfBirth();
            }
            boolean res = false;
            try {
                res = FiscalCodeValidatorTest.verifyFiscalCodeUser(user.getSurname().toUpperCase(), user.getName().toUpperCase(), dateOfBirthAsString,
                        birthPlace.toUpperCase(), user.getGender(), user.getFiscalCode());
            }catch (Exception e){
                try {
                    System.out.println("Non ho trovato corrispondenze provo l'altro File");
                    init2();
                    res = FiscalCodeValidatorTest.verifyFiscalCodeUser(user.getSurname().toUpperCase(), user.getName().toUpperCase(), dateOfBirthAsString,
                            birthPlace.toUpperCase(), user.getGender(), user.getFiscalCode());

                    return res;
                }catch(Exception ex) {

                    System.out.println("CODICE NON COMPATIBILE");
                    return false;
                }


            }
            return res;


        }
        catch (Error e){
            return false;
        }
    }



}
