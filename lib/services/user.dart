import 'dart:convert';
import 'package:flutter_application_1/models/response_data_map.dart';
import 'package:flutter_application_1/models/user_login.dart';
import 'package:flutter_application_1/services/url.dart' as url;
import 'package:http/http.dart' as http;

class UserService {

  /// REGISTER USER
  Future<ResponseDataMap> registerUser(Map<String, dynamic> data) async {
    final uri = Uri.parse("${url.Baseurl}/auth/register");
    final register = await http.post(uri, body: data);

    if (register.statusCode == 200) {
      final res = json.decode(register.body);

      if (res["status"] == true) {
        return ResponseDataMap(
          status: true,
          message: "Sukses menambah user",
          data: res,
        );
      } else {
        String message = "";
        res["message"].forEach((key, value) {
          message += value[0] + "\n";
        });

        return ResponseDataMap(status: false, message: message);
      }
    } else {
      return ResponseDataMap(
        status: false,
        message: "Gagal register dengan code ${register.statusCode}",
      );
    }
  }

  /// LOGIN USER
  Future<ResponseDataMap> loginUser(Map<String, dynamic> data) async {
    final uri = Uri.parse("${url.Baseurl}/auth/login");
    final login = await http.post(uri, body: data);

    if (login.statusCode == 200) {
      final res = json.decode(login.body);

      if (res["status"] == true) {

        UserLogin userLogin = UserLogin(
          status: true,
          token: res["authorisation"]["token"],
          message: res["message"],
          id: res["data"]["id"],
          nama_user: res["data"]["name"],
          email: res["data"]["email"],
          role: res["data"]["role"],
        );

        await userLogin.save();

        return ResponseDataMap(
          status: true,
          message: "Sukses login user",
          data: res,
        );
      } else {
        return ResponseDataMap(
          status: false,
          message: "Email dan password salah",
        );
      }
    } else {
      return ResponseDataMap(
        status: false,
        message: "Gagal login user dengan code ${login.statusCode}",
      );
    }
  }
}
