import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ibiz/models/usermodel.dart';

class Userdb {
  //Jiten
  final String url = "https://tranquil-river-00045.herokuapp.com/api/";
  // final String url = "http://192.168.43.24:5000/api/";
  Future getUsers() async {
    http.Response response = await http.get(url + "user");
    print(response.body);
  }

  Future addUser(String mobileNo, String username, String gender) async {
    Map data = {'mobileNo': mobileNo, 'username': username, 'gender': gender};
    var response = await http.post(url + "user/create", body: data);
    if (response.statusCode == 200) {
      //print("User Created");
      return true;
    } else {
      print(response.body);
      print("Failure");
      return false;
    }
  }

  Future<bool> checkUser(String mobileNo) async {
    http.Response response = await http.get(url + "user/checkUser/" + mobileNo);
    if (response.statusCode == 200) {
      //print(response.body);
      Map<String, dynamic> data = json.decode(response.body);
      print(data.toString());
      if (data['messageCode'] == true) {
        //print("User Already Regestered");
        return true;
      } else {
        return false;
      }
    } else {
      print("Failure");
    }
  }

  Future<bool> updateUserProfile(String id, String email, String homeAddress,
      String city, String zipcode, String state) async {
    print(id);
    Map data = {
      'email': email,
      'homeAddress': homeAddress,
      'city': city,
      'zipcode': zipcode,
      'state': state
    };
    var response = await http.put(url + "user/update/" + id, body: data);
    if (response.statusCode == 200) {
      //print("User Updated");
      return true;
    } else {
      print(response.body);
      print("Failure");
      return false;
    }
  }

  Future<bool> updateUserBankDetails(
      String id, String UPI, String bankAccountNo, String IFSC) async {
    Map data = {
      'id': id,
      'UPI': UPI,
      'bankAccountNo': bankAccountNo,
      'IFSC': IFSC
    };
    var response = await http.put(url + "user/update/" + id, body: data);
    if (response.statusCode == 200) {
      //print("User Updated");
      return true;
    } else {
      print(response.body);
      print("Failure");
      return false;
    }
  }

  Future<dynamic> getUserByMobileNo(String mobileNo) async {
    http.Response response =
        await http.get(url + "user/viewMobile/" + mobileNo);
    //print("Inside getUserByMobileNo"+response.body);
    if (response.statusCode == 200) {
      List userList=json.decode(response.body)['data'];
      print(userList.length);
      //Map<String, dynamic> data = json.decode(response.body)['data'][0];
      if(userList.length==0){
        print("ZERO RETURNED");
        return 0;
      }
        
      Map<String,dynamic> data=userList[0];
      print("Inside getUserByMobileNo" + data.toString());
      return UserModel(
        username: data['username'],
        country: data['country'],
        IFSC: data['IFSC'],
        UPI: data['UPI'],
        bankAccountNo: data['bankAccountNo'],
        city: data['city'],
        email: data['email'],
        gender: data['gender'],
        homeAddress: data['homeAddress'],
        id: data['_id'],
        mobileNo: data['mobileNo'],
        password: data['password'],
        state: data['state'],
        zipcode: data['zipcode'],
      );
    } else {
      print("No user found with: " + mobileNo);
      return null;
    }
  }
}