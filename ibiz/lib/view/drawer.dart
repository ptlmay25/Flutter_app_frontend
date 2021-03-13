import 'package:flutter/material.dart';
import 'package:ibiz/main.dart';
import 'package:ibiz/models/WithdrawHistory.dart';
import 'package:ibiz/models/usermodel.dart';
import 'package:ibiz/service/auth.dart';
import 'package:ibiz/service/database/userdb.dart';
import 'package:ibiz/service/database/witdhrawhistorydb.dart';
import 'package:ibiz/size_config.dart';
import 'package:ibiz/view/navbar/BankInfo.dart';
import 'package:ibiz/view/navbar/contact_us.dart';
import 'package:ibiz/view/navbar/profile.dart';
import 'package:ibiz/view/navbar/withdrawal_history.dart';
import 'package:provider/provider.dart';

class HomeDrawer extends StatelessWidget {
  HomeDrawer();
  @override
  Widget build(BuildContext context) {
    UserModel userModel = Provider.of<UserModel>(context);
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
                  child: (userModel.imageUrl != '')
                      ? CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage: NetworkImage(userModel.imageUrl),
                        )
                      : CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/icons/user_icon.png"))),
              title: Padding(
                padding: EdgeInsets.only(left: 13 * SizeConfig.widthMultiplier),
                child: SizedBox(
                  width: 200,
                  height: 60,
                  child: Text(
                    "Account ID: ${userModel.mobileNo}",
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
              onTap: () async {
                // UserModel userModel=await Userdb().getUserByMobileNo('+918780546954');
                // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Profile(userModel:userModel)));
                // print(userModel.mobileNo);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ChangeNotifierProvider.value(
                        value: userModel, child: Profile())));
              },
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
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ChangeNotifierProvider.value(
                        value: userModel, child: BankInfo())));
              },
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
              onTap: () async {
                List<WithdrawHistory> data =
                    await WithdrawHistoryDb().getWithdrawList(id: userModel.id);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        Withdraw_History(userModel: userModel, data: data)));
              },
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
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ChangeNotifierProvider.value(
                        value: userModel, child: Contact_Us())));
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15 * SizeConfig.widthMultiplier),
            child: ListTile(
              leading: SizedBox(
                  height: 20 * SizeConfig.heightMultiplier,
                  width: 20 * SizeConfig.widthMultiplier,
                  child: Image.asset("assets/icons/Logout.png")),
              title: Text(
                "Logout",
                style: TextStyle(
                  color: Color(0xff151515),
                  fontSize: 15,
                ),
              ),
              onTap: () async {
                AuthService().signOut();
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => MyApp()));
              },
            ),
          )
        ],
      ),
    );
  }
}
