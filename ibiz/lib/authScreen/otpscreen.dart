import 'package:flutter/material.dart';
import 'package:ibiz/main.dart';
import 'package:ibiz/service/auth.dart';
import 'package:ibiz/size_config.dart';
import 'package:sms_autofill/sms_autofill.dart';

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
  initState() {
    super.initState();
    print(widget.contact);
    _auth.verifyPhone(widget.contact);
    _listenOtp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  fontSize: (18) * SizeConfig.heightMultiplier,
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
                    fontSize: (13) * SizeConfig.heightMultiplier,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w300,
                  ),
                ),
              )), //Veryfy Text
          Padding(
            padding: EdgeInsets.only(
              left: 48 * SizeConfig.widthMultiplier,
              right: 48 * SizeConfig.widthMultiplier,
              top: 106 * SizeConfig.heightMultiplier,
            ),
            child: Form(
                key: _otpFormKey,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: 80 * SizeConfig.heightMultiplier),
                      child: PinFieldAutoFill(
                          codeLength: 6,
                          onCodeChanged: (val) {
                            this.smsCode = val;
                            print(val);
                          }),
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            left: 40 * SizeConfig.widthMultiplier,
                            right: 40 * SizeConfig.widthMultiplier),
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
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20 * SizeConfig.heightMultiplier),
                              ),
                            ),
                          ),
                        )),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 20 * SizeConfig.heightMultiplier,
                      ),
                      child: SizedBox(
                        width: 100 * SizeConfig.widthMultiplier,
                        child: InkWell(
                          onTap: () {
                            _auth.verifyPhone(widget.contact);
                            print("Resend OTp pressed");
                          },
                          child: Text(
                            "Resend code",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xff151515),
                              fontSize: 15 * SizeConfig.heightMultiplier,
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
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
  }

  // Future<void> login(_phoneAuthCredential) async {
  //   /// This method is used to login the user
  //   /// `AuthCredential`(`_phoneAuthCredential`) is needed for the signIn method
  //   /// After the signIn method from `AuthResult` we can get `FirebaserUser`(`_firebaseUser`)

  //   await FirebaseAuth.instance
  //       .signInWithCredential(_phoneAuthCredential)
  //       .then((AuthResult authRes) {
  //     print(authRes.user.toString());
  //   });
  // }
}
