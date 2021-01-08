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
    controller = new TabController(length: 5, vsync: this);
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
          leading: Builder(builder: (context) {
            return IconButton(
              icon: SizedBox(
                height: 25 * SizeConfig.heightMultiplier,
                width: 25 * SizeConfig.widthMultiplier,
                child: new Image.asset("assets/icons/menu_bar.png"),
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
            );
          }),
          backgroundColor: Color.fromARGB(255, 66, 71, 112),
          title: Padding(
            padding: EdgeInsets.only(
              top: 15 * SizeConfig.heightMultiplier,
              bottom: 14.3 * SizeConfig.heightMultiplier,
              left: 65 * SizeConfig.widthMultiplier,
            ),
            child: SizedBox(
                height: 34.71 * SizeConfig.heightMultiplier,
                width: 100 * SizeConfig.widthMultiplier,
                child: Image.asset("assets/icons/name.png")),
          ),
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
                    child: new Image.asset("assets/icons/search30px.png",
                        fit: BoxFit.fitHeight))),
            new Tab(
                icon: SizedBox(
                    height: 30 * SizeConfig.heightMultiplier,
                    width: 30 * SizeConfig.widthMultiplier,
                    child: new Image.asset("assets/icons/scan_code30px.png",
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
            new Scantab(),
            new Accounttab(),
            new Sharetab()
          ],
        )
        // bottomNavigationBar: BottomNavigationBar(
        //   type: BottomNavigationBarType.fixed,
        //   backgroundColor: Colors.white,
        //   items: [
        //     BottomNavigationBarItem(
        //       icon: SizedBox(
        //           height: 25 * SizeConfig.heightMultiplier,
        //           width: 25 * SizeConfig.widthMultiplier,
        //           child: new Image.asset("assets/icons/home.png")),
        //       title: Container(
        //         height: 8,
        //         child: Text(
        //           "Home",
        //           textAlign: TextAlign.center,
        //           style: TextStyle(
        //             color: Color(0xff151515),
        //             fontSize: 9,
        //           ),
        //         ),
        //       ),
        //     ),
        //     BottomNavigationBarItem(
        //       icon: SizedBox(
        //           height: 25 * SizeConfig.heightMultiplier,
        //           width: 25 * SizeConfig.widthMultiplier,
        //           child: new Image.asset("assets/icons/search 1.png")),
        //       title: Container(
        //         height: 8,
        //         child: Text(
        //           "Search",
        //           textAlign: TextAlign.center,
        //           style: TextStyle(
        //             color: Color(0xff151515),
        //             fontSize: 9,
        //           ),
        //         ),
        //       ),
        //     ),
        //     BottomNavigationBarItem(
        //       icon: SizedBox(
        //           height: 25 * SizeConfig.heightMultiplier,
        //           width: 25 * SizeConfig.widthMultiplier,
        //           child: new Image.asset("assets/icons/Focus 2.png")),
        //       title: Container(
        //         height: 8,
        //         child: SizedBox(
        //           width: 70,
        //           height: 20,
        //           child: Text(
        //             "Scan Code",
        //             textAlign: TextAlign.center,
        //             style: TextStyle(
        //               color: Color(0xff151515),
        //               fontSize: 9,
        //             ),
        //           ),
        //         ),
        //       ),
        //     ),
        //     BottomNavigationBarItem(
        //       icon: SizedBox(
        //           height: 25 * SizeConfig.heightMultiplier,
        //           width: 25 * SizeConfig.widthMultiplier,
        //           child: new Image.asset("assets/icons/profile pic.png")),
        //       title: Container(
        //         height: 8,
        //         child: SizedBox(
        //           width: 70,
        //           height: 20,
        //           child: Text(
        //             "Account",
        //             textAlign: TextAlign.center,
        //             style: TextStyle(
        //               color: Color(0xff151515),
        //               fontSize: 9,
        //             ),
        //           ),
        //         ),
        //       ),
        //     ),
        //     BottomNavigationBarItem(
        //       icon: SizedBox(
        //           height: 25 * SizeConfig.heightMultiplier,
        //           width: 25 * SizeConfig.widthMultiplier,
        //           child: new Image.asset("assets/icons/Invite friends.png")),
        //       title: Container(
        //         height: 8,
        //         child: SizedBox(
        //           width: 70,
        //           height: 20,
        //           child: Text(
        //             "Share",
        //             textAlign: TextAlign.center,
        //             style: TextStyle(
        //               color: Color(0xff151515),
        //               fontSize: 9,
        //             ),
        //           ),
        //         ),
        //       ),
        //     )
        //   ],
        // ),
        );
  }
}
