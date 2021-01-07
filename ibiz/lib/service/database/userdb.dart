import 'dart:convert';

import 'package:http/http.dart' as http;

class Userdb {
  //Jiten
  final String url = "https://tranquil-river-00045.herokuapp.com/api/";
  //final String url = "http://192.168.43.24:5000/api/";
  Future getUsers() async {
    http.Response response = await http.get(url + "user");
    print(response.body);
  }

  Future addUser(String mobileNo, String username, String gender) async {
    Map data = {'mobileNo': mobileNo, 'username': username, 'gender': gender};
    var response = await http.post(url + "user/create", body: data);
    if (response.statusCode == 200) {
      print("User Created");
    } else {
      print(response.body);
      print("Failure");
    }
  }

  Future<bool> checkUser(String mobileNo) async {
    http.Response response = await http.get(url+"user/checkUser/"+mobileNo);
    if (response.statusCode == 200) {
      //print(response.body);
      Map<String,dynamic> data=json.decode(response.body);
      print("data: "+data.toString());
      if(data['messageCode']==true){
        print("User Already Regestered");
        return true;
      }else{
        return false;
      }
    } else {
      print("Failure");
    }
  }
}
