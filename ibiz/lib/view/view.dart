import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ibiz/authenticate/signup.dart';
import 'package:ibiz/models/user.dart';
import 'package:ibiz/service/auth.dart';

import 'home.dart';

class View extends StatefulWidget {
  final User user;
  View({this.user});
  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<View> {
  @override
  Widget build(BuildContext context) {
    print("Phone: " + widget.user.contact);
    String initRoute = "";
    if (widget.user.contact != '+919429016756') {
      initRoute = "signup";
    } else {
      initRoute = "home";
    }
    print('Init: '+initRoute);
    return MaterialApp(
      initialRoute: initRoute,
      routes: {
        'home': (context) => Home(),
        'signup': (context) => SignUp(),
      },
    );
  }
}
