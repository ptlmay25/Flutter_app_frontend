import 'package:flutter/material.dart';
import 'package:ibiz/authScreen/signup.dart';
import 'package:ibiz/models/usermodel.dart';
import 'package:ibiz/service/database/userdb.dart';
import 'package:ibiz/view/home.dart';
import 'package:provider/provider.dart';

class View extends StatefulWidget {
  final String mobileNo;
  View({this.mobileNo});
  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<View> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Userdb().getUserByMobileNo(widget.mobileNo),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          // print("Inside View.dart "+snapshot.data.toString());
          if (snapshot.data != 0) {
            return ChangeNotifierProvider<UserModel>.value(
                value: snapshot.data, child: Home());
          } else {
            return SignUp(
              mobileNo: widget.mobileNo,
            );
          }
        } else {
          return Scaffold(
              body: Align(
                  alignment: Alignment.center,
                  // child: Home()));
                  child: CircularProgressIndicator()));
        }
      },
    );
    // return Home(mobileNo: widget.mobileNo);
  }
}
