import 'package:flutter/material.dart';
import 'package:ibiz/authenticate/otpscreen.dart';
import 'package:sms_autofill/sms_autofill.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  String contact;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 50, bottom: 35),
              child: Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                    icon: Icon(Icons.keyboard_arrow_left),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 181, left: 27),
              child: SizedBox(
                width: 160,
                height: 100,
                child: Text(
                  "Welcome Back",
                  style: TextStyle(
                    color: Color(0xff151515),
                    fontSize: 34,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: Form(
                    key: _loginFormKey,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 30, right: 30, top: 60),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            validator: (input) {
                              if (input.length != 10) {
                                debugPrint('contact invalid');
                                return 'Enter 10-digit contact number';
                              }
                            },
                            onChanged: (input) {
                              setState(() => contact = input);
                            },
                            decoration:
                                InputDecoration(hintText: "Enter Phone Number"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 57, right: 58, top: 60),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Container(
                              height: 40,
                              width: 200,
                              child: RaisedButton(
                                onPressed: () async {
                                  try {
                                    if (_loginFormKey.currentState.validate()) {
                                      final signCode =
                                          await SmsAutoFill().getAppSignature;
                                      print(signCode);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => OTP(
                                                    contact: '+91' + contact,
                                                  )));
                                    }
                                  } catch (exception) {
                                    print(
                                        "_errorMESSAGEIS" + exception.message);
                                  }
                                },
                                color: Color.fromARGB(255, 66, 71, 112),
                                child: Text(
                                  'Log In',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
