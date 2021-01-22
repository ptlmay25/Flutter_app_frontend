import 'package:flutter/material.dart';
import 'package:ibiz/models/usermodel.dart';
import 'package:ibiz/size_config.dart';
import 'package:ibiz/view/navbar/notification.dart';
import 'package:ibiz/view/drawer.dart';

class Sharetab extends StatefulWidget {
  final UserModel userModel;
  Sharetab({this.userModel});
  @override
  _SharetabState createState() => _SharetabState();
}

class _SharetabState extends State<Sharetab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 64,
        leading: Builder(builder: (context) {
          return IconButton(
            icon: SizedBox(
              height: 50 * SizeConfig.heightMultiplier,
              width: 25 * SizeConfig.widthMultiplier,
              child: new Image.asset("assets/icons/menu_bar.png"),
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          );
        }),
        backgroundColor: Color.fromARGB(255, 66, 71, 112),
        // title: Padding(
        //   padding: EdgeInsets.only(
        //     top: 15 * SizeConfig.heightMultiplier,
        //     bottom: 14.3 * SizeConfig.heightMultiplier,
        //     left: 65 * SizeConfig.widthMultiplier,
        //   ),
        //   child: SizedBox(
        //       height: 34.71 * SizeConfig.heightMultiplier,
        //       width: 100 * SizeConfig.widthMultiplier,
        //       child: Image.asset("assets/icons/name.png")),
        // ),
        actions: [
          Padding(
            padding: EdgeInsets.only(
              right: 5 * SizeConfig.widthMultiplier,
            ),
            child: IconButton(
              icon: Image.asset("assets/icons/Notification.png"),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Notification_Page()));
              },
            ),
          ),
        ],
      ),
      drawer: HomeDrawer(userModel: widget.userModel),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 120 * SizeConfig.heightMultiplier),
            child: Image.asset("assets/images/Share pic.png"),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30 * SizeConfig.heightMultiplier),
            child: Text(
              "Invite Friends & Earn More",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 100 * SizeConfig.heightMultiplier,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                height: 40 * SizeConfig.heightMultiplier,
                width: 200 * SizeConfig.widthMultiplier,
                child: RaisedButton(
                  onPressed: () async {},
                  color: Color.fromARGB(255, 66, 71, 112),
                  child: Text(
                    'Invite',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 16 * SizeConfig.heightMultiplier),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
