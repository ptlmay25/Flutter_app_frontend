import 'package:flutter/cupertino.dart';

class UserModel with ChangeNotifier {
  UserModel(
      {this.id,
      this.mobileNo,
      // ignore: non_constant_identifier_names
      this.IFSC,
      // ignore: non_constant_identifier_names
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
      // ignore: non_constant_identifier_names
      this.acc_bal,
      this.tokens,
      this.total_purchase,
      this.total_sell});
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
      // ignore: non_constant_identifier_names
      UPI,
      bankAccountNo,
      // ignore: non_constant_identifier_names
      IFSC;
  int tokens;
  // ignore: non_constant_identifier_names
  double acc_bal, total_purchase, total_sell;

  void updateTokenAndBal({newToken, newBal, newPurchase, newSell}) {
    this.tokens = newToken;
    this.acc_bal = newBal;
    this.total_purchase = newPurchase;
    this.total_sell = newSell;
    notifyListeners();
    print('TokenUpdated');
  }

  void updateUserProfile(
      {newEmail, newAddress, newCity, newZipcode, newState}) {
    this.email = newEmail;
    this.homeAddress = newAddress;
    this.city = newCity;
    this.zipcode = newZipcode;
    this.state = newState;
    notifyListeners();
    print('Profile Updated');
  }

  void updateBankDetails({newUpi, newAccNo, newIfsc}) {
    this.UPI = newUpi;
    this.bankAccountNo = newAccNo;
    this.IFSC = newIfsc;
  }
}
