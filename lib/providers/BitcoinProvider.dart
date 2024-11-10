import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../models/BitcoinPrice.dart';

class CryptoApiProvider with ChangeNotifier {
  BitcoinPrice? _btcPrice;
  bool _isPriceLoaded = false;
  final String _apiUrl = 'https://api.coindesk.com/v1/bpi/currentprice.json';

  BitcoinPrice? get btcPrice => _btcPrice;
  bool get isPriceLoaded => _isPriceLoaded;

  getBitcoinPrice() async {
    final response = await http.get(Uri.parse(_apiUrl));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      _btcPrice = BitcoinPrice.fromJson(data);

      _isPriceLoaded = false;
      notifyListeners();
    }
  }
}