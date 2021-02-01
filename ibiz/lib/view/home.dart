import 'package:flutter/material.dart';
import 'package:ibiz/models/usermodel.dart';
import 'package:ibiz/size_config.dart';
import 'package:ibiz/view/bottom/accounttab.dart';
import 'package:ibiz/view/bottom/hometab.dart';
import 'package:ibiz/view/bottom/searchtab.dart';
import 'package:ibiz/view/bottom/sharetab.dart';
import 'package:ibiz/view/drawer.dart';
import 'package:ibiz/view/navbar/notification.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  Home();
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
    final userModel = Provider.of<UserModel>(context);
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
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
        drawer: HomeDrawer(userModel: userModel),
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
            new Hometab(userModel: userModel),
            new Searchtab(),
            new Accounttab(userModel: userModel),
            new Sharetab(userModel: userModel)
          ],
        ));
  }
}
