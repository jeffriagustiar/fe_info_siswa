import 'dart:convert';

import 'package:fe_info_siswa/models/spp_model.dart';
import 'package:http/http.dart' as http;
import 'package:fe_info_siswa/share/theme.dart';

class SppService{
  final String baseUrl = url;
  // final String baseUrl = 'http://127.0.0.1:8000/api';
  // final String baseUrl = 'http://192.168.46.56:8000/api';

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

    // print(response.body);
    print("bisa");

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['data'];
      final siswa = SppModel.fromJson(data);

      return siswa;
    } else {
      throw Exception("Gagal Ambil data");
    }
  }

  Future<List<SppModel>> getSppDetail(String token) async{
    var url = Uri.parse('$baseUrl/sppDetail');

    var headers = {
      'Content-Type': 'application/json',
      'Authorization' : token
    };

    var response = await http.get(
      url,
      headers: headers
    );

    // print(response.body);
    print("bisa spp");

    if (response.statusCode == 200) {

      List  data = jsonDecode(response.body)['data'];
      List<SppModel> spp = [];

      for (var item in data) {
        spp.add(SppModel.fromJson(item));
      }
      return spp;
    } else {
      throw Exception("Gagal Ambil data");
    }
  }

}