import 'package:flutter/material.dart';
import 'package:ibiz/models/token.dart';
import 'package:ibiz/models/usermodel.dart';
import 'package:ibiz/size_config.dart';
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
        return ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return Padding(
                padding: EdgeInsets.only(left: 10 * SizeConfig.widthMultiplier),
                child: Container(
                  height: 60 * SizeConfig.heightMultiplier,
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 10 * SizeConfig.heightMultiplier,
                        left: 10 * SizeConfig.widthMultiplier),
                    child: ListTile(
                      leading: Text(
                          'Date: ' +
                              token.headerDate.toString().substring(0, 10),
                          style: TextStyle(
                              fontSize: 11 * SizeConfig.heightMultiplier)),
                      trailing: Text(curf.format(token.netProfit*userModel.tokens) + ' INR',
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
                    Expanded(child: Text('Total Revenue:')),
                    Text('- ' + curf.format(token.totalRevenue),
                        style: TextStyle(color: Colors.red))
                  ]),
                  SizedBox(height: 5 * SizeConfig.heightMultiplier),
                  Row(children: [
                    Expanded(child: Text('Operating Expenes:')),
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
                  Row(children: [
                    Expanded(child: Text('Service fee')),
                    Text('- ' + curf.format(token.serviceFee))
                  ]),
                  const Divider(color: Colors.grey, height: 2, thickness: 2),
                  SizedBox(height: 5 * SizeConfig.heightMultiplier),
                  Row(children: [
                    Expanded(child: Text('Net Profit')),
                    Text(curf.format(token.netProfit))
                  ]),
                  const Divider(color: Colors.grey, height: 2, thickness: 2),
                  SizedBox(height: 5 * SizeConfig.heightMultiplier),
                  Row(children: [
                    Expanded(child: Text('Total outstanding  tokens :')),
                    Text('÷ ' + token.totalTokens.toString())
                  ]),
                  const Divider(color: Colors.grey, height: 2, thickness: 2),
                  SizedBox(height: 5 * SizeConfig.heightMultiplier),
                  Row(children: [
                    Expanded(child: Text('Token Price :')),
                    Text(curf.format(token.tokenPrice))
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
