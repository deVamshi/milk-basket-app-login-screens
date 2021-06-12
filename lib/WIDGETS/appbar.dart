import 'package:flutter/material.dart';

AppBar buildAppBar({String title = ""}) {
  return AppBar(
      leading: BackButton(
        color: Colors.black,
      ),
      backgroundColor: Colors.white,
      elevation: 0.0,
      title: Text(title));
}
