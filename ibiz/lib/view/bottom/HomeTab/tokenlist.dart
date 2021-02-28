import 'package:flutter/material.dart';
import 'package:ibiz/models/token.dart';
import 'package:ibiz/models/usermodel.dart';
import 'package:ibiz/size_config.dart';
import 'package:ibiz/view/datemap.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class TokenList extends StatefulWidget {
  TokenList({this.data});
  List<Token> data;
  @override
  _TokenListState createState() => _TokenListState();
}

class _TokenListState extends State<TokenList> {
  var curf = new NumberFormat.currency(locale: "en_us", symbol: "₹ ");

  Widget _buildTokenList(UserModel userModel) {
    var _data = widget.data;
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Token token) {
        DateTime date = DateTime.parse(token.tokenDate);
        return ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return Padding(
                padding: EdgeInsets.only(left: 0 * SizeConfig.widthMultiplier),
                child: Container(
                  height: 60 * SizeConfig.heightMultiplier,
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 10 * SizeConfig.heightMultiplier,
                        left: 0 * SizeConfig.widthMultiplier),
                    child: ListTile(
                      leading: Column(
                        children: [
                          Text(
                              DateMap().getMonth(date) +
                                  ' ' +
                                  date.year.toString(),
                              style: TextStyle(
                                  fontSize: 14 * SizeConfig.heightMultiplier,
                                  fontWeight: FontWeight.normal)),
                          Text(
                              'Date: ' +
                                  token.tokenDate.toString().substring(0, 10),
                              style: TextStyle(
                                  fontSize: 11 * SizeConfig.heightMultiplier,
                                  fontWeight: FontWeight.w300)),
                        ],
                      ),
                      trailing: Text(
                          '+ ' +
                              curf.format(token.netProfit.toDouble()) +
                              ' INR',
                          style: TextStyle(
                              fontSize: 14 * SizeConfig.heightMultiplier,
                              color: Colors.green)),
                    ),
                  ),
                ),
              );
            },
            body: Padding(
              padding: EdgeInsets.only(
                  left: 20 * SizeConfig.widthMultiplier,
                  right: 65 * SizeConfig.widthMultiplier,
                  bottom: 10 * SizeConfig.heightMultiplier),
              child: Container(
                child: Column(children: <Widget>[
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
                    Expanded(child: Text('Dividend per token :')),
                    Text(curf.format(token.dividendPerToken))
                  ]),
                ]),
              ),
            ),
            isExpanded: token.isExpanded);
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    UserModel userModel = Provider.of<UserModel>(context);
    return _buildTokenList(userModel);
  }
}
