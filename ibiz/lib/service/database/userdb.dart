import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:http_parser/http_parser.dart';
import 'package:ibiz/models/usermodel.dart';
import 'package:ibiz/service/database/api.dart';
import 'package:async/async.dart';
// import 'package:dio/dio.dart';

class Userdb {
  // final String url = "https://tranquil-river-00045.herokuapp.com/api/";
  // final String url = "http://192.168.43.24:5000/api/";
  String url = Api().baseurl + 'app/api/';
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
    var response = await http.put(url + "user/update/" + id,
        body: json.encode(data),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });
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
    Map data = {'UPI': UPI, 'bankAccountNo': bankAccountNo, 'IFSC': IFSC};
    var response = await http.put(url + "user/update/" + id,
        body: json.encode(data),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });
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
    print(url);
    print("Inside getUserByMobileNo" + mobileNo);
    http.Response response =
        await http.get(url + "user/viewMobile/" + mobileNo);
    print("Inside getUserByMobileNo" + response.statusCode.toString());
    if (response.statusCode == 200) {
      List userList = json.decode(response.body)['data'];
      //Map<String, dynamic> data = json.decode(response.body)['data'][0];
      if (userList.length == 0) {
        print("ZERO RETURNED");
        return 0;
      }

      Map<String, dynamic> data = userList[0];
      // print("Returning");
      return UserModel(
          username: data['username'] ?? '',
          country: data['country'] ?? '',
          IFSC: data['IFSC'] ?? '',
          UPI: data['UPI'] ?? '',
          bankAccountNo: data['bankAccountNo'] ?? '',
          city: data['city'] ?? '',
          email: data['email'] ?? '',
          gender: data['gender'] ?? '',
          homeAddress: data['homeAddress'] ?? '',
          id: data['_id'] ?? '',
          mobileNo: data['mobileNo'] ?? '',
          password: data['password'] ?? '',
          state: data['state'] ?? 'Choose State',
          zipcode: data['zipcode'] ?? '',
          tokens: data['tokens'] ?? 0.0,
          imageUrl: (data['userImg'] != null) ? data['userImg'] : '',
          acc_bal: double.parse(data['acc_bal'].toString()) ?? 0.0,
          total_purchase:
              double.parse(data['total_purchase'].toString()) ?? 0.0,
          total_sell: double.parse(data['total_sell'].toString()) ?? 0.0);
    } else {
      print("No user found with: " + mobileNo);
      return 0;
    }
  }

  Future<bool> updateImageUrl(String imgUrl, String id) async {
    Map data = {
      'userImg': imgUrl,
    };
    print(data);
    print(url + "user/update/" + id);
    var response = await http.put(url + "user/update/" + id,
        body: json.encode(data),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });
    if (response.statusCode == 200) {
      print("URL Updated");
      return true;
    } else {
      print(response.body);
      print("Failure");
      return false;
    }
  }

  Future<bool> uploadImg({uid, file}) async {
    File image = file;

    var stream = new http.ByteStream(DelegatingStream.typed(image.openRead()));
    var length = await image.length();

    var uri = Uri.parse(url + 'fileupload/upload/' + uid);

    var request = new http.MultipartRequest("POST", uri);
    var multipartFile = new http.MultipartFile('file', stream, length,
        filename: basename(image.path),
        contentType: new MediaType('image', ''));

    request.files.add(multipartFile);
    var response = await request.send();
    response.stream.transform(utf8.decoder).listen((value) {
      print(value);
    });
    print(response.statusCode);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
