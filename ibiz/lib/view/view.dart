import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ibiz/authScreen/signup.dart';
import 'package:ibiz/models/token.dart';
import 'package:ibiz/models/usermodel.dart';
import 'package:ibiz/service/database/tokendb.dart';
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
  void initState() {
    super.initState();
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  @override
  Widget build(BuildContext context) {
    // Future<UserModel> userModel = Userdb().getUserByMobileNo(widget.mobileNo);
    // Future<List<Token>> tokenList = TokenDb().getToken();
    return FutureBuilder(
      future: Userdb().getUserByMobileNo(widget.mobileNo),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        print("Inside view" + snapshot.data.toString());
        if (snapshot.hasData) {
          print("Inside View.dart "+snapshot.data.toString());
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
