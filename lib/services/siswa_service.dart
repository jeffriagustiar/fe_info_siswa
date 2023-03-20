import 'dart:convert';

import 'package:fe_info_siswa/models/presen_siswa_model.dart';
import 'package:fe_info_siswa/models/rapor_siswa_model.dart';
import 'package:fe_info_siswa/models/semester_model.dart';
import 'package:fe_info_siswa/models/siswa_model.dart';
import 'package:fe_info_siswa/models/tahun_model.dart';
import 'package:fe_info_siswa/provider/auth_provider.dart';
import 'package:fe_info_siswa/share/theme.dart';
import 'package:http/http.dart' as http;

class SiswaService{
  late AuthProvider authProvider;
  final String baseUrl = url;
  // final String baseUrl = 'http://127.0.0.1:8000/api';
  // final String baseUrl = 'http://192.168.46.56:8000/api';

  //ambil semua data siswa
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

    // print((response.body));
    print("bisa");

    if (response.statusCode == 200) {
      List  data = jsonDecode(response.body)['data'];
      List<SiswaModel> siswa = [];

      for (var item in data) {
        siswa.add(SiswaModel.fromJson(item));
      }
      return siswa;
    } else {
      throw Exception("Gagal Ambil data siswa");
    }
  }

  //ambil data siswa berdasarkan nis
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
    print("bisa siswa");

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['data'];
      final siswa = SiswaModel.fromJson(data);

      return siswa;
    } else {
      throw Exception("Gagal Ambil data siswa nis");
    }
  }

  //ambil data rapor siswa dengan sortir semester
  Future<List<RaporSiswaModel>> getRaporSiswa(String token, String semester) async{
    var url = Uri.parse('$baseUrl/nilaiRapor/?id=$semester');

    var headers = {
      'Content-Type': 'application/json',
      'Authorization' : token
    };

    var response = await http.get(
      url,
      headers: headers
    );

    // print((response.body));
    print("bisa rapor");

    if (response.statusCode == 200) {
      List  data = jsonDecode(response.body)['data'];
      List<RaporSiswaModel> rapor = [];

      for (var item in data) {
        rapor.add(RaporSiswaModel.fromJson(item));
      }
      return rapor;
    } else {
      throw Exception("Gagal Ambil data rapor");
    }
  }

  //ambil data kehadiran siswa dengan sortir tahun dan bulan
  Future<List<PresensionSiswaModel>> getpresenSiswa(String token, String year, String month) async{
    var url = Uri.parse('$baseUrl/absenHarianSiswa?year=$year&month=$month');

    var headers = {
      'Content-Type': 'application/json',
      'Authorization' : token
    };

    var response = await http.get(
      url,
      headers: headers
    );

    // print((response.body));
    print("bisa pesensi");

    if (response.statusCode == 200) {
      List  data = jsonDecode(response.body)['data'];
      List<PresensionSiswaModel> presen = [];

      for (var item in data) {
        presen.add(PresensionSiswaModel.fromJson(item));
      }
      return presen;
    } else {
      throw Exception("Gagal Ambil data presensi");
    }
  }

  //ambil data tahun ajaran
  Future<List<TahunModel>> gettahun() async{
    var url = Uri.parse('$baseUrl/tahun');

    var headers = {
      'Content-Type': 'application/json',
    };

    var response = await http.get(
      url,
      headers: headers
    );

    // print((response.body));
    // print("bisa tahun");

    if (response.statusCode == 200) {
      List  data = jsonDecode(response.body)['data'];
      List<TahunModel> tahun = [];

      for (var item in data) {
        tahun.add(TahunModel.fromJson(item));
      }
      return tahun;
    } else {
      throw Exception("Gagal Ambil data tahun");
    }
  }

  //ambil data semester
  Future<List<SemesterModel>> getsemester() async{
    var url = Uri.parse('$baseUrl/semester');

    var headers = {
      'Content-Type': 'application/json',
    };

    var response = await http.get(
      url,
      headers: headers
    );

    // print((response.body));
    // print("bisa semester");

    if (response.statusCode == 200) {
      List  data = jsonDecode(response.body)['data'];
      List<SemesterModel> semester = [];

      for (var item in data) {
        semester.add(SemesterModel.fromJson(item));
      }
      return semester;
    } else {
      throw Exception("Gagal Ambil data semester");
    }
  }

  //ambil data rapor siswa berdasarkan kelompok,tahun ajaran, dan semester
  Future<List<RaporSiswaModel>> getRaporSiswaD(String token, String sem, String jenis, String tipe, String tahun) async{
    var url = Uri.parse('$baseUrl/nilaiRaporD?sem=$sem&jenis=$jenis&tipe=$tipe&tahun=$tahun');

    var headers = {
      'Content-Type': 'application/json',
      'Authorization' : token
    };

    var response = await http.get(
      url,
      headers: headers
    );

    // print((response.body));
    print("bisa rapor detail");

    if (response.statusCode == 200) {
      List  data = jsonDecode(response.body)['data'];
      List<RaporSiswaModel> rapor = [];

      for (var item in data) {
        rapor.add(RaporSiswaModel.fromJson(item));
      }
      return rapor;
    } else {
      throw Exception("Gagal Ambil data rapor detail");
    }
  }

}