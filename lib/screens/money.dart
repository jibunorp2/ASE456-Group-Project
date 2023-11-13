import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Money extends StatefulWidget {
  const Money({Key? key}) : super(key: key);

  @override
  State<Money> createState() => _MoneyState();
}

class _MoneyState extends State<Money> {
  double _leftAmount = 0.0;
  double _rightAmount = 0.0;
  String _leftCurrency = 'USD';
  String _rightCurrency = 'EUR';

  final _leftController = TextEditingController();
  final _rightController = TextEditingController();

  List<String> currencyList = [
    'USD',
    'EUR',
    'GBP',
    'JPY',
    'AUD',
    'CAD',
    'CHF',
    'CNY',
    'SEK',
    'NZD',
    'KRW',
    'SGD',
    'INR',
    'BRL',
    'ZAR',
    'MXN',
    'HKD',
    'RUB',
    'TRY',
    'NOK',
    'DKK',
    'AED',
    'SAR',
    'THB',
  ];

  final apiKey = 'f794ffd8b3f030b47e1b';

  Future<double> convertCurrencies(
      String fromCurrency, String toCurrency, double amount) async {
    final apiUrl =
        Uri.https('api.apilayer.com', '/currency_conversion/v1/convert', {
      'from': fromCurrency,
      'to': toCurrency,
      'amount': amount.toString(),
    });

    try {
      final response = await http.get(
        apiUrl,
        headers: {
          'api-key': apiKey,
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final convertedAmount = data['result'];
        return convertedAmount.toDouble();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      return 0.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final double boxWidth = MediaQuery.of(context).size.width * 0.4;
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: boxWidth,
                  child: DropdownButton<String>(
                    value: _leftCurrency,
                    isExpanded: true,
                    items: currencyList.map((String currency) {
                      return DropdownMenuItem<String>(
                        value: currency,
                        child: Center(child: Text(currency)),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _leftCurrency = newValue!;
                      });
                    },
                  ),
                ),
                SizedBox(
                  width: boxWidth,
                  child: TextField(
                    controller: _leftController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Amount',
                    ),
                    onChanged: (String value) async {
                      if (value.isEmpty) return;
                      final convertedAmount = await convertCurrencies(
                          _leftCurrency, _rightCurrency, _leftAmount);
                      setState(() {
                        _leftAmount = double.parse(value);
                        _rightAmount = convertedAmount;
                        _leftController.text = value;
                        _rightController.text = convertedAmount.toString();
                      });
                    },
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: boxWidth,
                  child: DropdownButton<String>(
                    value: _rightCurrency,
                    isExpanded: true,
                    items: currencyList.map((String currency) {
                      return DropdownMenuItem<String>(
                        value: currency,
                        child: Center(child: Text(currency)),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _rightCurrency = newValue!;
                      });
                    },
                  ),
                ),
                SizedBox(
                  width: boxWidth,
                  child: TextField(
                    controller: _rightController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Amount',
                    ),
                    onChanged: (String value) async {
                      if (value.isEmpty) return;
                      final convertedAmount = await convertCurrencies(
                          _rightCurrency, _leftCurrency, _rightAmount);
                      setState(() {
                        _rightAmount = double.parse(value);
                        _leftAmount = convertedAmount;
                        _leftController.text = convertedAmount.toString();
                        _rightController.text = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
