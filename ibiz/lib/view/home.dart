import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ibiz/size_config.dart';
import 'package:ibiz/view/bottom/AccountTab/accounttab.dart';
import 'package:ibiz/view/bottom/HomeTab/hometab.dart';
import 'package:ibiz/view/bottom/SearchTab/searchtab.dart';
import 'package:ibiz/view/bottom/ShareTab/sharetab.dart';
import 'package:ibiz/view/drawer.dart';
import 'package:ibiz/view/navbar/notification.dart';


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
    SystemChannels.textInput.invokeMethod('TextInput.hide');
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
        drawer: HomeDrawer(),
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
            new Hometab(),
            new Searchtab(),
            new Accounttab(),
            new Sharetab()
          ],
        ));
  }
}
