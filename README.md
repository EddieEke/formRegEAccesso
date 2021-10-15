# formRegEAccesso
Una piccola web app in Spring Boot con l'accesso, la registrazione e il MyAccount utilizzando le 4 operazioni CRUD

package it.ferrari.gt.gsr.powerbi;

import it.ferrari.gt.gsr.controllers.report.ReportCreationPowerBIService;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLStreamHandler;
import java.security.cert.Certificate;
import java.util.Map;
import java.util.Properties;

import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLPeerUnverifiedException;

import com.fasterxml.jackson.databind.ObjectMapper;

import org.apache.log4j.Logger;


public class PowerBIManager {
	private static final Logger logger = Logger.getLogger(PowerBIManager.class);
	

	
	private static final String GROUP_ID = "552e6dac-20af-4611-a69e-87559bd8e2de";
	private static final String IDENTITY = "daniele.ligorio-ext@ferrari.com";
	
	//private static String URL1 = "https://login.microsoftonline.com/51cc9718-2c01-4a5b-b258-5399ebafc611/oauth2/token";
	//private static String URL2 = "https://api.powerbi.com/v1.0/myorg/groups/";

	private static String URL1;
	private static String URL2;
	
	static {
		InputStream inputStream = null;
		try  {
			Properties properties = new Properties();
			inputStream = PowerBIManager.class.getClassLoader().getResourceAsStream( "gsr.properties" );
			properties.load(inputStream);
			
			URL1 = properties.getProperty("url1");
			URL2 = properties.getProperty("url2");
			
		} catch (Exception e) {
			// TODO logga eccezione
		}
		finally {
			if (inputStream != null) {
				try {
					inputStream.close();
				} catch (IOException e) {
					// TODO logga eccezione
					e.printStackTrace();
				}
			}
		}
	}
	public PowerBIManager() {
		
	}
	
	/**
	 * richiesta del token da usare per la chiamata alle api di export del report
	 * 
	 * @return token
	 */
	private String getToken() throws IOException{
		
		String url = URL1;

		String LINE_FEED = "\r\n";
	    Map<String, Object> jsonMap = null;

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

	
	    ObjectMapper mapper = new ObjectMapper();
	    jsonMap = mapper.readValue(connection.getInputStream(), Map.class);
	    System.out.println(jsonMap);
	    connection.disconnect();
	    String bareToken = (String)jsonMap.get("access_token");


	    return bareToken;
	}
	
		
	/**
	 * richiesta di esportazione report
	 * 
	 * @param groupId
	 * @param reportId
	 * @param format
	 * @param identity
	 * 
	 * @return exportId
	 */
	private String exportTo(String groupId, String reportId, String format, String identity, String token) throws IOException{		
		
		System.out.println("SECONDO SERVICE");

	    String bareToken2 = "Bearer "+token;
	    Map<String, Object> jsonMap = null;

	    String url = URL2 + groupId + "/reports/" + reportId + "/ExportTo";

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
	        // forse serve byte[] out = POST_PARAMS.getBytes("UTF8");


	        URL obj = new URL(url);
	        HttpURLConnection postConnection = (HttpURLConnection) obj.openConnection();
	        postConnection.setRequestMethod("POST");
	        postConnection.setRequestProperty("Content-Type", "application/json");
	        postConnection.setRequestProperty("Authorization",bareToken2);
	        postConnection.setDoOutput(true);

	        OutputStream os = postConnection.getOutputStream();
	        os.write(out);
	        os.flush();
	        
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
	        

	    return exportID;
	}

	private boolean poll(String groupId, Long reportId, String exportId, String token) throws IOException{	
		System.out.println("TERZO SERVICE");

	    HttpURLConnection con = null;
	    URL url = null;
	    String resultOutput ="";
	    Map<String, Object> jsonMap = null;

	    try {

	        url = new URL(URL2 +groupId+"/reports/"+reportId+"/exports/"+exportId);
	        con = (HttpURLConnection) url.openConnection();
	        con.setRequestMethod("GET");
	        String bareToken2 = "Bearer "+token;
	        con.setRequestProperty("Authorization",bareToken2);

	    }catch (IOException e) {
		        e.printStackTrace();
		    }catch (Exception e) {
		        e.printStackTrace();
		    }
	    int status = con.getResponseCode(); System.out.println(status);
	    ObjectMapper mapper = new ObjectMapper();
	    jsonMap = mapper.readValue(con.getInputStream(), Map.class);
	    System.out.println(jsonMap); con.disconnect();

	    String statusParam = (String)jsonMap.get("status");
	    if (statusParam.equals("Succeeded")){
	        return true;
	    }

	    return false;
	}
	
	
	private File downloadFile(String groupId, String reportId, String exportId, String token) throws Exception{
		System.out.println("QUARTO SERVICE");

	    HttpURLConnection con = null;
	    try {

	        URL url = new URL("https://api.powerbi.com/v1.0/myorg/groups/"+groupId+"/reports/"+reportId+"/exports/"+exportId+ "/file");
	        con = (HttpURLConnection) url.openConnection();
	        con.setRequestMethod("GET");
	        String bareToken2 = "Bearer "+token;
	        con.setRequestProperty("Authorization",bareToken2);

	    }catch (IOException e) {
	        e.printStackTrace();
	    }catch (Exception e) {
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
	
	}
	
	public File getReportFile(Long reportId, String format, String idPbiReport) throws Exception {
		logger.debug("getReportFile :: inizio");
		
		String token = getToken();
		logger.debug("getReportFile :: token :: " + token);
		
		String exportId = exportTo(GROUP_ID, idPbiReport, format, IDENTITY, token);
		logger.debug("getReportFile :: exportId :: " + exportId);
		
		boolean reportCompleted = false;
		
		while(!reportCompleted) {
			reportCompleted = poll(GROUP_ID, reportId, exportId, token);
			logger.debug("getReportFile :: poll :: reportCompleted :: " + reportCompleted);
			Thread.sleep(500);
		}
		
		File report = downloadFile(GROUP_ID, idPbiReport, exportId, token);
		logger.debug("getReportFile :: downloadFile :: " + report);
		
		return report;
	}
}
