import 'package:flutter/material.dart';
import 'package:ibiz/size_config.dart';

class HomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                top: 50 * SizeConfig.heightMultiplier,
                left: 15 * SizeConfig.widthMultiplier),
            child: ListTile(
              leading: SizedBox(
                  height: 50 * SizeConfig.heightMultiplier,
                  width: 50 * SizeConfig.widthMultiplier,
                  child: Image.asset("assets/icons/menubar_profile_pic.png")),
              title: Padding(
                padding: EdgeInsets.only(left: 13 * SizeConfig.widthMultiplier),
                child: SizedBox(
                  width: 200,
                  height: 20,
                  child: Text(
                    "Account ID: 11232",
                    style: TextStyle(
                      color: Color(0xff151515),
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              onTap: null,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: 42 * SizeConfig.heightMultiplier,
                left: 15 * SizeConfig.widthMultiplier),
            child: ListTile(
              leading: SizedBox(
                  height: 20 * SizeConfig.heightMultiplier,
                  width: 20 * SizeConfig.widthMultiplier,
                  child: Image.asset("assets/icons/user_icon.png")),
              title: Text(
                "Profile",
                style: TextStyle(
                  color: Color(0xff151515),
                  fontSize: 15,
                ),
              ),
              onTap: null,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15 * SizeConfig.widthMultiplier),
            child: ListTile(
              leading: SizedBox(
                  height: 20 * SizeConfig.heightMultiplier,
                  width: 20 * SizeConfig.widthMultiplier,
                  child: Image.asset("assets/icons/bank_building.png")),
              title: Text(
                "Bank Details",
                style: TextStyle(
                  color: Color(0xff151515),
                  fontSize: 15,
                ),
              ),
              onTap: null,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15 * SizeConfig.widthMultiplier),
            child: ListTile(
              leading: SizedBox(
                  height: 20 * SizeConfig.heightMultiplier,
                  width: 20 * SizeConfig.widthMultiplier,
                  child: Image.asset("assets/icons/clipboards.png")),
              title: Text(
                "Withdrawal History",
                style: TextStyle(
                  color: Color(0xff151515),
                  fontSize: 15,
                ),
              ),
              onTap: null,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15 * SizeConfig.widthMultiplier),
            child: ListTile(
              leading: SizedBox(
                  height: 20 * SizeConfig.heightMultiplier,
                  width: 20 * SizeConfig.widthMultiplier,
                  child: Image.asset("assets/icons/contact_us.png")),
              title: Text(
                "Contact Us",
                style: TextStyle(
                  color: Color(0xff151515),
                  fontSize: 15,
                ),
              ),
              onTap: null,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15 * SizeConfig.widthMultiplier),
            child: ListTile(
              leading: SizedBox(
                  height: 20 * SizeConfig.heightMultiplier,
                  width: 20 * SizeConfig.widthMultiplier,
                  child: Image.asset("assets/icons/user 1.png")),
              title: Text(
                "Logout",
                style: TextStyle(
                  color: Color(0xff151515),
                  fontSize: 15,
                ),
              ),
              onTap: null,
            ),
          )
        ],
      ),
    );
  }
}
