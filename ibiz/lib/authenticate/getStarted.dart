import 'package:flutter/material.dart';
import 'package:ibiz/authenticate/otpscreen.dart';
import 'package:sms_autofill/sms_autofill.dart';

class GetStarted extends StatefulWidget {
  @override
  _GetStartedState createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  final _formkey = GlobalKey<FormState>();
  String phone_number, invitation_code;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        scrollDirection: Axis.vertical,
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
            padding: const EdgeInsets.only(left: 33, right: 182),
            child: SizedBox(
              width: 160,
              height: 100,
              child: Text(
                "Get \nStarted",
                style: TextStyle(
                  color: Color(0xff151515),
                  fontSize: 34,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 65, left: 40, right: 20),
            child: Form(
                key: _formkey,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: TextFormField(
                        decoration: InputDecoration(hintText: "Phone Number*"),
                        onChanged: (value) {
                          setState(() {
                            this.phone_number = value;
                          });
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Please Enter Phone Number";
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 45),
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText:
                                "Invitation Code                                 Optional"),
                        onChanged: (value) {
                          setState(() {
                            this.invitation_code = value;
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 80, left: 85, right: 90),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Container(
                          height: 45,
                          width: 200,
                          child: RaisedButton(
                            onPressed: () async {
                              try {
                                if (_formkey.currentState.validate()) {
                                  final signCode =
                                      await SmsAutoFill().getAppSignature;
                                  print(signCode);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => OTP(
                                                contact:
                                                    '+91' + this.phone_number,
                                              )));
                                }
                              } catch (exception) {
                                print("_errorMESSAGEIS" + exception.message);
                              }
                            },
                            color: Color.fromARGB(255, 66, 71, 112),
                            child: Text(
                              'Next',
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
          )
        ],
      )),
    );
  }
}
