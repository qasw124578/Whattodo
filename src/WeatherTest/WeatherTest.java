package test;

import java.io.IOException;

public class WeatherTest {

	public static void main(String[] args) {
		try {
			WeatherRequest.sendGET();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
