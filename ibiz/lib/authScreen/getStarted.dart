import 'package:flutter/material.dart';
import 'package:ibiz/authScreen/otpscreen.dart';
import 'package:ibiz/size_config.dart';
// import 'package:sms_autofill/sms_autofill.dart';
import 'package:sms_otp_auto_verify/sms_otp_auto_verify.dart';
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
            padding: EdgeInsets.only(
                left: 30 * SizeConfig.widthMultiplier,
                top: 50 * SizeConfig.heightMultiplier,
                bottom: 20 * SizeConfig.heightMultiplier),
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
                left: 33 * SizeConfig.widthMultiplier,
                right: 182 * SizeConfig.widthMultiplier),
            child: SizedBox(
              width: 160 * SizeConfig.widthMultiplier,
              height: 100 * SizeConfig.heightMultiplier,
              child: Text(
                "Get \nStarted",
                style: TextStyle(
                  color: Color(0xff151515),
                  fontSize: 34 * SizeConfig.heightMultiplier,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ), //GetStarted_Text
          Padding(
            padding: EdgeInsets.only(
                top: 65 * SizeConfig.heightMultiplier,
                left: 40 * SizeConfig.widthMultiplier,
                right: 20 * SizeConfig.widthMultiplier),
            child: Form(
                key: _formkey,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(0.0),
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
                    ), //PhoneInput
                    Padding(
                      padding: EdgeInsets.only(
                          top: 88 * SizeConfig.heightMultiplier,
                          left: 88 * SizeConfig.widthMultiplier,
                          right: 88 * SizeConfig.widthMultiplier),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Container(
                          height: 45 * SizeConfig.heightMultiplier,
                          width: 200 * SizeConfig.widthMultiplier,
                          child: RaisedButton(
                            onPressed: () async {
                              try {
                                if (_formkey.currentState.validate()) {
                                  final signCode =
                                      // await SmsAutoFill().getAppSignature;
                                      await SmsRetrieved.getAppSignature();
                                  print(signCode);
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => OTP(
                                            contact: '+91' + this.phone_number,
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
                    ), //NextButton
                  ],
                )),
          )
        ],
      )),
    );
  }
}
