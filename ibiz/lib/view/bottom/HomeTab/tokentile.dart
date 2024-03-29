import 'package:flutter/material.dart';
import 'package:ibiz/models/token.dart';
import 'package:ibiz/size_config.dart';
import 'package:ibiz/view/dateformatter.dart';
import 'package:ibiz/view/datemap.dart';
import 'package:intl/intl.dart';

class TokenTile extends StatefulWidget {
  TokenTile({this.data});
  List<Token> data;
  @override
  _TokenTileState createState() => _TokenTileState();
}

class _TokenTileState extends State<TokenTile> {
  var curf = new NumberFormat.currency(locale: "en_IN", symbol: "₹ ");
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 30 * SizeConfig.heightMultiplier),
      child: ListView.builder(
        physics: ScrollPhysics(),
        //primary: true,
        shrinkWrap: true,
        itemCount: widget.data.length,
        itemBuilder: (context, index) {
          Token token = widget.data[index];
          DateTime date = DateTime.parse(token.tokenDate);
          return ExpansionTile(
            leading: Padding(
              padding: EdgeInsets.only(top: 5 * SizeConfig.heightMultiplier),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(DateMap().getMonth(date) + ' ' + date.year.toString(),
                      style: TextStyle(
                          fontSize: 14 * SizeConfig.heightMultiplier,
                          fontWeight: FontWeight.normal)),
                  Text('Date: ' + DateFormatter().format(date),
                      style: TextStyle(
                          fontSize: 11 * SizeConfig.heightMultiplier,
                          fontWeight: FontWeight.w300)),
                ],
              ),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('+ ' + curf.format(token.netProfit.toDouble()) + ' INR',
                    style: TextStyle(
                        fontSize: 14 * SizeConfig.heightMultiplier,
                        color: Colors.green)),
                SizedBox(height: 11 * SizeConfig.heightMultiplier),
              ],
            ),
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 6 * SizeConfig.heightMultiplier),
                Icon(Icons.keyboard_arrow_down),
              ],
            ),
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: 20 * SizeConfig.widthMultiplier,
                    right: 20 * SizeConfig.widthMultiplier,
                    bottom: 20 * SizeConfig.heightMultiplier),
                child: Column(
                  children: [
                    Row(children: [
                      Expanded(child: Text('Total revenue:')),
                      Text(
                        curf.format(token.totalRevenue),
                      )
                    ]),
                    SizedBox(height: 5 * SizeConfig.heightMultiplier),
                    Row(children: [
                      Expanded(child: Text('Operating expenes:')),
                      Text('- ' + curf.format(token.oparatingExpenses),
                          style: TextStyle(color: Colors.red))
                    ]),
                    SizedBox(height: 5 * SizeConfig.heightMultiplier),
                    Row(children: [
                      Expanded(child: Text('interest + tax:')),
                      Text('- ' + curf.format(token.interest),
                          style: TextStyle(color: Colors.red))
                    ]),
                    SizedBox(height: 5 * SizeConfig.heightMultiplier),
                    const Divider(color: Colors.grey, height: 2, thickness: 2),
                    SizedBox(height: 5 * SizeConfig.heightMultiplier),
                    Row(children: [
                      Expanded(child: Text('Net profit')),
                      Text(curf.format(token.netProfit))
                    ]),
                    SizedBox(height: 5 * SizeConfig.heightMultiplier),
                    const Divider(color: Colors.grey, height: 2, thickness: 2),
                    SizedBox(height: 5 * SizeConfig.heightMultiplier),
                    Row(children: [
                      Expanded(child: Text('50/50 split')),
                      Text('- ' + curf.format(token.split))
                    ]),
                    SizedBox(height: 5 * SizeConfig.heightMultiplier),
                    const Divider(color: Colors.grey, height: 2, thickness: 2),
                    SizedBox(height: 5 * SizeConfig.heightMultiplier),
                    Row(children: [
                      Expanded(child: Text('Total outstanding  tokens :')),
                      Text('÷ ' + token.totalTokens.toString())
                    ]),
                    SizedBox(height: 5 * SizeConfig.heightMultiplier),
                    const Divider(color: Colors.grey, height: 2, thickness: 2),
                    SizedBox(height: 5 * SizeConfig.heightMultiplier),
                    Row(children: [
                      Expanded(child: Text('Dividend per TOKEN :')),
                      Text(curf.format(token.dividendPerToken))
                    ]),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
