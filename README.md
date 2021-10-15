# formRegEAccesso
Una piccola web app in Spring Boot con l'accesso, la registrazione e il MyAccount utilizzando le 4 operazioni CRUD



int status = con.getResponseCode();
        System.out.println(status);
        ObjectMapper mapper = new ObjectMapper();
        jsonMap = mapper.readValue(con.getInputStream(), Map.class);
        System.out.println(jsonMap);
        con.disconnect();

        String statusParam = (String)jsonMap.get("status");
        if (statusParam.equals("Succeeded")){
            return true;
        }

        return false;
