import 'package:flutter/material.dart';
import 'package:ibiz/service/auth.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 153, left: 132, right: 120),
            child: Text(
              "Home",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xff151515),
                fontSize: 36,
                fontFamily: "Brandon Grotesque",
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          IconButton(
              icon: Icon(Icons.logout),
              onPressed: () async {
                await AuthService().signOut();
              })
        ],
      ),
    );
  }
}
