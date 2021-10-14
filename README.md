# formRegEAccesso
Una piccola web app in Spring Boot con l'accesso, la registrazione e il MyAccount utilizzando le 4 operazioni CRUD

System.out.println("QUARTO SERVICE");
        String group_id = "552e6dac-20af-4611-a69e-87559bd8e2de";
        String report_id = "ec46263f-2a7a-4ff5-82c7-fa2086535a3d";

        HttpURLConnection con = null;
        try {

            URL url = new URL("https://api.powerbi.com/v1.0/myorg/groups/"+group_id+"/reports/"+report_id+"/exports/"+exportID+ "/file");
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

        InputStream initialStream = con.getInputStream();
        File targetFile = new File("Report.pdf");
        OutputStream outStream = new FileOutputStream(targetFile);
        byte[] buffer = new byte[8 * 1024];
        int bytesRead;

        while ((bytesRead = initialStream.read(buffer)) != -1) {
            outStream.write(buffer, 0, bytesRead);
        }

        initialStream.close();
        outStream.close();

         return targetFile;
