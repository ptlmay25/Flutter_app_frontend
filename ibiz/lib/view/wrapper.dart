import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ibiz/authenticate/authenticate.dart';
import 'package:ibiz/view/view.dart';
import 'package:ibiz/models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final user=Provider.of<User>(context);

    // if(user == null){
    //   print("NULL USER");
    //   return Authenticate();
    // }else{
    //   return View();
    // }
    return Authenticate();
  }
}