# formRegEAccesso
Una piccola web app in Spring Boot con l'accesso, la registrazione e il MyAccount utilizzando le 4 operazioni CRUD

package test;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.nio.charset.StandardCharsets;

public class Test3 {

	private static final String group_id = "552e6dac-20af-4611-a69e-87559bd8e2de";
	// fdb503b0-3890-4ae3-81ac-e79f4b9c4276
	private static final String report_id = "ec46263f-2a7a-4ff5-82c7-fa2086535a3d";
	private static final String bareToken = "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsIng1dCI6Imwzc1EtNTBjQ0g0eEJWWkxIVEd3blNSNzY4MCIsImtpZCI6Imwzc1EtNTBjQ0g0eEJWWkxIVEd3blNSNzY4MCJ9.eyJhdWQiOiJodHRwczovL2FuYWx5c2lzLndpbmRvd3MubmV0L3Bvd2VyYmkvYXBpIiwiaXNzIjoiaHR0cHM6Ly9zdHMud2luZG93cy5uZXQvNTFjYzk3MTgtMmMwMS00YTViLWIyNTgtNTM5OWViYWZjNjExLyIsImlhdCI6MTYzNDA1Mjg1OSwibmJmIjoxNjM0MDUyODU5LCJleHAiOjE2MzQwNTY3NTksImFpbyI6IkUyWmdZRmlyMVBic1g3TFIvTGxzaWRIZnk3b1lBQT09IiwiYXBwaWQiOiI3Y2FjMGU2Yy04NDFhLTQ4YWEtOTUxZC1hYjQwNGE2OGNkNjkiLCJhcHBpZGFjciI6IjEiLCJpZHAiOiJodHRwczovL3N0cy53aW5kb3dzLm5ldC81MWNjOTcxOC0yYzAxLTRhNWItYjI1OC01Mzk5ZWJhZmM2MTEvIiwib2lkIjoiZmZmNmFjMDEtNGMzZi00ZWY2LWJmZjEtNmJiOWMwZjQ3ZjM2IiwicmgiOiIwLkFUb0FHSmZNVVFFc1cwcXlXRk9aNjZfR0VXd09ySHdhaEtwSWxSMnJRRXBveldrNkFBQS4iLCJzdWIiOiJmZmY2YWMwMS00YzNmLTRlZjYtYmZmMS02YmI5YzBmNDdmMzYiLCJ0aWQiOiI1MWNjOTcxOC0yYzAxLTRhNWItYjI1OC01Mzk5ZWJhZmM2MTEiLCJ1dGkiOiJ3WVN3SmpreGxFNm53ZEk5YVcwaUFBIiwidmVyIjoiMS4wIn0.otlOUf7Cdm7Ra91HvWRO5YeyzW1W5wOSAUv-nPl4N2aerpt-y5mik8yqN0srUjkfCMJQa0SxrpsyXpTtjDYpZiULNDBlSu4FoZj35f8_ZAdwuf4CQyMEDp7LUI0rwFh9wWoWidRl-NoO-RrgvpuPABC7tVgSCbHUi0cSFwtA50JKO2ufAzJ63VSf7OEBCown2YgtyVdfTHUkRgKh_IWsvhW-7l2cTjg9aMbz1_gx5LKvbGJyQHgNdeeG-Hrd7EmKPksww-M1c980DexOAphwrE3cFRVn5seG14JR43fqLs8Ce_7KPKFra73epzwmSB5k7bRv9O_hk0koSWpY3dc02g";

	private static final String url = "https://api.powerbi.com/v1.0/myorg/groups/" + group_id + "/reports/" + report_id + "/ExportTo";
	private static String LINE_FEED = "\r\n";

	public static void main(String[] args) throws Exception {

		try {

			final String POST_PARAMS = "{\r\n"
					+ "          \"format\":\"XML\",\r\n"
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
			postConnection.setRequestProperty("Authorization",bareToken);
			postConnection.setDoOutput(true);

			OutputStream os = postConnection.getOutputStream();
			os.write(out);
			os.flush();

			BufferedReader br = new BufferedReader(new InputStreamReader((postConnection.getInputStream())));

			String output;
			System.out.println("Output from Server .... \n");
			while ((output = br.readLine()) != null) {
				System.out.println(output);
			}

			postConnection.disconnect();

		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
