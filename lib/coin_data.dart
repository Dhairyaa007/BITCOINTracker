import 'dart:convert';
import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate/';
const apiKey = '05B86AC4-DAAE-46DD-81D9-B81F1D7861C9';

// const bitcoinURL =
//     'https://rest.coinapi.io/v1/exchangerate/BTC/USD?apikey=05B86AC4-DAAE-46DD-81D9-B81F1D7861C9';

class CoinData {
  var rate;
  var decodedData;

  Future getData(String cryptoCoin, String currencyCoin) async {
    http.Response response = await http.get(Uri.parse(
        'https://rest.coinapi.io/v1/exchangerate/$cryptoCoin/$currencyCoin?apikey=05B86AC4-DAAE-46DD-81D9-B81F1D7861C9'));
    if (response.statusCode == 200) {
      decodedData = jsonDecode(response.body);
      rate = decodedData['rate'];
    } else {
      print(response.statusCode);
    }
    return rate;
  }
}