import 'package:flutter/material.dart';
import 'package:ibiz/models/WithdrawHistory.dart';
import 'package:ibiz/models/usermodel.dart';
import 'package:ibiz/service/database/witdhrawhistorydb.dart';
import 'package:ibiz/size_config.dart';
import 'package:ibiz/view/dateformatter.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

// ignore: camel_case_types
class Withdraw_History extends StatefulWidget {
  Withdraw_History({this.userModel, this.data});
  final List<WithdrawHistory> data;
  final UserModel userModel;
  @override
  _Withdraw_HistoryState createState() => _Withdraw_HistoryState();
}

// ignore: camel_case_types
class _Withdraw_HistoryState extends State<Withdraw_History> {
  var curf = new NumberFormat.currency(locale: "en_IN", symbol: "₹ ");
  var datef = new DateFormat('yyyy-MM-dd');
  String searchText = '';
  List<WithdrawHistory> data;
  @override
  void initState() {
    super.initState();
    data = filter(widget.data);
  }

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));

    List<WithdrawHistory> newdData =
        await WithdrawHistoryDb().getWithdrawList(id: widget.userModel.id);
    // if failed,use refreshFailed()
    setState(() {
      data = newdData;
      searchText = '';
      _refreshController.refreshCompleted();
    });
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()

    setState(() {});
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    List<WithdrawHistory> list = filter(data);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 66, 71, 112),
        ),
        body: Column(
          //scrollDirection: Axis.vertical,
          children: [
            Padding(
                padding: EdgeInsets.only(
                    top: 25 * SizeConfig.heightMultiplier,
                    right: 28 * SizeConfig.widthMultiplier,
                    left: 28 * SizeConfig.widthMultiplier),
                child: TextField(
                    cursorHeight: 5,
                    onChanged: (val) {
                      setState(() {
                        searchText = val;
                      });
                    },
                    decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.all(15),
                        hintText: "Search",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        )))),
            Padding(
              padding: EdgeInsets.only(
                  left: 25 * SizeConfig.widthMultiplier,
                  right: 150 * SizeConfig.widthMultiplier,
                  top: 38 * SizeConfig.heightMultiplier),
              child: SizedBox(
                width: 200,
                height: 30,
                child: Text(
                  "Withdrawal History :",
                  style: TextStyle(
                    color: Color(0xff151515),
                    fontSize: 20,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Expanded(
                child: SmartRefresher(
              enablePullDown: true,
              controller: _refreshController,
              onRefresh: _onRefresh,
              onLoading: _onLoading,
              child: ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return getList(list[index]);
                },
              ),
            )),
          ],
        ));
  }

  List<WithdrawHistory> filter(List<WithdrawHistory> list) {
    return list.where((element) {
      if (element.id.contains(searchText) ||
          DateFormatter()
              .format(DateTime.parse(element.date))
              .contains(searchText) ||
          element.total_amount.toStringAsFixed(2).contains(searchText)) {
        return true;
      } else {
        return false;
      }
    }).toList();
  }

  Widget getList(WithdrawHistory data) {
    print('getList');
    print(data.user_id);
    if (data.user_id == widget.userModel.id && data.status == 'true') {
      return Padding(
        padding: EdgeInsets.only(
          top: 25 * SizeConfig.heightMultiplier,
          left: 35 * SizeConfig.widthMultiplier,
        ),
        child: Row(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  children: [
                    Container(
                      child: Padding(
                        padding: EdgeInsets.only(),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Withdrawal No: ${data.id}",
                              style: TextStyle(
                                color: Color(0xff151515),
                                fontSize: 13,
                              ),
                            ),
                            Text(
                              "Date: " +
                                  DateFormatter()
                                      .format(DateTime.parse(data.date)),
                              style: TextStyle(
                                color: Color(0xff151515),
                                fontSize: 14,
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 17 * SizeConfig.widthMultiplier),
              child: Text(
                '- ' + curf.format(data.total_amount) + ' INR',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Color(0xff8c2f0f),
                  fontSize: 15 * SizeConfig.heightMultiplier,
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return Container();
    }
  }
}
