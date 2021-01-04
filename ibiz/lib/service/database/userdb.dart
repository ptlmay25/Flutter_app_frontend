import 'package:http/http.dart' as http;

class Userdb {
  //Jiten
  final String url = "http://192.168.43.24:5000/api/";
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
      print("Failure");
    }
  }
}
