import 'package:cloma/services/location.dart';
import 'package:cloma/services/networking.dart';
import 'package:cloma/utilities/api_key.dart';

const opnWeatherUrl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityname) async {
    NetworkHelp networkHelp =
        NetworkHelp('$opnWeatherUrl?q=$cityname&appid=$appid&units=metric');
    var cityWeatherData = await networkHelp.getData();
    return cityWeatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    NetworkHelp networkHelp = NetworkHelp(
        '$opnWeatherUrl?lat=${location.latitute}&lon=${location.longitute}&appid=$appid&units=metric');
    var weatherData = await networkHelp.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
