import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_kitchen_cart_test/VIEWS/home_view.dart';
import 'package:my_kitchen_cart_test/VIEWS/phone_entry_view.dart';
import 'package:my_kitchen_cart_test/WIDGETS/appbar.dart';
import 'package:my_kitchen_cart_test/constants.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  String number = "";
  String password = "";
  bool isFormValid = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Text(
              "Log In",
              style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: width * 0.5,
              child: TextFormField(
                autofocus: true,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                keyboardType: TextInputType.phone,
                onChanged: (value) {
                  number = value;
                  if (number.length == 10 && password.isNotEmpty) {
                    setState(() {
                      isFormValid = true;
                    });
                  }
                },
                maxLength: 10,
                decoration: InputDecoration(
                  counterText: "",
                  hintText: "Phone Number",
                  hintStyle: TextStyle(color: Colors.grey[500]),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: PRIMARYCOLOR),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: width * 0.5,
              child: TextFormField(
                onChanged: (value) {
                  password = value;
                  if (number.length == 10 && password.isNotEmpty) {
                    setState(() {
                      isFormValid = true;
                    });
                  }
                },
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Your Password",
                  hintStyle: TextStyle(color: Colors.grey[500]),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: PRIMARYCOLOR),
                  ),
                ),
              ),
            ),
            Spacer(),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: PRIMARYCOLOR),
                onPressed: isFormValid
                    ? () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (bc) => HomeView()));
                      }
                    : null,
                child: Text(
                  "Log In",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (bc) => PhoneEntryView()));
              },
              child: Text(
                "LOGIN WITH OTP",
                style: TextStyle(
                    color: PRIMARYCOLOR,
                    fontWeight: FontWeight.bold,
                    fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
