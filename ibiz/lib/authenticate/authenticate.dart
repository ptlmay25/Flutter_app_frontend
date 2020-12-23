import 'package:flutter/material.dart';
import 'package:ibiz/authenticate/greet.dart';
import 'package:ibiz/authenticate/signup.dart';

class Authenticate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
                top: 200, left: 100, right: 100, bottom: 100),
            child: Text(
              "App Name",
              style: TextStyle(
                  fontSize: 36,
                  fontStyle: FontStyle.normal,
                  color: Color.fromRGBO(21, 21, 21, 50)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 300, left: 30, right: 30),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Container(
                      height: 40,
                      width: 300,
                      child: RaisedButton(
                        onPressed: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Greet(state: 1)));
                        },
                        color: Color.fromARGB(255, 21, 21, 21),
                        child: Text(
                          'Log In',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Container(
                      height: 40,
                      width: 300,
                      child: RaisedButton(
                        onPressed: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Greet(state: 2)));
                        },
                        color: Color.fromARGB(255, 21, 21, 21),
                        child: Text(
                          'Sign UP',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
