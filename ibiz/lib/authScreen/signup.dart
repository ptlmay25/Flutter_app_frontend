import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ibiz/main.dart';
import 'package:ibiz/service/auth.dart';
import 'package:ibiz/service/database/userdb.dart';
import 'package:ibiz/size_config.dart';
import 'package:ibiz/view/home.dart';
import 'package:ibiz/view/view.dart';
import 'package:ibiz/view/wrapper.dart';

class SignUp extends StatefulWidget {
  final String mobileNo;
  SignUp({this.mobileNo});
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _signUpFormKey = GlobalKey<FormState>();
  int flag = 1;
  String fname, lname, gender;
  DateTime birthday;
  int b = 0;

  void f1(int a) {
    setState(() {
      b = a;
    });
  }

  void f2() {
    if (b == 1) {
      gender = "Male";
    }
    if (b == 2) {
      gender = "Female";
    }
    if (b == 3) {
      gender = "Other";
    }
  }

  @override
  Widget build(BuildContext context) {
    if (flag == 1) {
      return showNameWidget();
    } else if (flag == 3) {
      return showBirthWidget();
    } else if (flag == 2) {
      return showGenderWidget();
    }
  }

  Widget showNameWidget() {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Padding(
            padding:
                EdgeInsets.only(left: 0, top: 20 * SizeConfig.heightMultiplier),
            child: Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                  icon: SizedBox(
                      height: 24,
                      width: 24,
                      child: Icon(Icons.keyboard_arrow_left)),
                  onPressed: () {
                    AuthService().signOut();
                  }),
            ),
          ),
          SizedBox(
            width: 180 * SizeConfig.widthMultiplier,
            height: 45 * SizeConfig.heightMultiplier,
            child: Text(
              "What's your name?",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xff151515),
                fontSize: (20) * SizeConfig.heightMultiplier,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Text(
            "Enter the name you use in real life.",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xff151515),
              fontSize: (14) * SizeConfig.heightMultiplier,
              fontFamily: "Roboto",
              fontWeight: FontWeight.w300,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: (96) * SizeConfig.heightMultiplier,
                left: (40) * SizeConfig.widthMultiplier,
                right: (20) * SizeConfig.widthMultiplier),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: Form(
                      key: _signUpFormKey,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                                top: 1 * SizeConfig.heightMultiplier,
                                bottom: 1 * SizeConfig.heightMultiplier,
                                left: 2 * SizeConfig.widthMultiplier,
                                right: 2 * SizeConfig.widthMultiplier),
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
                            padding: EdgeInsets.only(
                                top: 45 * SizeConfig.heightMultiplier),
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
                            padding: EdgeInsets.only(
                                top: (70) * SizeConfig.heightMultiplier),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  (5) * SizeConfig.heightMultiplier),
                              child: Container(
                                height: (45) * SizeConfig.heightMultiplier,
                                width: (200) * SizeConfig.widthMultiplier,
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
                                        fontWeight: FontWeight.normal,
                                        fontSize:
                                            (16) * SizeConfig.heightMultiplier),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
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
            padding: EdgeInsets.only(
                top: (20) * SizeConfig.heightMultiplier,
                bottom: (20) * SizeConfig.heightMultiplier,
                left: (20) * SizeConfig.widthMultiplier,
                right: (20) * SizeConfig.widthMultiplier),
            child: Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                  icon: SizedBox(
                      height: 24,
                      width: 24,
                      child: Icon(Icons.keyboard_arrow_left)),
                  onPressed: () {
                    setState(() {
                      flag = 2;
                    });
                  }),
            ),
          ),
          SizedBox(
            width: (240) * SizeConfig.widthMultiplier,
            height: (45) * SizeConfig.heightMultiplier,
            child: Text(
              "What's your date of birth?",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xff151515),
                fontSize: (18) * SizeConfig.heightMultiplier,
              ),
            ),
          ),
          SizedBox(
            width: (240) * SizeConfig.widthMultiplier,
            height: (20) * SizeConfig.heightMultiplier,
            child: Text(
              "Choose your date of birth.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xff151515),
                fontSize: (15) * SizeConfig.heightMultiplier,
                fontFamily: "Roboto",
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: (60) * SizeConfig.heightMultiplier),
            child: SizedBox(
              height: (200) * SizeConfig.heightMultiplier,
              child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: DateTime.parse("1985-01-01"),
                  maximumDate: DateTime.now(),
                  onDateTimeChanged: (datetime) {
                    setState(() {
                      this.birthday = datetime;
                    });
                  }),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: (60) * SizeConfig.heightMultiplier,
                left: (85) * SizeConfig.widthMultiplier,
                right: (90) * SizeConfig.widthMultiplier),
            child: ClipRRect(
              borderRadius:
                  BorderRadius.circular((5) * SizeConfig.heightMultiplier),
              child: Container(
                width: (40) * SizeConfig.widthMultiplier,
                height: (45) * SizeConfig.heightMultiplier,
                child: RaisedButton(
                  onPressed: () {
                    if (birthday != null) {
                      setState(() {
                        // db entry
                        //flag = 3;
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Home(),
                        ));
                      });
                    }
                    print('Birthday: ' + birthday.toString());
                  },
                  color: Color.fromARGB(255, 66, 71, 112),
                  child: Text(
                    'Next',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: (16) * SizeConfig.heightMultiplier),
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
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                top: (20) * SizeConfig.heightMultiplier,
                bottom: (20) * SizeConfig.heightMultiplier,
                left: (20) * SizeConfig.widthMultiplier,
                right: (20) * SizeConfig.widthMultiplier),
            child: Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                  icon: SizedBox(
                      height: 24,
                      width: 24,
                      child: Icon(Icons.keyboard_arrow_left)),
                  onPressed: () {
                    setState(() {
                      flag = 1;
                    });
                  }),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: (68) * SizeConfig.widthMultiplier,
                right: (67) * SizeConfig.widthMultiplier),
            child: Center(
              child: SizedBox(
                height: (45) * SizeConfig.heightMultiplier,
                child: Text(
                  "What's your gender?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff151515),
                    fontSize: (20) * SizeConfig.heightMultiplier,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(top: (30) * SizeConfig.heightMultiplier),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                        left: (30) * SizeConfig.widthMultiplier),
                    child: Radio(
                      value: 1,
                      groupValue: b,
                      onChanged: (v) {
                        f1(v);
                      },
                      activeColor: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: (10) * SizeConfig.widthMultiplier),
                    child: Text(
                      "Male",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: (16) * SizeConfig.heightMultiplier,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  )
                ],
              )),
          Padding(
            padding: EdgeInsets.only(top: (2) * SizeConfig.heightMultiplier),
            child: Row(
              children: <Widget>[
                Padding(
                  padding:
                      EdgeInsets.only(left: (30) * SizeConfig.widthMultiplier),
                  child: Radio(
                    value: 2,
                    groupValue: b,
                    onChanged: (v) {
                      f1(v);
                    },
                    activeColor: Colors.black,
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: (10) * SizeConfig.widthMultiplier),
                  child: SizedBox(
                    width: (120) * SizeConfig.widthMultiplier,
                    height: (18) * SizeConfig.heightMultiplier,
                    child: Text(
                      "Female",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: (16) * SizeConfig.heightMultiplier,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: (2) * SizeConfig.heightMultiplier),
            child: Row(
              children: <Widget>[
                Padding(
                  padding:
                      EdgeInsets.only(left: (30) * SizeConfig.widthMultiplier),
                  child: Radio(
                    value: 3,
                    groupValue: b,
                    onChanged: (v) {
                      f1(v);
                    },
                    activeColor: Colors.black,
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: (10) * SizeConfig.widthMultiplier),
                  child: SizedBox(
                    width: (120) * SizeConfig.widthMultiplier,
                    height: (18) * SizeConfig.heightMultiplier,
                    child: Text(
                      "Other",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: (16) * SizeConfig.heightMultiplier,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: (63) * SizeConfig.heightMultiplier,
                left: (85) * SizeConfig.widthMultiplier,
                right: (90) * SizeConfig.widthMultiplier),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                width: (200) * SizeConfig.widthMultiplier,
                height: (45) * SizeConfig.heightMultiplier,
                child: RaisedButton(
                  onPressed: () async {
                    f2();
                    print(gender);
                    //Todo Database Entry
                    bool result = await Userdb().addUser(widget.mobileNo,
                        this.fname + " " + this.lname, this.gender);
                    if (result == true) {
                      print("User Created");
                      //Navigator.of(context as Element).reassemble();
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              View(mobileNo: widget.mobileNo)));
                    }
                  },
                  color: Color.fromARGB(255, 66, 71, 112),
                  child: Text(
                    'Next',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: (16) * SizeConfig.heightMultiplier),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
