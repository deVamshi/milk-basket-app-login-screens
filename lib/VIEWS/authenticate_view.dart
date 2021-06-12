import 'package:flutter/material.dart';
import 'package:my_kitchen_cart_test/VIEWS/home_view.dart';
import 'package:my_kitchen_cart_test/VIEWS/login_view.dart';
import 'package:my_kitchen_cart_test/VIEWS/society_select_view.dart';
import 'package:my_kitchen_cart_test/constants.dart';

class AuthenticateView extends StatelessWidget {
  const AuthenticateView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(),
          Image.asset(
            'assets/images/milk_logo.png',
            width: MediaQuery.of(context).size.width * 0.7,
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: PRIMARYCOLOR),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (bc) => SocietySelectView()));
                },
                child: Text(
                  "Sign Up",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          // Login text
          TextButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (bc) => LoginView()));
            },
            child: RichText(
              text: TextSpan(
                text: "Have an account?  ",
                style: TextStyle(color: Colors.grey[700], fontSize: 12),
                children: [
                  TextSpan(
                    text: 'LOG IN',
                    style: TextStyle(
                      color: PRIMARYCOLOR,
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (bc) => HomeView()));
            },
            child: Text(
              "I JUST WANNA EXPLORE",
              style: TextStyle(color: Colors.grey[400], fontSize: 10),
            ),
          ),

          VERTICALSPACING,
        ],
      ),
    );
  }
}
