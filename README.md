# formRegEAccesso
Una piccola web app in Spring Boot con l'accesso, la registrazione e il MyAccount utilizzando le 4 operazioni CRUD

            if (writer != null) writer.close();
        }

        System.out.println(connection.getResponseCode()); // Should be 200
        System.out.println(connection.getResponseMessage());


        ObjectMapper mapper = new ObjectMapper();
        jsonMap = mapper.readValue(connection.getInputStream(), Map.class);
        System.out.println(jsonMap);
        connection.disconnect();
        String bareToken = (String)jsonMap.get("access_token");
