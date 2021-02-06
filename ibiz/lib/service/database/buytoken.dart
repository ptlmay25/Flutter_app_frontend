import 'package:http/http.dart' as http;

class BuyToken {
  String url = "https://tranquil-river-00045.herokuapp.com/api/";
  Future<bool> buyToken({id, newToken, newBal}) async {
    print(newBal.toString() + ' ' + newToken.toString());
    Map data = {
      "acc_bal": newBal.toString(),
      "tokens": newToken.toString(),
    };
    var response = await http.put(url + "user/update/" + id, body: data);
    if (response.statusCode == 200) {
      print("User Updated");
      return true;
    } else {
      print(response.body);
      print("Failure");
      return false;
    }
  }
}
