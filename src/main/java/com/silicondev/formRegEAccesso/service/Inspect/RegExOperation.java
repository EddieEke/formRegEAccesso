package com.silicondev.formRegEAccesso.service.Inspect;

import org.springframework.stereotype.Service;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Service
public class RegExOperation {

    public static boolean regExFiscalCode(String fiscalCodeString){
        Pattern pattern = Pattern.compile("^([A-Z]{6}[0-9LMNPQRSTUV]{2}[ABCDEHLMPRST]{1}[0-9LMNPQRSTUV]{2}[A-Z]{1}[0-9LMNPQRSTUV]{3}[A-Z]{1})$|([0-9]{11})$");
        Matcher matcher = pattern.matcher(fiscalCodeString);
        boolean matchFound = matcher.find();
        System.out.println("FiscalCode= "+matchFound);
        if(matchFound) {
            return true;
        } else {
            return false;
        }

    }

    public static boolean regExUsername(String usernameString){
        Pattern pattern = Pattern.compile("^\\S+$");
        Matcher matcher = pattern.matcher(usernameString);
        boolean matchFound = matcher.find();
        System.out.println("Username= "+matchFound);

        if(matchFound) {
            return true;
        } else {
            return false;
        }

    }

    public static boolean regExEmail(String emailString){
        Pattern pattern = Pattern.compile("^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,6}$");
        Matcher matcher = pattern.matcher(emailString);
        Pattern pattern2 = Pattern.compile("^(?=.{0,30}$)\\S*$");
        Matcher matcher2 = pattern2.matcher(emailString);
        boolean matchFound = matcher.find();
        boolean matchFound2 = matcher2.find();

        System.out.println("Email= "+matchFound + " "+matchFound2);


        if(matchFound&&matchFound2) {
            return true;
        } else {
            return false;
        }

    }

    public static boolean regExPassword(String passwordString){
        Pattern pattern = Pattern.compile("^(?!^.{20})[^\\s-]");
        Matcher matcher = pattern.matcher(passwordString);
        boolean matchFound = matcher.find();

        System.out.println("Password= "+matchFound);

        if(matchFound) {
            return true;
        } else {
            return false;
        }

    }

    public static boolean regExTelephone(String telephoneString){
        Pattern pattern = Pattern.compile("^(?=.{0,20}$)[0-9]*$");
        Matcher matcher = pattern.matcher(telephoneString);
        boolean matchFound = matcher.find();

        System.out.println("Telephone= "+matchFound);

        if(matchFound) {
            return true;
        } else {
            return false;
        }

    }
    public boolean regExName(String nameString){
        Pattern pattern = Pattern.compile("^[A-Za-z]{1,20}$");
        Matcher matcher = pattern.matcher(nameString);
        boolean matchFound = matcher.find();
        System.out.println("Name= "+matchFound);
        if(matchFound) {
            return true;
        } else {
            return false;
        }

    }
    public static boolean regExSurname(String surnameString){
        Pattern pattern = Pattern.compile("^[A-Za-z]{1,20}$");
        Matcher matcher = pattern.matcher(surnameString);
        boolean matchFound = matcher.find();

        System.out.println("Surname= "+matchFound);

        if(matchFound) {
            return true;
        } else {
            return false;
        }

    }
    public static boolean regExDateOfBirth(Date dateOfBirth){

        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");

        String todayAsString = df.format(dateOfBirth);
        Pattern pattern = Pattern.compile("^(?=.{0,20}$)\\S*$");
        Matcher matcher = pattern.matcher(todayAsString);
        boolean matchFound = matcher.find();

        System.out.println("DateOfBirth= "+matchFound);

        if(matchFound) {
            return true;
        } else {
            return false;
        }

    }

    public static boolean regGender(String genderString){
    if(genderString.equals("M")||genderString.equals("F")){
        System.out.println("Gender= true");
        return true;
    }


    else {
        System.out.println("Gender= false");
            return false;
        }

    }
    public static boolean regExCountryOfBirth(String countryofBirth){
        Pattern pattern = Pattern.compile("^.{1,20}$");
        Matcher matcher = pattern.matcher(countryofBirth);
        boolean matchFound = matcher.find();

        System.out.println("CountryOfBirth= "+matchFound);

        if(matchFound) {
            return true;
        } else {
            return false;
        }

    }

    public static boolean regExCityOfBirth(String cityOfBirth){
        Pattern pattern = Pattern.compile("^.{1,20}$");
        Matcher matcher = pattern.matcher(cityOfBirth);
        boolean matchFound = matcher.find();

        System.out.println("CityOfBirth= "+matchFound);

        if(matchFound) {
            return true;
        } else {
            return false;
        }

    }


}
