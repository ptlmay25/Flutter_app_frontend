import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:ibiz/authenticate/otpscreen.dart';
import 'package:ibiz/service/auth.dart';

class Greet extends StatefulWidget {
  final int state;
  Greet({Key key, this.state}) : super(key: key);
  @override
  _GreetState createState() => _GreetState();
}

class _GreetState extends State<Greet> {
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  String contact;
  String phoneNo, verificationId, smsCode;
  bool codeSent = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(child: greetPadding(widget.state)),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 50, right: 50, top: 0),
                child: Form(
                    key: _loginFormKey,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          child: TextFormField(
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
                          padding:
                              const EdgeInsets.only(left: 8, right: 8, top: 20),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Container(
                              height: 40,
                              width: 300,
                              child: RaisedButton(
                                onPressed: () async {
                                  try {
                                    if (_loginFormKey.currentState.validate()) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => OTP(
                                                  contact: '+91' + contact,
                                                  state: widget.state)));
                                    }
                                  } catch (exception) {
                                    print(
                                        "_errorMESSAGEIS" + exception.message);
                                  }
                                },
                                color: Color.fromARGB(255, 66, 71, 112),
                                child: Text(
                                  'Verify',
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

  Padding greetPadding(int state) {
    if (state == 1) {
      return Padding(
        padding: const EdgeInsets.only(top: 80, right: 100),
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
      );
    } else if (state == 2) {
      return Padding(
        padding: const EdgeInsets.only(top: 80, right: 100),
        child: SizedBox(
          width: 160,
          height: 100,
          child: Text(
            "Get Started",
            style: TextStyle(
              color: Color(0xff151515),
              fontSize: 34,
              fontFamily: "Roboto",
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      );
    }
  }
}
