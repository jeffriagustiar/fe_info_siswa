import 'dart:convert';

import 'package:fe_info_siswa/models/siswa_model.dart';
import 'package:fe_info_siswa/provider/auth_provider.dart';
import 'package:fe_info_siswa/share/theme.dart';
import 'package:http/http.dart' as http;

class SiswaService{
  late AuthProvider authProvider;
  final String baseUrl = url;
  // final String baseUrl = 'http://127.0.0.1:8000/api';
  // final String baseUrl = 'http://192.168.46.56:8000/api';

  Future<List<SiswaModel>> getSiswa(String token) async{
    var url = Uri.parse('$baseUrl/dataSiswa');

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
      List  data = jsonDecode(response.body)['data'];
      List<SiswaModel> siswa = [];

      for (var item in data) {
        siswa.add(SiswaModel.fromJson(item));
      }
      return siswa;
    } else {
      throw Exception("Gagal Ambil data");
    }
  }

  Future<SiswaModel> getSiswaByNis(String token,int nis) async{
    var url = Uri.parse('$baseUrl/dataSiswa/?nis=$nis');

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
      final siswa = SiswaModel.fromJson(data);

      return siswa;
    } else {
      throw Exception("Gagal Ambil data");
    }
  }
}