import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ibiz/authenticate/signup.dart';
import 'package:ibiz/models/user.dart';
import 'package:ibiz/service/auth.dart';

class View extends StatefulWidget {
  final User user;
  View({this.user});
  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<View> {
  
  @override
  Widget build(BuildContext context) {
    print(widget.user.contact);
    if(widget.user.contact!='+919427643688'){
      return SignUp();
    }else{
      return Container(child: Text(widget.user.contact),);
    }
    
    //Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
  }
}
