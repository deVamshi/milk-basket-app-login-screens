import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_kitchen_cart_test/VIEWS/home_view.dart';
import 'package:my_kitchen_cart_test/VIEWS/otp_entry_view.dart';
import 'package:my_kitchen_cart_test/WIDGETS/appbar.dart';
import 'package:my_kitchen_cart_test/constants.dart';

class PhoneEntryView extends StatefulWidget {
  const PhoneEntryView({Key key}) : super(key: key);

  @override
  _PhoneEntryViewState createState() => _PhoneEntryViewState();
}

class _PhoneEntryViewState extends State<PhoneEntryView> {
  String number = "";
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
              "Please Enter\nYour Mobile Number",
              style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            VERTICALSPACING,
            SizedBox(
              width: width * 0.5,
              child: TextFormField(
                autofocus: true,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                keyboardType: TextInputType.phone,
                validator: (number) {
                  return number.length == 10
                      ? null
                      : "Enter a valid mobile number";
                },
                onChanged: (value) {
                  number = value;
                  if (number.length == 10) {
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
            Spacer(),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: PRIMARYCOLOR),
                onPressed: isFormValid
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (bc) => OTPEntryView(
                              number: number.trim(),
                            ),
                          ),
                        );
                      }
                    : null,
                child: Text(
                  "Continue",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            VERTICALSPACING,
            RichText(
              text: TextSpan(
                text: "I AGREE TO THE  ",
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 12,
                ),
                children: [
                  TextSpan(
                    text: 'PRIVACY POLICY',
                    style: TextStyle(
                      color: PRIMARYCOLOR,
                    ),
                  ),
                ],
              ),
            ),
            VERTICALSPACING
          ],
        ),
      ),
    );
  }
}
