import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key); // Constructor for the HomePage widget.

  @override
  _HomePageState createState() => _HomePageState(); // Creates the state for the HomePage widget.
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')), // AppBar with a title for the Home page.
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange, // Button background color.
                foregroundColor: Colors.white, // Button text color.
                textStyle: const TextStyle(fontSize: 24), // Button text size.
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15), // Button padding.
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Button border radius.
                  side: const BorderSide(color: Colors.orange), // Button border color.
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/greeting',
                );
              },
              child: const Text('Greeting Page'), // Button text.
            ),
            const SizedBox(height: 20), // Some spacing between the buttons.
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                textStyle: const TextStyle(fontSize: 24),
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(color: Colors.blue),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/tools',
                );
              },
              child: const Text('Tool-1: To Do List'), // Button text.
            ),
            const SizedBox(height: 20), // Some spacing between the buttons.
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                textStyle: const TextStyle(fontSize: 24),
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(color: Colors.green),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/converter',
                );
              },
              child: const Text('Tool-2: Currency Converter'), // Button text.
            ),
          ],
        ),
      ),
    );
  }
}
