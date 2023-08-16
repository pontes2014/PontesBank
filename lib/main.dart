import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/contacts_list.dart';
import 'package:flutter_application_1/screens/form_screen.dart';
import 'package:flutter_application_1/screens/initial_screen.dart';
import 'package:flutter_application_1/screens/login_screen.dart';
import 'package:flutter_application_1/screens/transfer_feed.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/dashboard': (context) => const DashboardScreen(),
        '/contacts': (context) => const ContactsList(),
        '/form': (context) => FormScreen(),
        '/feed': (context) => TransactionsList(),
      },
    );
  }
}
