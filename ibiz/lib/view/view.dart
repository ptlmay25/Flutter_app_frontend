import 'package:flutter/material.dart';
import 'package:ibiz/authScreen/signup.dart';
import 'package:ibiz/models/user.dart';
import 'package:ibiz/service/database/userdb.dart';
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
    return FutureBuilder(
      future: Userdb().checkUser(widget.user.contact),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          print(snapshot.data);
          if (snapshot.data == true) {
            return Home();
          } else {
            return SignUp(
              mobileNo: widget.user.contact,
            );
          }
        } else {
          return Scaffold(body: Align(
            alignment: Alignment.center,
            child: CircularProgressIndicator()));
        }
      },
    );
    // if ((Userdb().checkUser(widget.user.contact)) == true) {
    //   return SignUp(
    //     mobileNo: widget.user.contact,
    //   );
    // } else {
    //   return Home();
    // }
  }
}
