import 'dart:convert';

import 'package:fe_info_siswa/models/spp_model.dart';
import 'package:http/http.dart' as http;

class SppService{
  final String baseUrl = 'http://127.0.0.1:8000/api';

  Future<SppModel> getSpp(String token) async{
    var url = Uri.parse('$baseUrl/dataSpp');

    var headers = {
      'Content-Type': 'application/json',
      'Authorization' : token
    };

    var response = await http.get(
      url,
      headers: headers
    );

    print(response.body);
    print("bisa");

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['data'];
      final siswa = SppModel.fromJson(data);

      return siswa;
    } else {
      throw Exception("Gagal Ambil data");
    }
  }

}