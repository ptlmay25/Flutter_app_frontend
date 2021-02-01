import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ibiz/authScreen/earn.dart';
import 'package:ibiz/authScreen/firefly.dart';
import 'package:ibiz/service/auth.dart';
import 'package:ibiz/view/home.dart';
import 'package:provider/provider.dart';
import 'package:ibiz/view/view.dart';
import 'package:ibiz/models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if (user == null) {
      print('Null User');
      return Earn();
    } else {
      print("UID: " + user.uid);
      return View(mobileNo: user.contact);
    }
  }
}
