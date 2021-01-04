import 'package:flutter/material.dart';
import 'package:ibiz/service/database/userdb.dart';

class Hometab extends StatefulWidget {
  @override
  _HometabState createState() => _HometabState();
}

class _HometabState extends State<Hometab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(icon: Icon(Icons.home), onPressed: (){
        Userdb().getUsers();
      }),
    );
  }
}
