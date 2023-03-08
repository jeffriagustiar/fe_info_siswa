import 'dart:convert';

import 'package:fe_info_siswa/models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthService{
  final String baseUrl = 'http://127.0.0.1:8000/api';

  Future<UserModel> login({
    required String nis,
    required String pinsiswa,
  }) async {
    var url = Uri.parse('$baseUrl/login');
    var headers = {'Content-Type' : 'application/json'};
    var body = jsonEncode({
      'nis' : nis,
      'pinsiswa' : pinsiswa,
    });

    var response = await http.post(
      url, 
      headers: headers,
      body: body
    );

    // print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      UserModel user = UserModel.fromJson(data['user']);
      user.api_token = 'Bearer ' + data['access_token'];

      return user;
    }else{
      throw Exception('Gagal Login');
    }
  }



}