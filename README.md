# formRegEAccesso
Una piccola web app in Spring Boot con l'accesso, la registrazione e il MyAccount utilizzando le 4 operazioni CRUD

System.out.println("SECONDO SERVICE");

        String group_id = "552e6dac-20af-4611-a69e-87559bd8e2de";
        // fdb503b0-3890-4ae3-81ac-e79f4b9c4276
        String report_id = "ec46263f-2a7a-4ff5-82c7-fa2086535a3d";
        String bareToken2 = "Bearer "+bareToken;
        String tempString1 ="";

        String url = "https://api.powerbi.com/v1.0/myorg/groups/" + group_id + "/reports/" + report_id + "/ExportTo";
        String LINE_FEED = "\r\n";

        try {

            final String POST_PARAMS = "{\r\n"
                    + "          \"format\":\"PDF\",\r\n"
                    + "          \"paginatedReportConfiguration\":{\r\n"
                    + "            \"identities\":[\r\n"
                    + "              {\r\n"
                    + "                \"username\":\"daniele.ligorio-ext@ferrari.com\"\r\n"
                    + "              }\r\n"
                    + "            ]\r\n"
                    + "          }\r\n"
                    + "        }";

            byte[] out = POST_PARAMS.getBytes(StandardCharsets.UTF_8);


            URL obj = new URL(url);
            HttpURLConnection postConnection = (HttpURLConnection) obj.openConnection();
            postConnection.setRequestMethod("POST");
            postConnection.setRequestProperty("Content-Type", "application/json");
            postConnection.setRequestProperty("Authorization",bareToken2);
            postConnection.setDoOutput(true);

            OutputStream os = postConnection.getOutputStream();
            os.write(out);
            os.flush();

            BufferedReader br = new BufferedReader(new InputStreamReader((postConnection.getInputStream())));

            String output;
            System.out.println("Output from Server .... \n");
            while ((output = br.readLine()) != null) {
                System.out.println(output);
                tempString1= tempString1+output;
            }

            postConnection.disconnect();

        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

        String tempString2 = tempString1.substring(tempString1.indexOf("id")+5);

        String exportID = tempString2.substring(0,tempString2.indexOf("\""));

        System.out.println("L'exportID e'"+exportID);

        return exportID;
