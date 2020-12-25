import 'package:flutter/material.dart';
import 'package:ibiz/service/auth.dart';
import 'package:ibiz/view/wrapper.dart';
import 'package:provider/provider.dart';

import 'authenticate/signup.dart';
import 'models/user.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: missing_required_param
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
  // @override
  // Widget build(BuildContext context){
  //   return MaterialApp(home: SignUp());
  // }
}
