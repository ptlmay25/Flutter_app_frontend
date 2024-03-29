import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ibiz/main.dart';
import 'package:ibiz/service/auth.dart';
import 'package:ibiz/size_config.dart';
import 'package:sms_autofill/sms_autofill.dart';
// import 'package:sms_otp_auto_verify/sms_otp_auto_verify.dart';

class OTP extends StatefulWidget {
  final String contact;

  OTP({Key key, this.contact}) : super(key: key);
  @override
  _OTPState createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  String smsCode;
  //String verificatioId;
  bool codeSent = false;
  final GlobalKey<FormState> _otpFormKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();
  Timer _timer;
  ValueNotifier<int> _counter = ValueNotifier<int>(60);
  initState() {
    super.initState();
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    print(widget.contact);
    _auth.verifyPhone(widget.contact);
    _startTimer();
    _listenOtp();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_counter.value > 0) {
        _counter.value -= 1;
      } else {
        _timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //SystemChannels.textInput.invokeMethod('TextInput.hide');
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                left: 57 * SizeConfig.widthMultiplier,
                right: 57 * SizeConfig.widthMultiplier,
                top: 98 * SizeConfig.heightMultiplier,
                bottom: 30 * SizeConfig.heightMultiplier),
            child: SizedBox(
              width: 260 * SizeConfig.widthMultiplier,
              child: Text(
                "Verify Your Phone Number",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff151515),
                  fontSize: (20) * SizeConfig.heightMultiplier,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(
                left: 67 * SizeConfig.widthMultiplier,
                right: 68 * SizeConfig.widthMultiplier,
              ),
              child: SizedBox(
                width: 76.9 * SizeConfig.widthMultiplier,
                child: Text(
                  "Enter 6 digit verification code sent to \n${widget.contact}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff151515),
                    fontSize: (14) * SizeConfig.heightMultiplier,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w300,
                  ),
                ),
              )), //Veryfy Text
          Padding(
            padding: EdgeInsets.only(
              // left: 48 * SizeConfig.widthMultiplier,
              // right: 48 * SizeConfig.widthMultiplier,
              top: 106 * SizeConfig.heightMultiplier,
            ),
            child: Form(
                key: _otpFormKey,
                child: Column(
                  children: [
                    Padding(
                        padding: EdgeInsets.only(
                            bottom: 80 * SizeConfig.heightMultiplier,
                            left: 48 * SizeConfig.widthMultiplier,
                            right: 48 * SizeConfig.widthMultiplier),
                        // child: TextFieldPin(
                        //   codeLength: 6,
                        //   // onCodeChanged: (val) {
                        //   //   this.smsCode = val;
                        //   //   print(val);
                        //   // }
                        //   onOtpCallback: (code, isAutofill) {
                        //     this.smsCode = code;
                        //   },
                        // ),
                        child: PinFieldAutoFill(
                          codeLength: 6,
                          onCodeSubmitted: (val) {
                            this.smsCode = val;
                            print(val);
                          },
                        )),
                    Padding(
                        padding: EdgeInsets.only(
                            left: 88 * SizeConfig.widthMultiplier,
                            right: 88 * SizeConfig.widthMultiplier),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Container(
                            height: (40) * SizeConfig.heightMultiplier,
                            width: (300) * SizeConfig.widthMultiplier,
                            child: RaisedButton(
                              onPressed: () async {
                                try {
                                  if (_otpFormKey.currentState.validate()) {
                                    dynamic res =
                                        await _auth.signInWithOtp(smsCode);
                                    print(res);
                                    //main();
                                    // print(result.toString());
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => MyApp()));
                                  }
                                  print("OTP_Submit PRESSED");
                                  //print("verId: " + this.verificationId);
                                  print("smsCode: " + this.smsCode);
                                } catch (error) {
                                  print("_errorMESSAGEIS" + error.message);
                                }
                              },
                              color: Color.fromARGB(255, 66, 71, 112),
                              child: Text(
                                'Verify',
                                style: TextStyle(
                                    fontFamily: "Roboto",
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 16 * SizeConfig.heightMultiplier),
                              ),
                            ),
                          ),
                        )),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 20 * SizeConfig.heightMultiplier,
                      ),
                      child: ValueListenableBuilder(
                        valueListenable: _counter,
                        builder:
                            (BuildContext context, int value, Widget child) {
                          return SizedBox(
                            child: (_counter.value > 0)
                                ? InkWell(
                                    child: Text("Resend code in " +
                                        _counter.value.toString() +
                                        "sec"))
                                : InkWell(
                                    onTap: () {
                                      _auth.verifyPhone(widget.contact);
                                      print("Resend OTp pressed");
                                      setState(() {
                                        _counter.value = 60;
                                        _startTimer();
                                      });
                                    },
                                    child: Text(
                                      "Resend code",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xff151515),
                                        fontSize:
                                            16 * SizeConfig.heightMultiplier,
                                        fontFamily: "Roboto",
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ),
                          );
                        },
                      ),
                    )
                  ],
                )),
          )
        ],
      )),
    );
  }

  //sent otp on given PhoneNumber
  // Future verifyPhone(String phoneNumber) async {
  //   final PhoneVerificationCompleted verified = (AuthCredential authResult) {
  //     _auth.signIn(authResult);
  //   };

  //   final PhoneVerificationFailed verificationFailed =
  //       (AuthException authException) {
  //     print('PhoneVerificationFailed ${authException.message}');
  //   };

  //   final PhoneCodeSent smsOTPSent = (String verId, [int forceCodeResend]) {
  //     this.verificationId = verId;
  //     setState(() {
  //       this.codeSent = true;
  //     });
  //   };

  //   final PhoneCodeAutoRetrievalTimeout autoTimeOut = (String verId) {
  //     this.verificationId = verId;
  //   };
  //   await FirebaseAuth.instance.verifyPhoneNumber(
  //       phoneNumber: phoneNumber,
  //       timeout:  Duration(seconds: 60),
  //       verificationCompleted: verified,
  //       verificationFailed: verificationFailed,
  //       codeSent: smsOTPSent,
  //       codeAutoRetrievalTimeout: autoTimeOut);
  // }

  void _listenOtp() async {
    await SmsAutoFill().listenForCode;
    print("Listining");
  }
}
