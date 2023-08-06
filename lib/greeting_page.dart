import 'package:flutter/material.dart';

class GreetingPage extends StatefulWidget {
  const GreetingPage({Key? key}) : super(key: key); // Constructor for the GreetingPage widget.

  @override
  _GreetingPageState createState() => _GreetingPageState(); // Creates the state for the GreetingPage widget.
}

class _GreetingPageState extends State<GreetingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Greetings Page')), // AppBar with a title for the Greetings page.
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome',
              style: TextStyle(
                fontSize: 36, // Text size.
                fontStyle: FontStyle.italic, // Italic text style.
                fontWeight: FontWeight.bold, // Bold text style.
              ),
            ),
            const SizedBox(height: 16), // Add some spacing between the texts and the image.
            const Text(
              'MDEV1005 Assignment-4',
              style: TextStyle(
                fontSize: 18, // Text size.
              ),
            ),
            const SizedBox(height: 16), // Add some more spacing between the texts and the image.
            const Text(
              'Project by Ronit Sanghvi',
              style: TextStyle(
                fontSize: 18, // Text size.
              ),
            ),
            const SizedBox(height: 16), // Add spacing between the texts and the image.
            Image.network(
              'https://imgs.search.brave.com/mnbVdZHvzHhm5A1fqFVyDVM2EK968yh8PaLPxGJbT2Y/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9pMC53/cC5jb20vcGljanVt/Ym8uY29tL3dwLWNv/bnRlbnQvdXBsb2Fk/cy9mb3Jlc3QtbmF0/dXJlLWZyZWUtcGhv/dG8uanBnP3c9NjAw/JnF1YWxpdHk9ODA',
              height: 230, // Image height.
            ),
          ],
        ),
      ),
    );
  }
}
