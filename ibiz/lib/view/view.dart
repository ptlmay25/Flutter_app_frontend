import 'package:flutter/material.dart';
import 'package:ibiz/authenticate/signup.dart';
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
    if (widget.user.contact == "+8780546954") {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SignUp()));
    }
    return Container();
  }
}
