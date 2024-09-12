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

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
  }

  Future<double> convertCurrencies(
      String fromCurrency, String toCurrency, double amount) async {
    const apiKey = '5a77f3fdb7781f9a7584';
    final q = '${fromCurrency}_$toCurrency';
    final apiUrl = Uri.https('free.currconv.com', '/api/v7/convert', {
      'q': q,
      'compact': 'ultra',
      'apiKey': apiKey,
    });

    try {
      final response = await http.get(apiUrl);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final convertedAmount = data[q].toDouble() * amount;
        return convertedAmount.toDouble();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      _showSnackBar("API Error. Please try again later.");
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
                    onSubmitted: (String value) async {
                      if (value.isEmpty) return;
                      try {
                        double inputValue = double.parse(value);
                        if (inputValue <= 0) {
                          throw const FormatException(
                              "Input must be a positive number");
                        }
                        _leftAmount = inputValue;
                        final convertedAmount = await convertCurrencies(
                            _leftCurrency, _rightCurrency, _leftAmount);
                        setState(() {
                          _rightAmount = convertedAmount;
                          _leftController.text = value;
                          _rightController.text = convertedAmount.toString();
                        });
                      } catch (e) {
                        _showSnackBar(
                            "Invalid input. Please enter a positive number.");
                      }
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
                    onSubmitted: (String value) async {
                      if (value.isEmpty) return;

                      try {
                        double inputValue = double.parse(value);
                        if (inputValue <= 0) {
                          throw const FormatException(
                              "Input must be a positive number");
                        }
                        _rightAmount = inputValue;
                        final convertedAmount = await convertCurrencies(
                            _rightCurrency, _leftCurrency, _rightAmount);
                        setState(() {
                          _leftAmount = convertedAmount;
                          _rightController.text = value;
                          _leftController.text = convertedAmount.toString();
                        });
                      } catch (e) {
                        _showSnackBar(
                            "Invalid input. Please enter a positive number.");
                      }
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
