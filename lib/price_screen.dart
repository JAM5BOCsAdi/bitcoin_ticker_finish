import 'dart:io' show Platform;

import 'package:bitcoin_ticker/coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PriceScreen extends StatefulWidget {
  const PriceScreen({Key? key}) : super(key: key);

  @override
  State<PriceScreen> createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = "USD";

  DropdownButton<String> androidDropdownButton() {
    List<DropdownMenuItem<String>> dropdownItems = [];

    for (String currency in CoinDataLists.currenciesList) {
      DropdownMenuItem<String> newItem = DropdownMenuItem(
        value: currency,
        child: Text(currency),
      );
      dropdownItems.add(newItem);
    }
    return DropdownButton<String>(
      value: selectedCurrency,
      items: dropdownItems,
      onChanged: (newValue) {
        setState(() {
          selectedCurrency = newValue!;
          print(newValue);
        });
      },
    );
  }

  CupertinoPicker iOSCupertinoPicker() {
    List<Text> pickerItems = [];
    for (String currency in CoinDataLists.currenciesList) {
      pickerItems.add(Text(currency));
    }
    return CupertinoPicker(
      itemExtent: 32.0,
      backgroundColor: Colors.lightBlue,
      onSelectedItemChanged: (selectedIndex) {
        print(selectedIndex);
      },
      children: pickerItems,
    );
  }

/*
  Widget getPicker() {
    if (Platform.isIOS) {
      return iOSCupertinoPicker();
    } else if (Platform.isAndroid) {
      return androidDropdownButton();
    } else {
      return throw Exception("Not an Android or IOS Device");
    }
  }
*/

  @override
  Widget build(BuildContext context) {
    /*getDropdownItems();*/

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('🤑 Coin Ticker'),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
              child: Card(
                color: Colors.lightBlueAccent,
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                  child: Text(
                    '1 BTC = ? USD',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 150.0,
              alignment: Alignment.center,
              padding: const EdgeInsets.only(bottom: 30.0),
              color: Colors.lightBlue,
              child: Platform.isIOS ? iOSCupertinoPicker() : androidDropdownButton(),
            ),
          ],
        ),
      ),
    );
  }
}
