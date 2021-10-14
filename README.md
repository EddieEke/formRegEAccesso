# formRegEAccesso
Una piccola web app in Spring Boot con l'accesso, la registrazione e il MyAccount utilizzando le 4 operazioni CRUD

String LINE_FEED = "\r\n";

        String url = "https://login.microsoftonline.com/51cc9718-2c01-4a5b-b258-5399ebafc611/oauth2/token";

        HttpURLConnection connection = (HttpURLConnection) new URL(url).openConnection();

        connection.setDoOutput(true);
        connection.setRequestMethod("POST");

        String boundary = Long.toHexString(System.currentTimeMillis());
        connection.setRequestProperty("Content-Type", "multipart/form-data; boundary=" + boundary);

        PrintWriter writer = null;
        try {
            writer = new PrintWriter(new OutputStreamWriter(connection.getOutputStream(), "UTF-8"));

            writer.append("--" + boundary).append(LINE_FEED);
            writer.append("Content-Disposition: form-data; name=\"grant_type\"").append(LINE_FEED).append(LINE_FEED);
            writer.append("client_credentials");
            writer.append(LINE_FEED);

            writer.append("--" + boundary).append(LINE_FEED);
            writer.append("Content-Disposition: form-data; name=\"client_id\"").append(LINE_FEED).append(LINE_FEED);
            writer.append("7cac0e6c-841a-48aa-951d-ab404a68cd69");
            writer.append(LINE_FEED);

            writer.append("--" + boundary).append(LINE_FEED);
            writer.append("Content-Disposition: form-data; name=\"client_secret\"").append(LINE_FEED).append(LINE_FEED);
            writer.append("p-r7Q~eAm0K_A2gQ-fJsUhVsoZyv3sLPRigAo");
            writer.append(LINE_FEED);

            writer.append("--" + boundary).append(LINE_FEED);
            writer.append("Content-Disposition: form-data; name=\"scope\"").append(LINE_FEED).append(LINE_FEED);
            writer.append("openid offline_access");
            writer.append(LINE_FEED);

            writer.append("--" + boundary).append(LINE_FEED);
            writer.append("Content-Disposition: form-data; name=\"resource\"").append(LINE_FEED).append(LINE_FEED);
            writer.append("https://analysis.windows.net/powerbi/api");
            writer.append(LINE_FEED);


            writer.append(LINE_FEED);
            writer.append("--" + boundary + "--").append(LINE_FEED);
            writer.append(LINE_FEED);
            writer.flush();
            writer.close();
        } catch (Exception e) {
            System.out.append("Exception writing file" + e);
        } finally {
            if (writer != null) writer.close();
        }

        System.out.println(connection.getResponseCode()); // Should be 200
        System.out.println(connection.getResponseMessage());


        BufferedReader in = new BufferedReader(
                new InputStreamReader(connection.getInputStream()));
        String inputLine;
        StringBuffer content = new StringBuffer();
        while ((inputLine = in.readLine()) != null) {
            content.append(inputLine);
        }
        in.close();


        System.out.println(content);

        String tempString = content.substring(content.indexOf("access_token")+15);

        String bareToken = tempString.substring(0,tempString.indexOf("\""));

        System.out.println(bareToken);


        return bareToken;
