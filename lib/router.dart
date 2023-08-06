import 'package:assignment_4/currency_converter.dart';
import 'package:fluro/fluro.dart';
import 'home_page.dart';
import 'greeting_page.dart';
import 'tools_page.dart';

class AppRouter {
  // Create a static instance of FluroRouter to manage app navigation.
  static final FluroRouter router = FluroRouter();

  // Setup the app router with route definitions.
  static void setupRouter() {
    // Define the home page route
    router.define(
      '/',
      handler: Handler(handlerFunc: (context, params) => const HomePage()),
    );

    // Define the greeting page route
    router.define(
      '/greeting',
      handler: Handler(handlerFunc: (context, params) => GreetingPage()),
    );

    // Define the tools page route
    router.define(
      '/tools',
      handler: Handler(handlerFunc: (context, params) => ToolsPage()),
    );

    // Define the currency converter page route
    router.define(
      '/converter',
      handler: Handler(handlerFunc: (context, params) => const CurrencyConverter()),
    );
  }
}
