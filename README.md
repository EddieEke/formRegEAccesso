# formRegEAccesso
Una piccola web app in Spring Boot con l'accesso, la registrazione e il MyAccount utilizzando le 4 operazioni CRUD

        String tempString = content.substring(content.indexOf("access_token")+15);

        String access_token = tempString.substring(0,tempString.indexOf("\""));
        
        System.out.println(access_token);
