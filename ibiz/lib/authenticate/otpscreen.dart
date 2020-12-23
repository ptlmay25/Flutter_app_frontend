import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ibiz/authenticate/signup.dart';
import 'package:ibiz/service/auth.dart';
import 'package:ibiz/view/view.dart';

class OTP extends StatefulWidget {
  final String contact;
  final int state;
  OTP({Key key,this.state, this.contact}) : super(key: key);
  @override
  _OTPState createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  String verificationId, smsCode;
  bool codeSent = false;
  final GlobalKey<FormState> _otpFormKey = GlobalKey<FormState>();
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.contact);
    verifyPhone(widget.contact);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              width: 260,
              child: Text(
                "Verify Phone Number",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff151515),
                  fontSize: 18,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: 300,
                child: Text(
                  "Enter 6 digit verification code sent to \n${widget.contact}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff151515),
                    fontSize: 13,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w300,
                  ),
                ),
              )),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Form(
                key: _otpFormKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        onChanged: (input) {
                          setState(() => smsCode = input.trim());
                        },
                        decoration: InputDecoration(hintText: "OTP"),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Container(
                            height: 40,
                            width: 300,
                            child: RaisedButton(
                              onPressed: () async {
                                if (_otpFormKey.currentState.validate()) {
                                  if(widget.state==1){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>View()));
                                  }
                                  else if(widget.state==2){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
                                  }
                                }
                                print("OTP_Submit PRESSED");
                              },
                              color: Color.fromARGB(255, 66, 71, 112),
                              child: Text(
                                'Submit',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                          ),
                        )),
                  ],
                )),
          )
        ],
      )),
    );
  }

  Future<bool> signIn(context) async {
    var result = await AuthService().signInWithOtp(smsCode, verificationId);
    return result;
  }

  //sent otp on given PhoneNumber
  Future<void> verifyPhone(String phoneNumber) async {
    final PhoneVerificationCompleted verified = (AuthCredential authResult) {
      AuthService().signIn(authResult);
    };

    final PhoneVerificationFailed verificationFailed =
        (AuthException authException) {
      print('${authException.message}');
    };

    final PhoneCodeSent smsOTPSent = (String verId, [int forceCodeResend]) {
      this.verificationId = verId;
      setState(() {
        this.codeSent = true;
      });
    };

    final PhoneCodeAutoRetrievalTimeout autoTimeOut = (String verId) {
      this.verificationId = verId;
    };
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: const Duration(seconds: 30),
        verificationCompleted: verified,
        verificationFailed: verificationFailed,
        codeSent: smsOTPSent,
        codeAutoRetrievalTimeout: autoTimeOut);
  }
}
