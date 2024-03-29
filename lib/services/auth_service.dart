import 'dart:convert';

import 'package:fe_info_siswa/models/kelas_model.dart';
import 'package:fe_info_siswa/models/user_model.dart';
import 'package:fe_info_siswa/share/theme.dart';
import 'package:http/http.dart' as http;
import 'package:sp_util/sp_util.dart';

class AuthService{
  final String baseUrl = url;
  // final String baseUrl = 'http://127.0.0.1:8000/api';
  // final String baseUrl = 'http://192.168.46.56:8000/api';

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
      KelasModel kelas = KelasModel.fromJson(data['user']['kelas']);
      // ignore: prefer_interpolation_to_compose_strings
      user.api_token = 'Bearer ' + data['access_token'];
      SpUtil.putInt('a', 1);
      // ignore: prefer_interpolation_to_compose_strings
      SpUtil.putString('token', 'Bearer ' + data['access_token']);
      SpUtil.putInt('replid', user.replid!);
      SpUtil.putInt('nis', user.nis!);
      SpUtil.putString('nisn', user.nisn!); 
      SpUtil.putString('nik', user.nik!); 
      SpUtil.putString('nama', user.nama!); 
      SpUtil.putInt('idkelas', user.idkelas!);
      SpUtil.putString('kelas', kelas.kelas!);
      SpUtil.putString('kelamin', user.kelamin!);

      return user;
    }else{
      throw Exception('Gagal Login');
      // throw Exception(Error());
    }
  }

  Future<UserModel> logout({
    required String nis,
    required String token
  }) async {
    var url = Uri.parse('$baseUrl/logout');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization' : token
    };
    var body = jsonEncode({
      'nis': nis,
    });

    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    // ignore: avoid_print
    // print(response.body);

    if (response.statusCode == 200) {
      SpUtil.putInt('a', 0);
      SpUtil.putString('token', 'Bearer ');
      SpUtil.putInt('replid', 0);
      SpUtil.putInt('nis', 0);
      SpUtil.putString('nisn', ''); 
      SpUtil.putString('nik', ''); 
      SpUtil.putString('nama', ''); 
      SpUtil.putInt('idkelas', 0);
      SpUtil.putString('kelas', '');
      SpUtil.putString('kelamin', '');
      throw Exception('Berhasil Logout');
    } else {
      throw Exception('Gagal Register');
    }
  }


}