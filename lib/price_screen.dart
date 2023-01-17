import 'package:flutter/material.dart';
import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  const PriceScreen({super.key});

  @override
  PriceScreenState createState() => PriceScreenState();
}

class PriceScreenState extends State<PriceScreen> {
  String BTCValue = '?';
  String ETHValue = '?';
  String LTCValue = '?';
  String selectedCurrency = currenciesList.first;
  String updatedCurrency = '?';
  CoinData coinData = CoinData();

  void getBTCData() async {
    try {
      double data = await CoinData().getData('BTC', selectedCurrency);
      setState(() {
        BTCValue = data.toStringAsFixed(0);
        print(BTCValue);
      });
    } catch (e) {
      print(e);
    }
  }

  void getETHData() async {
    try {
      double data = await CoinData().getData('ETH', selectedCurrency);
      setState(() {
        ETHValue = data.toStringAsFixed(0);
        print(ETHValue);
      });
    } catch (e) {
      print(e);
    }
  }

  void getLTCData() async {
    try {
      double data = await CoinData().getData('LTC', selectedCurrency);
      setState(() {
        LTCValue = data.toStringAsFixed(0);
        print(LTCValue);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getBTCData();
    getETHData();
    getLTCData();
  }

  List<DropdownMenuItem<String>> getDropdownMenuItems() {
    List<DropdownMenuItem<String>> dropdownItemList = [];
    for (String currency in currenciesList) {
      var newValue = DropdownMenuItem(
        value: currency,
        child: Text(currency),
      );
      dropdownItemList.add(newValue);
    }
    return dropdownItemList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'CRYPTO TRACKER',
          style: TextStyle(
            color: const Color(0xFFEA047E),
            fontWeight: FontWeight.bold,
            fontFamily: 'BebasNeue',
            fontSize: 25,
            letterSpacing: 3,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                width: 350.0,
                height: 70,
                padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                child: Card(
                  borderOnForeground: true,
                  color: const Color(0xFF7900FF),
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '1 BTC =  $BTCValue $selectedCurrency',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: 350.0,
                height: 70,
                padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                child: Card(
                  color: const Color(0xFF7900FF),
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      '1 ETH =  $ETHValue $selectedCurrency',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: 350.0,
                height: 70,
                padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                child: Card(
                  color: const Color(0xFF7900FF),
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      '1 LTC =  $LTCValue $selectedCurrency',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 150.0,
                alignment: Alignment.center,
                padding: const EdgeInsets.only(bottom: 30.0),
                color: const Color(0xFF191919),
                child: Container(
                  margin: EdgeInsets.all(10.0),
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(
                      color: const Color(0xFF00FFD1),
                      width: 3,
                    ),
                  ),
                  child: DropdownButton<String>(
                      underline: Container(
                        height: 0,
                        color: const Color(0xFF191919),
                      ),
                      // dropdownColor: const Color(0xFFDFF5C3),
                      borderRadius: BorderRadius.circular(10),
                      menuMaxHeight: 250.0,
                      hint: const Text('Select Currency'),
                      style: const TextStyle(
                        color: const Color(0xFFEA047E),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      icon: const Icon(
                        Icons.arrow_drop_down_circle_rounded,
                        color: Color(0xFFEA047E),
                        size: 30,
                      ),
                      value: selectedCurrency,
                      onChanged: (String? value) {
                        setState(() {
                          selectedCurrency = value!;
                          getBTCData();
                          getETHData();
                          getLTCData();
                        });
                      },
                      items: getDropdownMenuItems()),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}