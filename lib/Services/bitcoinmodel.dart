import 'dart:convert';
import 'package:http/http.dart' as http;

const apiKey = '05B86AC4-DAAE-46DD-81D9-B81F1D7861C9';
const bitcoinURL =
    'rest.coinapi.io/v1/exchangerate/BTC/USD?apikey=05B86AC4-DAAE-46DD-81D9-B81F1D7861C9';
var rate;
var decodedData;

class BitcoinModel {
  Future getData() async {
    http.Response response = await http.get(Uri.parse(bitcoinURL));
    if (response.statusCode == 200) {
      decodedData = jsonDecode(response.body);
      rate = decodedData['rate'];
    } else {
      print(response.statusCode);
    }
    return rate;
  }
}

// Future<dynamic> getCityWeather(String cityName) async {
//   NetworkHelper networkHelper = NetworkHelper(
//       '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric');
//
//   var weatherData = await networkHelper.getData();
//   return weatherData;
// }
//
// Future<dynamic> getLocationWeather() async {
//   Location location = Location();
//   await location.getCurrentLocation();
//
//   NetworkHelper networkHelper = NetworkHelper(
//       '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
//
//   var weatherData = await networkHelper.getData();
//   return weatherData;
// }