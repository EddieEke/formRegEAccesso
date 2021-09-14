package com.silicondev.fiscalCodeValidator;

import java.io.IOException;
import java.nio.charset.Charset;

//import org.apache.commons.io.IOUtils;
import org.apache.commons.io.IOUtils;


public class FiscalCodeValidatorTest {

    private static final String CODICE_ISTAT_COMUNI_CSV1 = "csv/codice-istat-comuni.csv";
    private static final String CODICE_ISTAT_COMUNI_CSV2 = "csv/codice-istat-comuni-big.csv";
    private static FiscalCodeConf conf1;
    private static FiscalCodeConf conf2;
    private static FiscalCodeConf conf3;
    private int maxComuneNameLength = 25;


    private String readLocalFile(String filePath) throws IOException {
        try {
            ClassLoader classLoader = this.getClass().getClassLoader();
            return IOUtils.toString(classLoader.getResource(filePath), Charset.forName("UTF-8"));
        } catch (IOException ex) {
            throw ex;
        }
    }

    public void init() throws IOException {
        String codiciIstatStr = readLocalFile(CODICE_ISTAT_COMUNI_CSV1);

        conf1 = FiscalCodeValidator.getFiscalCodeConf(codiciIstatStr, maxComuneNameLength, "M", 8, 10,
                3, 5, 0, 2);
        conf2 = FiscalCodeValidator.getFiscalCodeConf(codiciIstatStr, maxComuneNameLength, "M", 2, 4, 5,
                7, 8, 10);
        conf3 = FiscalCodeValidator.getFiscalCodeConf(codiciIstatStr, 0, "M", 2, 4, 5, 7, 8, 10);
    }

    public void init2() throws IOException {
        String codiciIstatStr = readLocalFile(CODICE_ISTAT_COMUNI_CSV2);

        conf1 = FiscalCodeValidator.getFiscalCodeConf(codiciIstatStr, maxComuneNameLength, "M", 8, 10,
                3, 5, 0, 2);
        conf2 = FiscalCodeValidator.getFiscalCodeConf(codiciIstatStr, maxComuneNameLength, "M", 2, 4, 5,
                7, 8, 10);
        conf3 = FiscalCodeValidator.getFiscalCodeConf(codiciIstatStr, 0, "M", 2, 4, 5, 7, 8, 10);
    }



    public static boolean verifyFiscalCodeUser( String surname, String name, String birthDate, String townOfBirth, String gender, String expected){
            String[] codes = FiscalCodeValidator.calcoloCodiceFiscale(conf1, surname, name, birthDate,
                    townOfBirth, gender);


        return arrayContains(codes, expected);
    }

    private static boolean arrayContains(String[] array, final String expected) {
        boolean found = false;
        for (String val : array) {
            if (expected.equals(val)) {
                found = true;
                break;
            }
        }
        return found;
    }


}
