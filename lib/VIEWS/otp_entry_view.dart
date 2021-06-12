import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_kitchen_cart_test/VIEWS/home_view.dart';
import 'package:my_kitchen_cart_test/WIDGETS/appbar.dart';
import 'package:my_kitchen_cart_test/constants.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class OTPEntryView extends StatefulWidget {
  String number;
  OTPEntryView({Key key, this.number}) : super(key: key);

  @override
  _OTPEntryViewState createState() => _OTPEntryViewState();
}

class _OTPEntryViewState extends State<OTPEntryView> {
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
              "Enter OTP",
              style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "One Time Password sent to ${widget.number}",
              style: TextStyle(
                color: Colors.grey[700],
              ),
            ),
            VERTICALSPACING,
            OTPTextField(
              length: 4,
              width: MediaQuery.of(context).size.width,
              fieldWidth: 50,
              style: TextStyle(fontSize: 17),
              textFieldAlignment: MainAxisAlignment.start,
              fieldStyle: FieldStyle.underline,
              onCompleted: (pin) {
                setState(() {
                  isFormValid = true;
                });
              },
            ),
            VERTICALSPACING,
            Row(
              children: [
                Expanded(
                    child: Text(
                  "Didn't receive OTP throught text message?",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
                const SizedBox(
                  width: 10,
                ),
                OutlineButton(
                  borderSide: BorderSide(
                    color: PRIMARYCOLOR,
                  ),
                  onPressed: () {},
                  child: Text(
                    "CALL INSTEAD",
                    style: TextStyle(
                        color: PRIMARYCOLOR, fontWeight: FontWeight.bold),
                  ),
                )
              ],
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
                  "Verify & Proceed",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            VERTICALSPACING,
          ],
        ),
      ),
    );
  }
}
