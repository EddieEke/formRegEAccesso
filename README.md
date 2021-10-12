# formRegEAccesso
Una piccola web app in Spring Boot con l'accesso, la registrazione e il MyAccount utilizzando le 4 operazioni CRUD

public static void main( String[] args ) throws IOException {

        HttpURLConnection con = null;
        URL url = null;
        try {
            url = new URL("http://unigate.silicondev.com/");
            con = (HttpURLConnection) url.openConnection();
            con.setRequestMethod("GET");
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
        }
        in.close();
    }
