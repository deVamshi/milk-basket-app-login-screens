import 'package:flutter/material.dart';
import 'package:my_kitchen_cart_test/WIDGETS/appbar.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Home Page"),
      ),
    );
  }
}
