const String weatherMapURL = "https://api.openweathermap.org/data/2.5/weather";
const String weatherMapURLAllInOne =
    "https://api.openweathermap.org/data/2.5/onecall";

const openWeatherMapKey = "6311ebe8a26de4e3e58fa0a38fb75f79";

String getWeatherIconBigRequest(iconCode) =>
    "http://openweathermap.org/img/wn/$iconCode@4x.png";

String getWeatherIconMediumRequest(iconCode) =>
    "http://openweathermap.org/img/wn/$iconCode@2x.png";

String getWeatherIconSmallRequest(iconCode) =>
    "http://openweathermap.org/img/wn/$iconCode.png";

String getWeatherByCoordRequest(lat, lon) =>
    "$weatherMapURL?lat=$lat&lon=$lon&appid=$openWeatherMapKey&units=metric";

String getWeatherByNameRequest(cityName) =>
    "$weatherMapURL?q=$cityName&appid=$openWeatherMapKey&units=metric";

String getWeatherByCoordRequestAllInOne(lat, lon) =>
    "$weatherMapURLAllInOne?lat=$lat&lon=$lon&appid=$openWeatherMapKey&units=metric";

String getWeatherByNameRequestAllInOne(cityName) =>
    "$weatherMapURLAllInOne?q=$cityName&appid=$openWeatherMapKey&units=metric";
