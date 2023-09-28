import static org.junit.jupiter.api.Assertions.assertEquals;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;

import org.json.JSONException;
import org.json.JSONObject;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import org.mockito.Mock;

class PrevisaoTempoTest {

	private static final String PATH_JSON = "C:\\Users\\marce\\eclipse-workspace\\PrevisaoTempo\\src\\test\\resources\\";
	private static JSONObject response_200;
	private static JSONObject response_404;

	private PrevisaoTempo previsaoTempo = new PrevisaoTempo();
	
	@BeforeAll
	public static void setUp() throws IOException {
		
		// Carrega previsão MOCK do arquivo JSON em disco.
		try {
			String arquivo = new String(Files.readAllBytes(Paths.get(PATH_JSON+"response_200.json")));
	        response_200 = new JSONObject(arquivo);
		} catch (Exception e) {
			System.out.println("Arquivo 200 não encontrado");
		  }
		
		try {
			String arquivo = new String(Files.readAllBytes(Paths.get(PATH_JSON+"response_404.json")));
	        response_404 = new JSONObject(arquivo);
		} catch (Exception e) {
			System.out.println("Arquivo 404 não encontrado");
		  }
		
		//previsaoTempo = new PrevisaoTempo();
		
	}
	
	@Test
	public void testPrevisaoPorCidade() throws JSONException, IOException {
		
		String cidade_teste = "São Paulo";
		String pais_teste = "BR";
		
		JSONObject previsao = previsaoTempo.getForecastByCityName(cidade_teste);
    	
		String paisAPI = previsao.getJSONObject("city").getString("country");
    	String cidadeAPI = previsao.getJSONObject("city").getString("name");
    	
    	Assertions.assertAll("Verifica Cidade e País retornados pela API",
    		() -> assertEquals(cidade_teste, cidadeAPI),
    		() -> assertEquals(pais_teste, paisAPI)
    		);
	}
	
	
}