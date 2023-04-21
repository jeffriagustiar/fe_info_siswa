import 'dart:convert';

import 'package:fe_info_siswa/models/absen/absen_pelajaran_hitung_model.dart';
import 'package:fe_info_siswa/models/absen/absen_per_pelajaran_detail_model.dart';
import 'package:fe_info_siswa/models/absen/detail_absen_pelajaran_model.dart';
import 'package:fe_info_siswa/models/nilai/jenis_nilai_harian_model.dart';
import 'package:fe_info_siswa/models/mapel_model.dart';
import 'package:fe_info_siswa/models/nilai/mapel_nilai_harian_model.dart';
import 'package:fe_info_siswa/models/nilai/nilai_harian_model.dart';
import 'package:fe_info_siswa/models/absen/presen_siswa_model.dart';
import 'package:fe_info_siswa/models/nilai/rapor_siswa_model.dart';
import 'package:fe_info_siswa/models/semester_model.dart';
import 'package:fe_info_siswa/models/siswa_model.dart';
import 'package:fe_info_siswa/models/tahun_model.dart';
import 'package:fe_info_siswa/provider/auth_provider.dart';
import 'package:fe_info_siswa/share/theme.dart';
import 'package:http/http.dart' as http;
import 'package:sp_util/sp_util.dart';

class SiswaService{
  late AuthProvider authProvider;
  final String baseUrl = url;
  final String bearrerToken = SpUtil.getString('token').toString();
  // final String baseUrl = 'http://127.0.0.1:8000/api';
  // final String baseUrl = 'http://192.168.46.56:8000/api';

  //ambil semua data siswa
  Future<List<SiswaModel>> getSiswa() async{
    var url = Uri.parse('$baseUrl/dataSiswa');

    var headers = {
      'Content-Type': 'application/json',
      'Authorization' : bearrerToken
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
  Future<SiswaModel> getSiswaByNis(int nis) async{
    var url = Uri.parse('$baseUrl/dataSiswa/?nis=$nis');

    var headers = {
      'Content-Type': 'application/json',
      'Authorization' : bearrerToken
    };

    var response = await http.get(
      url,
      headers: headers
    );

    // print(response.body);
    // print("bisa siswa");

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['data'];
      final siswa = SiswaModel.fromJson(data);

      return siswa;
    } else {
      throw Exception("Gagal Ambil data siswa nis");
    }
  }

  //ambil data rapor siswa dengan sortir semester
  Future<List<RaporSiswaModel>> getRaporSiswa(String semester) async{
    var url = Uri.parse('$baseUrl/nilaiRapor/?id=$semester');

    var headers = {
      'Content-Type': 'application/json',
      'Authorization' : bearrerToken
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
  Future<List<PresensionSiswaModel>> getpresenSiswa(String year, String month) async{
    var url = Uri.parse('$baseUrl/absenHarianSiswa?year=$year&month=$month');

    var headers = {
      'Content-Type': 'application/json',
      'Authorization' : bearrerToken
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

  //ambil data kehadiran siswa dengan sortir tahun untuk matapelajaran
  Future<List<AbsenPelajaranHitungModel>> getAbsenPelajaranSiswa(String year) async{
    var url = Uri.parse('$baseUrl/absenPelajaran?year=$year');

    var headers = {
      'Content-Type': 'application/json',
      'Authorization' : bearrerToken
    };

    var response = await http.get(
      url,
      headers: headers
    );

    // print((response.body));
    // print("bisa absen pelajaran siswa");

    if (response.statusCode == 200) {
      List  data = jsonDecode(response.body)['data'];
      List<AbsenPelajaranHitungModel> AbsenPelajaranSiswa = [];

      for (var item in data) {
        AbsenPelajaranSiswa.add(AbsenPelajaranHitungModel.fromJson(item));
      }
      return AbsenPelajaranSiswa;
    } else {
      throw Exception("Gagal Ambil data absen pelajaran siswa");
    }
  }

  //ambil data kehadiran siswa dengan sortir tahun untuk matapelajaran detail
  Future<List<DetailAbsenPelajaranModel>> getAbsenPelajaranSiswaDetail(String year, String month, String status) async{
    var url = Uri.parse('$baseUrl/absenPelajaranDetail?year=$year&month=$month&status=$status');

    var headers = {
      'Content-Type': 'application/json',
      'Authorization' : bearrerToken
    };

    var response = await http.get(
      url,
      headers: headers
    );

    // print((response.body));
    print("bisa absen pelajaran siswa detail");

    if (response.statusCode == 200) {
      List  data = jsonDecode(response.body)['data'];
      List<DetailAbsenPelajaranModel> AbsenPelajaranSiswaDetail = [];

      for (var item in data) {
        AbsenPelajaranSiswaDetail.add(DetailAbsenPelajaranModel.fromJson(item));
      }
      return AbsenPelajaranSiswaDetail;
    } else {
      throw Exception("Gagal Ambil data absen pelajaran siswa detail");
    }
  }

  //ambil data tahun ajaran
  Future<List<TahunModel>> gettahun() async{
    var url = Uri.parse('$baseUrl/tahun');

    var headers = {
      'Content-Type': 'application/json',
      'Authorization' : bearrerToken
    };

    var response = await http.get(
      url,
      headers: headers
    );

    // print((response.body));
    print("bisa tahun");

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
  Future<List<SemesterModel>> getsemester(
    // String token
  ) async{
    var url = Uri.parse('$baseUrl/semester');

    var headers = {
      'Content-Type': 'application/json',
      'Authorization' : bearrerToken
    };

    var response = await http.get(
      url,
      headers: headers
    );

    // print((response.body));
    print("bisa semester");

    if (response.statusCode == 200) {
      List  data = jsonDecode(response.body)['data'];
      List<SemesterModel> semester = [];

      for (var item in data) {
        semester.add(SemesterModel.fromJson(item));
      }
      return semester;
    } else {
      throw Exception("Gagal Ambil data semester, Status code: ${response.statusCode}",);
    }
  }

  //ambil data rapor siswa berdasarkan kelompok,tahun ajaran, dan semester
  Future<List<RaporSiswaModel>> getRaporSiswaD(String sem, String jenis, String tipe, String tahun) async{
    var url = Uri.parse('$baseUrl/nilaiRaporD?sem=$sem&jenis=$jenis&tipe=$tipe&tahun=$tahun');

    var headers = {
      'Content-Type': 'application/json',
      'Authorization' : bearrerToken
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
      // throw Exception(response.statusCode);
    }
  }
  //ambil data rapor siswa berdasarkan kelompok,tahun ajaran, dan semester
  //khusus nilai rapor pancasila
  Future<List<RaporSiswaModel>> getRaporSiswaP(String sem, String tahun,String mapel) async{
      var url = Uri.parse('$baseUrl/nilaiRaporPancasila?sem=$sem&tahun=$tahun&mapel=$mapel');

    var headers = {
      'Content-Type': 'application/json',
      'Authorization' : bearrerToken
    };

    var response = await http.get(
      url,
      headers: headers
    );

    // print((response.body));
    print("bisa rapor detail pancasila");

    if (response.statusCode == 200) {
      List  data = jsonDecode(response.body)['data'];
      List<RaporSiswaModel> rapor = [];

      for (var item in data) {
        rapor.add(RaporSiswaModel.fromJson(item));
      }
      return rapor;
    } else {
      throw Exception("Gagal Ambil data rapor detail pancasila");
      // throw Exception(response.statusCode);
    }
  }

  //ambil data Mapel berdasarkan kelompok
  Future<List<MapelModel>> getMapel(String jenis) async{
    var url = Uri.parse('$baseUrl/mapel?jenis=$jenis');

    var headers = {
      'Content-Type': 'application/json',
      'Authorization' : bearrerToken
    };

    var response = await http.get(
      url,
      headers: headers
    );

    // print((response.body));
    // print("bisa mapel");

    if (response.statusCode == 200) {
      List  data = jsonDecode(response.body)['data'];
      List<MapelModel> mapel = [];

      for (var item in data) {
        mapel.add(MapelModel.fromJson(item));
      }
      return mapel;
    } else {
      throw Exception("Gagal Ambil data matapelajaran");
    }
  }

  //ambil data Mapel Absen Per Mapel
  Future<List<MapelNilaiHarianModel>> getMapelAbsen(String tahun) async{
    var url = Uri.parse('$baseUrl/MapelAbsenPerPelajaran?year=$tahun');

    var headers = {
      'Content-Type': 'application/json',
      'Authorization' : bearrerToken
    };

    var response = await http.get(
      url,
      headers: headers
    );

    // print((response.body));
    print("bisa mapel absen");

    if (response.statusCode == 200) {
      List  data = jsonDecode(response.body)['data'];
      List<MapelNilaiHarianModel> mapel = [];

      for (var item in data) {
        mapel.add(MapelNilaiHarianModel.fromJson(item));
      }
      return mapel;
    } else {
      throw Exception("Gagal Ambil data matapelajaran");
    }
  }

  //ambil data Detail Absen Per Mapel
  Future<List<AbsenPerPelajaranDetailModel>> getDetailAbsenPerMapel(String tahun, String month, String mapel) async{
    var url = Uri.parse('$baseUrl/MapelAbsenPerPelajaranDetail?year=$tahun&month=$month&mapel=$mapel');

    var headers = {
      'Content-Type': 'application/json',
      'Authorization' : bearrerToken
    };

    var response = await http.get(
      url,
      headers: headers
    );

    // print((response.body));
    print("bisa detail absen per mapel");

    if (response.statusCode == 200) {
      List  data = jsonDecode(response.body)['data'];
      List<AbsenPerPelajaranDetailModel> mapel = [];

      for (var item in data) {
        mapel.add(AbsenPerPelajaranDetailModel.fromJson(item));
      }
      return mapel;
    } else {
      throw Exception("Gagal Ambil data detail absen per mapel");
    }
  }

  //ambil data Nilai Harian Siswa Berdasarkan mapel
  Future<List<NilaiHarianModel>> getNilaiHarin(String jenis) async{
    var url = Uri.parse('$baseUrl/nilaiHarian?jenis=$jenis');

    var headers = {
      'Content-Type': 'application/json',
      'Authorization' : bearrerToken
    };

    var response = await http.get(
      url,
      headers: headers
    );

    // print((response.body));
    // ignore: avoid_print
    // print("bisa nilai harian");

    if (response.statusCode == 200) {
      List  data = jsonDecode(response.body)['data'];
      List<NilaiHarianModel> nilaiHarian = [];

      for (var item in data) {
        nilaiHarian.add(NilaiHarianModel.fromJson(item));
      }
      return nilaiHarian;
    } else {
      throw Exception("Gagal Ambil data nilai harian");
    }
  }

  //ambil data Jenis Nilai Harian Siswa Berdasarkan mapel
  Future<List<JenisNilaiHarianModel>> getJenisNilaiHarin(String mapel, String tahun, String sem) async{
    var url = Uri.parse('$baseUrl/nilaiHarianJenis?mapel=$mapel&tahun=$tahun&sem=$sem');

    var headers = {
      'Content-Type': 'application/json',
      'Authorization' : bearrerToken
    };

    var response = await http.get(
      url,
      headers: headers
    );

    // print((response.body));
    // ignore: avoid_print
    // print("bisa jenis nilai harian");

    if (response.statusCode == 200) {
      List  data = jsonDecode(response.body)['data'];
      List<JenisNilaiHarianModel> JenisNilaiHarian = [];

      for (var item in data) {
        JenisNilaiHarian.add(JenisNilaiHarianModel.fromJson(item));
      }
      return JenisNilaiHarian;
    } else {
      throw Exception("Gagal Ambil data jenis nilai harian");
    }
  }

  //ambil data mapel Nilai Harian Siswa Berdasarkan jenis tahun semester
  Future<List<MapelNilaiHarianModel>> getMapelNilaiHarin(String tahun, String sem, String jenis) async{
    var url = Uri.parse('$baseUrl/mapelNilai?tahun=$tahun&sem=$sem&jenis=$jenis');

    var headers = {
      'Content-Type': 'application/json',
      'Authorization' : bearrerToken
    };

    var response = await http.get(
      url,
      headers: headers
    );

    // print((response.body));
    // ignore: avoid_print
    // print("bisa mapel nilai harian");

    if (response.statusCode == 200) {
      List  data = jsonDecode(response.body)['data'];
      List<MapelNilaiHarianModel> MapelNilaiHarian = [];

      for (var item in data) {
        MapelNilaiHarian.add(MapelNilaiHarianModel.fromJson(item));
      }
      return MapelNilaiHarian;
    } else {
      throw Exception("Gagal Ambil data mapel nilai harian");
    }
  }

  //ambil data tahun, 5 tahun kebelakang
  Future<List<TahunModel>> getDataTahun() async{
    var url = Uri.parse('$baseUrl/tahunAbsen');

    var headers = {
      'Content-Type': 'application/json',
    };

    var response = await http.get(
      url,
      headers: headers
    );

    // print((response.body));
    // ignore: avoid_print
    // print("bisa tahun mundur");

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

}