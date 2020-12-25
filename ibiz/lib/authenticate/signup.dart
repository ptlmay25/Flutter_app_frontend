import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ibiz/authenticate/otpscreen.dart';
import 'package:ibiz/view/view.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _signUpFormKey = GlobalKey<FormState>();
  int flag = 1;
  String fname, lname,gender;
  DateTime birthday;
  @override
  Widget build(BuildContext context) {
    if (flag == 1) {
      return showNameWidget();
    } else if (flag == 2) {
      return showBirthWidget();
    } else if (flag == 3) {
      return showGenderWidget();
    }
  }

  Widget showNameWidget() {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 0, top: 20),
            child: Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                  icon: Icon(Icons.keyboard_arrow_left),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ),
          ),
          SizedBox(
            width: 180,
            height: 45,
            child: Text(
              "What's your name?",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xff151515),
                fontSize: 18,
              ),
            ),
          ),
          Text(
            "Enter the name you use in real life.",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xff151515),
              fontSize: 15,
              fontFamily: "Roboto",
              fontWeight: FontWeight.w300,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 96, left: 40, right: 20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: Form(
                      key: _signUpFormKey,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: TextFormField(
                              onChanged: (input) async {
                                setState(() {
                                  this.fname = input.trim();
                                });
                              },
                              decoration:
                                  InputDecoration(hintText: 'First Name*'),
                              validator: (input) {
                                if (input.isEmpty) {
                                  return 'Enter The First Name';
                                }
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: TextFormField(
                              onChanged: (input) async {
                                setState(() {
                                  this.lname = input.trim();
                                });
                              },
                              decoration:
                                  InputDecoration(hintText: 'Last Name*'),
                              validator: (input) {
                                if (input.isEmpty) {
                                  return 'Enter The Last Name';
                                }
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 70),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Container(
                                height: 45,
                                width: 200,
                                child: RaisedButton(
                                  onPressed: () {
                                    if (_signUpFormKey.currentState
                                        .validate()) {
                                      setState(() {
                                        flag = 2;
                                      });
                                    }
                                    print('First Name: ' + this.fname);
                                    print('Last Name: ' + this.lname);
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
            ),
          )
        ],
      ),
    );
  }

  Widget showBirthWidget() {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20),
            child: Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                  icon: Icon(Icons.keyboard_arrow_left),
                  onPressed: () {
                    setState(() {
                      flag = 1;
                    });
                  }),
            ),
          ),
          SizedBox(
            width: 240,
            height: 45,
            child: Text(
              "What's your date of birth?",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xff151515),
                fontSize: 18,
              ),
            ),
          ),
          SizedBox(
            width: 240,
            height: 20,
            child: Text(
              "Choose your date of birth.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xff151515),
                fontSize: 15,
                fontFamily: "Roboto",
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 60),
            child: SizedBox(
              height: 200,
              child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: DateTime.now(),
                  onDateTimeChanged: (datetime) {
                    setState(() {
                      this.birthday = datetime;
                    });
                  }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 60,left: 85,right: 90),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                height: 45,
                width: 40,
                child: RaisedButton(
                  onPressed: () {
                    if (birthday != null) {
                      setState(() {
                        flag = 3;
                      });
                    }
                    print('Birthday: ' + birthday.toString());
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
    );
  }

  Widget showGenderWidget() {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20),
            child: Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                  icon: Icon(Icons.keyboard_arrow_left),
                  onPressed: () {
                    setState(() {
                      flag = 2;
                    });
                  }),
            ),
          ),
          Text("Gender"),
        ],
      ),
    );
  }
}
