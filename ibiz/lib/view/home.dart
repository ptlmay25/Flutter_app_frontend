import 'package:flutter/material.dart';
import 'package:ibiz/models/usermodel.dart';
import 'package:ibiz/size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibiz/view/bottom/accounttab.dart';
import 'package:ibiz/view/bottom/hometab.dart';
import 'package:ibiz/view/bottom/scantab.dart';
import 'package:ibiz/view/bottom/searchtab.dart';
import 'package:ibiz/view/bottom/sharetab.dart';
import 'package:ibiz/view/drawer.dart';
import 'package:ibiz/view/navbar/notification.dart';

class Home extends StatefulWidget {
  Home({this.userModel});
  final UserModel userModel;
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController controller;
  @override
  void initState() {
    super.initState();
    controller = new TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Material(
          color: Colors.white,
          child: new TabBar(controller: controller, tabs: <Tab>[
            new Tab(
                icon: SizedBox(
                    height: 30 * SizeConfig.heightMultiplier,
                    width: 30 * SizeConfig.widthMultiplier,
                    child: new Image.asset("assets/icons/home30px.png",
                        fit: BoxFit.fitHeight))),
            new Tab(
                icon: SizedBox(
                    height: 30 * SizeConfig.heightMultiplier,
                    width: 30 * SizeConfig.widthMultiplier,
                    child: new Image.asset("assets/icons/Business30px.png",
                        fit: BoxFit.fitHeight))),
            new Tab(
                icon: SizedBox(
                    height: 30 * SizeConfig.heightMultiplier,
                    width: 30 * SizeConfig.widthMultiplier,
                    child: new Image.asset("assets/icons/account30px.png",
                        fit: BoxFit.fitHeight))),
            new Tab(
                icon: SizedBox(
                    height: 30 * SizeConfig.heightMultiplier,
                    width: 30 * SizeConfig.widthMultiplier,
                    child: new Image.asset("assets/icons/invite_friend30px.png",
                        fit: BoxFit.fitHeight))),
          ]),
        ),
        body: new TabBarView(
          controller: controller,
          children: <Widget>[
            new Hometab(userModel: widget.userModel),
            new Searchtab(),
            new Accounttab(userModel: widget.userModel),
            new Sharetab(userModel: widget.userModel)
          ],
        ));
  }
}
