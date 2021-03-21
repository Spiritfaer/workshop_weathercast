import './fetch.dart';
import './weather_api_helper.dart';

class WeatherFetch {
  Future<dynamic> getWeatherByCoord(double lat, double lon) async {
    FetchHelper fetchData = FetchHelper(getWeatherByCoordRequest(lat, lon));
    dynamic decodedData = await fetchData.getData();
    return decodedData;
  }

  Future<dynamic> getWeatherByName(String cityName) async {
    FetchHelper fetchData = FetchHelper(getWeatherByNameRequest(cityName));
    dynamic decodedData = await fetchData.getData();
    return decodedData;
  }

  Future<dynamic> getWeatherByCoordAllInOne(double lat, double lon) async {
    FetchHelper fetchData =
        FetchHelper(getWeatherByCoordRequestAllInOne(lat, lon));
    dynamic decodedData = await fetchData.getData();
    return decodedData;
  }

  Future<dynamic> getWetherByNameAllInOne(String cityName) async {
    FetchHelper fetchData =
        FetchHelper(getWeatherByNameRequestAllInOne(cityName));
    dynamic decodedData = await fetchData.getData();
    return decodedData;
  }
}
