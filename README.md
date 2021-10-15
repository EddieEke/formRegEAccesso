# formRegEAccesso
Una piccola web app in Spring Boot con l'accesso, la registrazione e il MyAccount utilizzando le 4 operazioni CRUD


	    try {

	        final String POST_PARAMS = "{\r\n"
	                + "          \"format\":\""+format+"\",\r\n"
	                + "          \"paginatedReportConfiguration\":{\r\n"
	                + "            \"identities\":[\r\n"
	                + "              {\r\n"
	                + "                \"username\":\""+identity+"\"\r\n"
	                + "              }\r\n"
	                + "            ]\r\n"
	                + "          }\r\n"
	                + "        }";

	        byte[] out = POST_PARAMS.getBytes("UTF_8");
