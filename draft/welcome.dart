import 'package:flutter/material.dart';
import 'package:ibiz/authScreen/otpscreen.dart';
import 'package:ibiz/size_config.dart';
//import 'package:sms_autofill/sms_autofill.dart';

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
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                  left: 5.1 * SizeConfig.widthMultiplier,
                  top: 6 * SizeConfig.heightMultiplier,
                  bottom: 4.19 * SizeConfig.heightMultiplier),
              child: Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                    icon: Icon(Icons.keyboard_arrow_left),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              ),
            ), //backButton
            Padding(
              padding: EdgeInsets.only(
                  right: 46.4 * SizeConfig.widthMultiplier,
                  left: 6.9 * SizeConfig.widthMultiplier),
              child: SizedBox(
                width: 41 * SizeConfig.widthMultiplier,
                height: 12 * SizeConfig.heightMultiplier,
                child: Text(
                  "Welcome Back",
                  style: TextStyle(
                    color: Color(0xff151515),
                    fontSize: 4.0 * SizeConfig.heightMultiplier,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ), //WelcomebackText
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(0),
                child: Form(
                    key: _loginFormKey,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                              left: 7.6 * SizeConfig.widthMultiplier,
                              right: 7.6 * SizeConfig.widthMultiplier,
                              top: 7.2 * SizeConfig.heightMultiplier),
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
                        ), //PhoneInput
                        Padding(
                          padding: EdgeInsets.only(
                              left: 14.6 * SizeConfig.widthMultiplier,
                              right: 14.8 * SizeConfig.widthMultiplier,
                              top: 7.2 * SizeConfig.heightMultiplier),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Container(
                              height: 4.8 * SizeConfig.heightMultiplier,
                              width: 51.2 * SizeConfig.widthMultiplier,
                              child: RaisedButton(
                                onPressed: () async {
                                  try {
                                    if (_loginFormKey.currentState.validate()) {
                                      // final signCode =
                                      //     await SmsAutoFill().getAppSignature;
                                      // print(signCode);
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
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
                                      fontSize:
                                          2.4 * SizeConfig.heightMultiplier),
                                ),
                              ),
                            ),
                          ),
                        ),//LoginButton
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
