
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;

public class WeatherRequest {
	
//	private static final String END_POINT = "http://apis.skplanetx.com/weather/forecast/3days?lat=37.5714&lon=126.9658&version=1";
	private static final String APP_KEY = "c93ab0e6ebef559a78615a5dc266a5fd";
	private static final String END_POINT = "http://api.openweathermap.org/data/2.5/weather?lat=64.2008413&lon=-149.4936733&APPID=" + APP_KEY;
	
	public static void sendGET() throws IOException {
		CloseableHttpClient httpClient = HttpClients.createDefault();
		HttpGet httpGet = new HttpGet(END_POINT);
		CloseableHttpResponse httpResponse = httpClient.execute(httpGet);

		System.out.println("GET Response Status:: "
				+ httpResponse.getStatusLine().getStatusCode());

		BufferedReader reader = new BufferedReader(new InputStreamReader(
				httpResponse.getEntity().getContent()));

		String inputLine;
		StringBuffer response = new StringBuffer();

		while ((inputLine = reader.readLine()) != null) {
			response.append(inputLine);
		}
		reader.close();

		// print result
		System.out.println(response.toString());
		httpClient.close();
	}
	
	
}
