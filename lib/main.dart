import 'package:flutter/material.dart';
import 'package:my_kitchen_cart_test/VIEWS/authenticate_view.dart';
import 'package:my_kitchen_cart_test/VIEWS/phone_entry_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: Colors.white, elevation: 0.0),
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.blue,
      ),
      home: AuthenticateView(),
    );
  }
}
