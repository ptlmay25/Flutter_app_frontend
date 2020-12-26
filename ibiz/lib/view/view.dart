import 'package:flutter/material.dart';
import 'package:ibiz/authScreen/signup.dart';
import 'package:ibiz/models/user.dart';
import 'package:ibiz/view/home.dart';

class View extends StatefulWidget {
  final User user;
  View({this.user});
  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<View> {
  @override
  Widget build(BuildContext context) {
    // return Container(
    //   child: Text("View"),
    // );
    if (widget.user.contact == "+918780546954") {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Home()));
      return Container(
        child: Text("View"),
      );
    } else {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => SignUp()));
      return Container(
        child: Text("View"),
      );
    }
  }
  // @override
  // Widget build(BuildContext context) {
  //   if (widget.user.contact == "+918780546954") {
  //     return SignUp();
  //   } else {
  //     return Home();
  //   }
  // }
}
