import 'package:flutter/material.dart';
import 'package:ibiz/models/mycategory.dart';
import 'package:ibiz/models/retailer.dart';
import 'package:ibiz/service/database/mycategorydb.dart';
import 'package:ibiz/service/database/retailerdb.dart';
import 'package:ibiz/view/bottom/SearchTab/categorylist.dart';

import 'package:ibiz/size_config.dart';
import 'package:ibiz/view/bottom/SearchTab/retailerlist.dart';
import 'package:intl/intl.dart';
import 'package:ibiz/service/database/tokendb.dart';
import 'package:ibiz/models/token.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class Searchtab extends StatefulWidget {
  @override
  _SearchtabState createState() => _SearchtabState();
}

class _SearchtabState extends State<Searchtab> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    setState(() {});
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()

    setState(() {});
    _refreshController.loadComplete();
  }

  bool flag = false; //0 for brands, 1 for retailer
  var curf = new NumberFormat.currency(locale: "en_IN", symbol: "₹ ");
  Widget build(BuildContext context) {
    Future<List<Token>> tokenList = TokenDb().getToken();
    Future<List<MyCategory>> categories = MyCategoryDb().getBrand();
    Future<List<Retailer>> retailers = RetailerDb().getStores();
    return Scaffold(
      body: SmartRefresher(
        enablePullDown: true,
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: Column(
          children: [
            Container(
              color: Color.fromARGB(255, 66, 71, 112),
              height: 160 * SizeConfig.heightMultiplier,
              width: MediaQuery.of(context).size.width,
              child: Align(
                alignment: Alignment.center,
                child: Column(children: <Widget>[
                  FutureBuilder(
                      future: tokenList,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          Token latestToken = snapshot.data[0];
                          return Text(
                            curf.format(latestToken.netProfit),
                            style: TextStyle(
                                fontSize: 22 * SizeConfig.heightMultiplier,
                                color: Colors.white),
                          );
                        } else {
                          return Text(
                            curf.format(0),
                            style: TextStyle(
                                fontSize: 22 * SizeConfig.heightMultiplier,
                                color: Colors.white),
                          );
                        }
                      }),
                  Text(
                    'Last month profit',
                    style: TextStyle(
                        fontSize: 15 * SizeConfig.heightMultiplier,
                        fontWeight: FontWeight.normal,
                        color: Color.fromARGB(255, 255, 212, 31)),
                  ),
                  SizedBox(height: 20 * SizeConfig.heightMultiplier),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 36 * SizeConfig.widthMultiplier,
                        right: 36 * SizeConfig.widthMultiplier),
                    child: Row(
                      children: [
                        Expanded(
                            child: Text(
                          "Total Brands",
                          style: TextStyle(
                              fontSize: 16 * SizeConfig.heightMultiplier,
                              fontWeight: FontWeight.normal,
                              color: Colors.white),
                        )),
                        Text(
                          'No. Stores',
                          style: TextStyle(
                              fontSize: 16 * SizeConfig.heightMultiplier,
                              fontWeight: FontWeight.normal,
                              color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 10 * SizeConfig.heightMultiplier),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 36 * SizeConfig.widthMultiplier,
                        right: 36 * SizeConfig.widthMultiplier),
                    child: Row(
                      children: [
                        FutureBuilder(
                          future: categories,
                          builder: (context, AsyncSnapshot snapshot) {
                            int n = 0;
                            if (snapshot.hasData) {
                              List<MyCategory> c = snapshot.data;
                              n = c.length;
                            }
                            return Expanded(
                                child: Text(
                              n.toString(),
                              style: TextStyle(
                                  fontSize: 16 * SizeConfig.heightMultiplier,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white),
                            ));
                          },
                        ),
                        FutureBuilder(
                            // future: retailers,
                            future: categories,
                            builder: (context, snapshot) {
                              double n = 0;
                              // if (snapshot.hasData) {
                              //   List<Retailer> retailers = snapshot.data;
                              //   for (Retailer r in retailers) {
                              //     n += r.no_of_stores;
                              //   }
                              // }
                              if (snapshot.hasData) {
                                List<MyCategory> categories = snapshot.data;
                                for (MyCategory r in categories) {
                                  n += r.no_of_products;
                                }
                              }
                              return Text(
                                n.toInt().toString(),
                                style: TextStyle(
                                    fontSize: 16 * SizeConfig.heightMultiplier,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white),
                              );
                            })
                      ],
                    ),
                  ),
                ]),
              ),
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.only(
                    left: 15 * SizeConfig.widthMultiplier,
                    right: 15 * SizeConfig.widthMultiplier),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20 * SizeConfig.heightMultiplier),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          child: Container(
                            decoration: BoxDecoration(
                                color: (flag)
                                    ? Colors.white
                                    : Color.fromARGB(255, 17, 205, 144),
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    color: (flag)
                                        ? Colors.black
                                        : Color.fromARGB(255, 17, 205, 144))),
                            height: 40 * SizeConfig.heightMultiplier,
                            width: 150 * SizeConfig.widthMultiplier,
                            child: Align(
                              alignment: Alignment.center,
                              child: InkWell(
                                onTap: () async {
                                  setState(() {
                                    flag = !flag;
                                  });
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 40 * SizeConfig.heightMultiplier,
                                  child: Text(
                                    'Our Brands',
                                    style: TextStyle(
                                        color: (!flag)
                                            ? Colors.white
                                            : Colors.black,
                                        fontWeight: FontWeight.normal,
                                        fontSize:
                                            13 * SizeConfig.heightMultiplier),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 25 * SizeConfig.widthMultiplier),
                        Container(
                          decoration: BoxDecoration(
                            color: (!flag)
                                ? Colors.white
                                : Color.fromARGB(255, 17, 205, 144),
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                color: (!flag)
                                    ? Colors.black
                                    : Color.fromARGB(255, 17, 205, 144)),
                          ),
                          height: 40 * SizeConfig.heightMultiplier,
                          width: 150 * SizeConfig.widthMultiplier,
                          child: Align(
                            alignment: Alignment.center,
                            child: InkWell(
                              onTap: () async {
                                setState(() {
                                  flag = !flag;
                                });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 40 * SizeConfig.heightMultiplier,
                                child: Text(
                                  'Retail stores',
                                  style: TextStyle(
                                      color:
                                          (flag) ? Colors.white : Colors.black,
                                      fontWeight: FontWeight.normal,
                                      fontSize:
                                          13 * SizeConfig.heightMultiplier),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 25 * SizeConfig.heightMultiplier),
                    Container(
                        height: 450,
                        child: (!flag)
                            ? FutureBuilder(
                                future: categories,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    List<MyCategory> c = snapshot.data;
                                    return (c.length > 0)
                                        ? CategoryList(categories: c)
                                        : Container(child: Text("No Brands"));
                                  } else {
                                    return Container(child: Text("Loading..."));
                                  }
                                },
                              )
                            : FutureBuilder(
                                future: retailers,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    List<Retailer> r = snapshot.data;
                                    return (r.length > 0)
                                        ? RetailerList(retailers: r)
                                        : Container(child: Text("No Stores"));
                                  } else {
                                    return Container(child: Text("Loading..."));
                                  }
                                },
                              ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
