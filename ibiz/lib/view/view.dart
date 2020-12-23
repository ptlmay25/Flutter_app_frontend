import 'package:flutter/material.dart';

class View extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("IBIZ TODO"),),
      body: Container(
        child: Text("TODO"),
      ),
    );
  }
}