# formRegEAccesso
Una piccola web app in Spring Boot con l'accesso, la registrazione e il MyAccount utilizzando le 4 operazioni CRUD
            ObjectMapper mapper = new ObjectMapper();
            jsonMap = mapper.readValue(postConnection.getInputStream(), Map.class);
            System.out.println(jsonMap);
            postConnection.disconnect();

        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

        String exportID = (String)jsonMap.get("id");

