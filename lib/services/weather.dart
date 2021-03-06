import 'package:clima/location.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/utils/constants.dart';

class WeatherModel {
  Future getCityWeather(var typedName) async {
    String url = "$baseURL?q=$typedName&appid=$apiKey";

    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  Future getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    String url =
        "$baseURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey";

    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
