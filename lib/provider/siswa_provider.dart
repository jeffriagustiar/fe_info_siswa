import 'package:fe_info_siswa/models/mapel_model.dart';
import 'package:fe_info_siswa/models/nilai_harian_model.dart';
import 'package:fe_info_siswa/models/presen_siswa_model.dart';
import 'package:fe_info_siswa/models/rapor_siswa_model.dart';
import 'package:fe_info_siswa/models/semester_model.dart';
import 'package:fe_info_siswa/models/siswa_model.dart';
import 'package:fe_info_siswa/models/spp_model.dart';
import 'package:fe_info_siswa/models/tahun_model.dart';
import 'package:fe_info_siswa/services/siswa_service.dart';
import 'package:fe_info_siswa/services/spp_service.dart';
import 'package:flutter/material.dart';

class SiswaProvider with ChangeNotifier{
  List<SiswaModel> _siswa = [];

  List<SiswaModel> get siswa => _siswa;

  set siswa(List<SiswaModel> siswa){
    _siswa = siswa;
    notifyListeners();
  }

  List<SppModel> _spp = [];

  List<SppModel> get spp => _spp;

  set spp(List<SppModel> spp){
    _spp = spp;
    notifyListeners();
  }

  List<RaporSiswaModel> _rapor = [];

  List<RaporSiswaModel> get rapor => _rapor;

  set rapor(List<RaporSiswaModel> rapor){
    _rapor = rapor;
    notifyListeners();
  }

  List<PresensionSiswaModel> _presen = [];

  List<PresensionSiswaModel> get presen => _presen;

  set presen(List<PresensionSiswaModel> presen){
    _presen = presen;
    notifyListeners();
  }

  List<TahunModel> _tahun = [];

  List<TahunModel> get tahun => _tahun;

  set tahun(List<TahunModel> tahun){
    _tahun = tahun;
    notifyListeners();
  }

  List<SemesterModel> _semester = [];

  List<SemesterModel> get semester => _semester;

  set semester(List<SemesterModel> semester){
    _semester = semester;
    notifyListeners();
  }

  List<MapelModel> _mapel = [];

  List<MapelModel> get mapel => _mapel;

  set mapel(List<MapelModel> mapel){
    _mapel = mapel;
    notifyListeners();
  }

  List<NilaiHarianModel> _nilaiHarian = [];

  List<NilaiHarianModel> get nilaiHarian => _nilaiHarian;

  set nilaiHarian(List<NilaiHarianModel> nilaiHarian){
    _nilaiHarian = nilaiHarian;
    notifyListeners();
  }






  //ambil data siswa
  Future<void> getsiswa(String token) async{
    try {
      List<SiswaModel> siswa = await SiswaService().getSiswa(token);
      _siswa = siswa; 
    } catch (e) {
      // ignore: avoid_print
      print(e); 
    }
  }

  // ambil semua detail spp
  Future<void> getSppDetail(String token) async{
    try {
      List<SppModel> spp = await SppService().getSppDetail(token);
      _spp = spp; 
    } catch (e) {
      // ignore: avoid_print
      print(e); 
    }
  }

  //ambil data rapor semester 1
  Future<void> getRaporSiswa(String token, String semester) async{
    // _rapor = [];
    try {
      List<RaporSiswaModel> rapor = await SiswaService().getRaporSiswa(token, semester);
      _rapor = rapor; 
    } catch (e) {
      // ignore: avoid_print
      print(e); 
    }
  }

  //ambil data presensi siswa
  Future<void> getpresenSiswa(String token, String year, String month) async{
    // _rapor = [];
    try {
      List<PresensionSiswaModel> presen = await SiswaService().getpresenSiswa(token, year, month);
      _presen = presen; 
    } catch (e) {
      // ignore: avoid_print
      print(e); 
    }
  }

  //ambil data tahun ajaran
  Future<void> gettahun(String token) async{
    try {
      List<TahunModel> tahun = await SiswaService().gettahun(token);
      _tahun = tahun; 
    } catch (e) {
      // ignore: avoid_print
      print(e); 
    }
  }

  //ambil data semester
  Future<void> getsemester(/*String token*/) async{
    try {
      List<SemesterModel> semester = await SiswaService().getsemester(/*token*/);
      _semester = semester; 
    } catch (e) {
      // ignore: avoid_print
      print(e); 
    }
  }

  //ambil data rapor siswa berdasarkan kelompok,tahun ajaran, dan semester
  Future<void> getRaporSiswaD(String token, String sem, String jenis, String tipe, String tahun) async{
    _rapor = [];
    try {
      List<RaporSiswaModel> rapor = await SiswaService().getRaporSiswaD(token, sem, jenis, tipe, tahun);
      _rapor = rapor; 
    } catch (e) {
      // ignore: avoid_print
      print(e); 
    }
  }

  //ambil data Mapel berdasarkan kelompok
  Future<void> getMapel(String jenis) async{
    try {
      List<MapelModel> mapel = await SiswaService().getMapel(jenis);
      _mapel = mapel; 
    } catch (e) {
      // ignore: avoid_print
      print(e); 
    }
  }

  //ambil data nilai harian berdasarkan mapel
  Future<void> getNilaiHarin(String token, String mapel, String tahun, String sem) async{
    try {
      List<NilaiHarianModel> nilaiHarian = await SiswaService().getNilaiHarin(token, mapel, tahun, sem);
      _nilaiHarian = nilaiHarian; 
    } catch (e) {
      // ignore: avoid_print
      print(e); 
    }
  }

  // ambil data tahun, 5 tahun kebelakang
  Future<void> getDataTahun() async{
    try {
      List<TahunModel> tahun = await SiswaService().getDataTahun();
      _tahun = tahun; 
    } catch (e) {
      // ignore: avoid_print
      print(e); 
    }
  }

}