import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CurrencyConverter extends StatefulWidget {
  const CurrencyConverter({Key? key}) : super(key: key); // Constructor for the CurrencyConverter widget.

  @override
  _CurrencyConverterState createState() => _CurrencyConverterState(); // Creates the state for the CurrencyConverter widget.
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  Map<String, dynamic> conversionRates = {}; // Map to store the currency conversion rates fetched from the API.
  String amount = ""; // String to store the amount entered by the user.
  String fromCurrency = "CAD"; // String to store the selected currency to convert from.
  String toCurrency = "INR"; // String to store the selected currency to convert to.
  String result = ""; // String to store the converted amount.

  @override
  void initState() {
    super.initState();
    fetchConversionRates(); // Call the function to fetch conversion rates when the widget is initialized.
  }

  // Fetch data from the provided URL and set conversion rates
  void fetchConversionRates() async {
    try {
      final response = await http.get(
        Uri.parse("https://api.exchangeratesapi.io/v1/latest?access_key=6e8202ba3b24f80931a9b44ba11a4a77"),
      );
      final data = jsonDecode(response.body);
      if (data != null && data['rates'] is Map) {
        setState(() {
          conversionRates = data['rates']; // Update the conversionRates map with the fetched rates.
        });
      }
      // ignore: empty_catches
    } catch (error) {}
  }

  // Calculate and handle the currency conversion
  void handleConvert() {
    if (amount.isNotEmpty && conversionRates.containsKey(fromCurrency) && conversionRates.containsKey(toCurrency)) {
      final double convertedAmount = (double.parse(amount) / conversionRates[fromCurrency]) * conversionRates[toCurrency];
      setState(() {
        result = convertedAmount.toStringAsFixed(2); // Convert the result to a string with 2 decimal places.
      });
    } else {
      setState(() {
        result = "Invalid input"; // Show "Invalid input" if the user entered invalid data.
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Currency Converter')), // AppBar with a title for the Currency Converter page.
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DropdownButton<String>(
              value: fromCurrency, // Currently selected "from" currency.
              onChanged: (value) {
                setState(() {
                  fromCurrency = value!; // Update the "from" currency when the user selects a different currency.
                });
              },
              isExpanded: true,
              items: conversionRates.keys.map((currency) {
                return DropdownMenuItem<String>(
                  value: currency,
                  child: Center(child: Text(currency)), // Display the currency symbol in the dropdown menu.
                );
              }).toList(),
            ),
            DropdownButton<String>(
              value: toCurrency, // Currently selected "to" currency.
              onChanged: (value) {
                setState(() {
                  toCurrency = value!; // Update the "to" currency when the user selects a different currency.
                });
              },
              isExpanded: true,
              items: conversionRates.keys.map((currency) {
                return DropdownMenuItem<String>(
                  value: currency,
                  child: Center(child: Text(currency)), // Display the currency symbol in the dropdown menu.
                );
              }).toList(),
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Amount'), // Input text field with a label.
              keyboardType: TextInputType.number, // Show a numeric keyboard for entering the amount.
              onChanged: (value) {
                setState(() {
                  amount = value; // Update the amount when the user enters a value.
                });
              },
            ),
            ElevatedButton(
              onPressed: handleConvert, // When the button is pressed, it calls the handleConvert function.
              child: const Text('Convert'), // Button text.
            ),
            const SizedBox(height: 22), // Some spacing below the Convert button.
            Text(
              'Converted Amount: $result', // Display the converted amount.
              textAlign: TextAlign.center, // Center-align the text.
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold), // Text style for the converted amount.
            ),
          ],
        ),
      ),
    );
  }
}
