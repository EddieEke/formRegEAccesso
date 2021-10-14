# formRegEAccesso
Una piccola web app in Spring Boot con l'accesso, la registrazione e il MyAccount utilizzando le 4 operazioni CRUD

public File getReportFile(Long reportId, String format) throws InterruptedException, IOException {
		logger.debug("getReportFile :: inizio");
		
		String token = getToken();
		logger.debug("getReportFile :: token :: " + token);
		
		String exportId = exportTo(GROUP_ID, reportId, format, IDENTITY);
		logger.debug("getReportFile :: exportId :: " + exportId);
		
		boolean reportCompleted = false;
		
		while(!reportCompleted) {
			reportCompleted = poll(GROUP_ID, reportId, exportId);
			logger.debug("getReportFile :: poll :: reportCompleted :: " + reportCompleted);
			Thread.sleep(500);
		}
		
		File report = downloadFile(GROUP_ID, reportId, exportId);
		logger.debug("getReportFile :: downloadFile :: " + report);
		
		return report;
	}
