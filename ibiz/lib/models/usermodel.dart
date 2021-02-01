import 'package:flutter/cupertino.dart';

class UserModel with ChangeNotifier {
  UserModel(
      {this.id,
      this.mobileNo,
      this.IFSC,
      this.UPI,
      this.bankAccountNo,
      this.city,
      this.country,
      this.email,
      this.gender,
      this.homeAddress,
      this.password,
      this.state,
      this.username,
      this.zipcode,
      this.acc_bal,
      this.tokens});
  String id,
      username,
      gender,
      email,
      password,
      mobileNo,
      homeAddress,
      city,
      state,
      zipcode,
      country,
      UPI,
      bankAccountNo,
      IFSC;
  int tokens, acc_bal;

  void updateTokenAndBal({newToken, newBal}) {
    this.tokens = newToken;
    this.acc_bal = newBal;
    notifyListeners();
    print('TokenUpdated');
  }
}
