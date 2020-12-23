import 'package:flutter/material.dart';
import 'package:ibiz/authenticate/otpscreen.dart';
import 'package:ibiz/view/view.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _signUpFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
            scrollDirection: Axis.vertical,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 120),
            child: SizedBox(
              width: 100,
              height: 40,
              child: Text(
                "Profile",
                style: TextStyle(
                  color: Color(0xff151515),
                  fontSize: 24,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 20,right: 20),
            child: Form(
              key: _signUpFormKey,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: TextFormField(
                      validator: (input) {
                        if (input.isEmpty) {
                          return 'Enter your Full Name';
                        }
                      },
                      decoration: InputDecoration(hintText: 'Full Name*'),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.all(5),
                    child: TextFormField(
                      validator: (input) {
                        if (input.isEmpty) {
                          return 'Enter your City';
                        }
                      },
                      decoration: InputDecoration(hintText: 'City*'),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.all(5),
                    child: TextFormField(
                      validator: (input) {
                        if (input.isEmpty) {
                          return 'Enter your State';
                        }
                      },
                      decoration: InputDecoration(hintText: 'State*'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: TextFormField(
                      validator: (input) {
                        bool valid = RegExp(r"[0-9][0-9][0-9][0-9][0-9][0-9]")
                            .hasMatch(input);
                        if (!valid) {
                          return 'only 6-digits are allowed';
                        }
                      },
                      decoration: InputDecoration(hintText: 'Zipcode*'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Container(
                        height: 40,
                        width: 300,
                        child: RaisedButton(
                          onPressed: () async {
                            print("Next Pressed");
                            if (_signUpFormKey.currentState.validate()) {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>View()));
                              print('user fields validated');
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
              ),
            ),
          ),
        ],
      )),
    );
  }
}
