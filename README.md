# formRegEAccesso
Una piccola web app in Spring Boot con l'accesso, la registrazione e il MyAccount utilizzando le 4 operazioni CRUD

System.out.println("TERZO SERVICE");
        String group_id = "552e6dac-20af-4611-a69e-87559bd8e2de";
        String report_id = "ec46263f-2a7a-4ff5-82c7-fa2086535a3d";

        HttpURLConnection con = null;
        URL url = null;
        String resultOutput ="";
        try {

            url = new URL("https://api.powerbi.com/v1.0/myorg/groups/"+group_id+"/reports/"+report_id+"/exports/"+exportID);
            con = (HttpURLConnection) url.openConnection();
            con.setRequestMethod("GET");
            String bareToken2 = "Bearer "+bareToken;
            con.setRequestProperty("Authorization",bareToken2);

        } catch (ProtocolException | MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        int status = con.getResponseCode();
        System.out.println(status);
        BufferedReader in = new BufferedReader(
                new InputStreamReader(con.getInputStream()));
        String inputLine;
        StringBuffer content = new StringBuffer();
        while ((inputLine = in.readLine()) != null) {
            content.append(inputLine);
            System.out.println(inputLine);

            resultOutput = resultOutput+inputLine;
        }
        in.close();

        String tempString1 = resultOutput.substring(resultOutput.indexOf("status")+9);
        String statusParam = tempString1.substring(0,tempString1.indexOf("\""));
        System.out.println("Lo status e'"+statusParam);

        if (statusParam.equals("Succeeded")){
            return true;
        }

        return false;
