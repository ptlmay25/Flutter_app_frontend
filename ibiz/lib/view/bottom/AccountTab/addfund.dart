import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ibiz/models/usermodel.dart';
import 'package:ibiz/service/database/addfunddb.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:ibiz/size_config.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class AddFund extends StatefulWidget {
  final UserModel userModel;
  AddFund({this.userModel});
  @override
  _AddFundState createState() => _AddFundState();
}

class _AddFundState extends State<AddFund> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String email;
  double amount = 0.0;
  Razorpay _razorpay;
  bool paymentDone = false;
  @override
  void initState() {
    super.initState();
    _razorpay = new Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  @override
  Widget build(BuildContext context) {
    var curf = new NumberFormat.currency(locale: "en_us", symbol: "₹ ");
    UserModel userModel = Provider.of<UserModel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 66, 71, 112),
      ),
      body: Column(
        children: [
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(
                    top: 36 * SizeConfig.heightMultiplier,
                    left: 36 * SizeConfig.widthMultiplier),
                child: Text(
                  'Add Funds',
                  style: TextStyle(fontSize: 18 * SizeConfig.heightMultiplier),
                ),
              )),
          Padding(
            padding: EdgeInsets.only(
                top: 38 * SizeConfig.heightMultiplier,
                left: 47 * SizeConfig.widthMultiplier,
                right: 47 * SizeConfig.widthMultiplier),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Amount'),
                    onChanged: (value) {
                      setState(() {
                        this.amount = double.parse(value);
                      });
                    },
                    onSaved: (value) {
                      setState(() {
                        this.amount = double.parse(value);
                      });
                    },
                    validator: (value) {
                      bool isValid = RegExp("[0-9]+").hasMatch(value);
                      if (!isValid) {
                        return 'Amount should be Number';
                      }
                    },
                  ),
                  SizedBox(height: 30 * SizeConfig.heightMultiplier),
                  TextFormField(
                    initialValue: userModel.email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(hintText: 'Email Address*'),
                    onSaved: (value) {
                      setState(() {
                        this.email = value;
                      });
                    },
                    validator: (value) {
                      bool validEmail = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value);
                      if (!validEmail) {
                        return "Invalid Email";
                      }
                    },
                  ),
                  SizedBox(height: 30 * SizeConfig.heightMultiplier),
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Phone Number*'),
                    initialValue: userModel.mobileNo,
                    enabled: false,
                  ),
                  SizedBox(height: 75 * SizeConfig.heightMultiplier),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Container(
                        height: 40 * SizeConfig.heightMultiplier,
                        width: 300 * SizeConfig.widthMultiplier,
                        child: RaisedButton(
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              _formKey.currentState.save();
                              print('$email $amount ${userModel.mobileNo}');
                              openCheckout(userModel);
                              // Navigator.of(context).push(
                              //     MaterialPageRoute(builder: (context) => GetStarted()));
                            }
                          },
                          color: Color.fromARGB(255, 66, 71, 112),
                          child: Text(
                            'Add (' + curf.format(amount) + ')',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 16 * SizeConfig.heightMultiplier),
                          ),
                        ),
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void openCheckout(UserModel userModel) async {
    // 'key': 'rzp_test_v6Iu0KnIVSKqGC'
    var options = {
      'key': 'rzp_live_7Y8zmN1s4WEkLo',
      'amount': amount * 100,
      'name': 'Firefly',
      'description': 'Payment for new Token',
      'image':
          'https://firebasestorage.googleapis.com/v0/b/mytestApp.appspot.com/o/images%2FpZm8daajsIS4LvqBYTiWiuLIgmE2?alt=media&token=3kuli4cd-dc45-7845-b87d-5c4acc7da3c2',
      'prefill': {'contact': userModel.mobileNo, 'email': userModel.email},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      // debugPrint(e);
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    Fluttertoast.showToast(
        msg: "SUCCESS: " + response.paymentId, timeInSecForIosWeb: 4);
    print('payment done');
    Map depositHistory = {
      "user_id": widget.userModel.id,
      "total_amount": amount,
      "payment_token": response.paymentId.toString()
    };
    Map body = {"depositHistory": depositHistory};
    bool res = await AddFundDB().add(body: body);
    if (res) {
      print("Result:" + res.toString());
      widget.userModel.updateTokenAndBal(
          newToken: widget.userModel.tokens,
          newBal: widget.userModel.acc_bal + amount);
      setState(() {
        paymentDone = true;
      });
    }
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "ERROR: " + response.code.toString() + " - " + response.message,
        timeInSecForIosWeb: 4);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName, timeInSecForIosWeb: 4);
  }
}
