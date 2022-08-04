import 'package:bitcoin_ticker/assets/constants/constants.dart';
import 'package:bitcoin_ticker/price_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bitcoin Ticker',
      theme: Constants.kThemeData, // Constants.kSuccessMsg
      /* color: Colours.kColour, */
      home: const PriceScreen(),
    );
  }
}
