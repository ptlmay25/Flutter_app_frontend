import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ibiz/service/auth.dart';
import 'package:ibiz/size_config.dart';
import 'package:ibiz/view/home.dart';
import 'package:ibiz/view/view.dart';
import 'package:ibiz/view/wrapper.dart';
import 'package:provider/provider.dart';

import 'models/user.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.portraitUp,
    // ]);
    // ignore: missing_required_param
    //--------------------------------------Without Layout Builder--------------
    // return StreamProvider<User>.value(
    //   value: AuthService().user,
    //   child: MaterialApp(
    //     home: Wrapper(),
    //   ),
    // );

    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(
        builder: (context, orientation) {
          SizeConfig().init(constraints, orientation);
          return StreamProvider<User>.value(
            value: AuthService().user,
            child: MaterialApp(
              home: Wrapper(),
              // home: View(mobileNo: '+919737582544',),
            ),
          );
        },
      );
    });
    // return LayoutBuilder(builder: (context,constraints){
    //   return OrientationBuilder(builder: (context,orientation){
    //     SizeConfig().init(constraints, orientation);
    //       return MaterialApp(
    //         home: View(mobileNo: '+919737582544'),
    //       );
    //   });
    // });
  }
}
