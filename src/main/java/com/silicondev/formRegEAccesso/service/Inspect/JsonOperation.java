package com.silicondev.formRegEAccesso.service.Inspect;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.silicondev.formRegEAccesso.model.User;
import org.springframework.stereotype.Service;

@Service
public class JsonOperation {

    public void verifyAndGetValue(String nameOfValue){

    }

    public User createObjectFromJson(String jsonReq) throws JsonProcessingException {

        ObjectMapper objectMapper = new ObjectMapper();
        User userJson = new User();

        try {
            userJson = objectMapper.readValue(jsonReq, User.class);

        } catch (JsonProcessingException e) {
        }
        return userJson;
    }

    public void avoidSQLInj(){}

    public String takeEmailfromString(String jsonReq){
        String res = jsonReq.substring(10,jsonReq.lastIndexOf(" "));
        System.out.println("takeEmailfromString = "+res);
        return res;
    }

    public String takePasswordfromString(String jsonReq) {
        String res = jsonReq.substring(10, jsonReq.lastIndexOf("\""));
        return res;
    }
    public String takePasswordfromStringAndPasswIs2Value(String jsonReq){
        String res = jsonReq.substring(jsonReq.indexOf(" ")+1,jsonReq.lastIndexOf("\""));
        System.out.println("takePasswordfromStringAndPasswIs2Value = "+res);
        return res;

    }

    public String takeUsernameFromString(String jsonReq){
        String res = jsonReq.substring(10,jsonReq.lastIndexOf("\""));
        return res;

    }
}
