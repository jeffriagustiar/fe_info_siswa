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

  List<RaporSiswaModel> _raporP = [];

  List<RaporSiswaModel> get raporP => _raporP;

  set raporP(List<RaporSiswaModel> raporP){
    _raporP = raporP;
    notifyListeners();
  }

  List<PresensionSiswaModel> _presen = [];

  List<PresensionSiswaModel> get presen => _presen;

  set presen(List<PresensionSiswaModel> presen){
    _presen = presen;
    notifyListeners();
  }

  List<AbsenPelajaranHitungModel> _absenPelajaran = [];

  List<AbsenPelajaranHitungModel> get absenPelajaran => _absenPelajaran;

  set absenPelajaran(List<AbsenPelajaranHitungModel> absenPelajaran){
    _absenPelajaran = absenPelajaran;
    notifyListeners();
  }

  List<DetailAbsenPelajaranModel> _absenPelajaranDetail = [];

  List<DetailAbsenPelajaranModel> get absenPelajaranDetail => _absenPelajaranDetail;

  set absenPelajaranDetail(List<DetailAbsenPelajaranModel> absenPelajaranDetail){
    _absenPelajaranDetail = absenPelajaranDetail;
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

  List<JenisNilaiHarianModel> _jenisNilaiHarian = [];

  List<JenisNilaiHarianModel> get jenisNilaiHarian => _jenisNilaiHarian;

  set jenisNilaiHarian(List<JenisNilaiHarianModel> jenisNilaiHarian){
    _jenisNilaiHarian = jenisNilaiHarian;
    notifyListeners();
  }

  List<MapelNilaiHarianModel> _mapelNilaiHarian = [];

  List<MapelNilaiHarianModel> get mapelNilaiHarian => _mapelNilaiHarian;

  set mapelNilaiHarian(List<MapelNilaiHarianModel> mapelNilaiHarian){
    _mapelNilaiHarian = mapelNilaiHarian;
    notifyListeners();
  }

  List<AbsenPerPelajaranDetailModel> _absenPerMapel = [];

  List<AbsenPerPelajaranDetailModel> get absenPerMapel => _absenPerMapel;

  set absenPerMapel(List<AbsenPerPelajaranDetailModel> absenPerMapel){
    _absenPerMapel = absenPerMapel;
    notifyListeners();
  }






  //ambil data siswa
  Future<void> getsiswa() async{
    try {
      List<SiswaModel> siswa = await SiswaService().getSiswa();
      _siswa = siswa; 
    } catch (e) {
      // ignore: avoid_print
      print(e); 
    }
  }

  // ambil semua detail spp
  Future<void> getSppDetail() async{
    try {
      List<SppModel> spp = await SppService().getSppDetail();
      _spp = spp; 
    } catch (e) {
      // ignore: avoid_print
      print(e); 
    }
  }

  //ambil data rapor semester 1
  Future<void> getRaporSiswa(String semester) async{
    // _rapor = [];
    try {
      List<RaporSiswaModel> rapor = await SiswaService().getRaporSiswa(semester);
      _rapor = rapor; 
    } catch (e) {
      // ignore: avoid_print
      print(e); 
    }
  }

  //ambil data presensi siswa
  Future<void> getpresenSiswa(String year, String month) async{
    // _rapor = [];
    try {
      List<PresensionSiswaModel> presen = await SiswaService().getpresenSiswa(year, month);
      _presen = presen; 
    } catch (e) {
      // ignore: avoid_print
      print(e); 
    }
  }

  //ambil data presensi pelajaran siswa 
  Future<void> getAbsenPelajaranSiswa(String year) async{
    // _rapor = [];
    try {
      List<AbsenPelajaranHitungModel> absenPelajaran = await SiswaService().getAbsenPelajaranSiswa(year);
      _absenPelajaran = absenPelajaran; 
    } catch (e) {
      // ignore: avoid_print
      print(e); 
    }
  }

  //ambil data presensi pelajaran siswa detail
  Future<void> getAbsenPelajaranSiswaDetail(String year, String month, String status) async{
    _absenPelajaranDetail = [];
    try {
      List<DetailAbsenPelajaranModel> absenPelajaranDetail = await SiswaService().getAbsenPelajaranSiswaDetail(year, month, status);
      _absenPelajaranDetail = absenPelajaranDetail; 
    } catch (e) {
      // ignore: avoid_print
      print(e); 
    }
  }

  //ambil data tahun ajaran
  Future<void> gettahun() async{
    try {
      List<TahunModel> tahun = await SiswaService().gettahun();
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
  Future<void> getRaporSiswaD(String sem, String jenis, String tipe, String tahun) async{
    _rapor = [];
    try {
      List<RaporSiswaModel> rapor = await SiswaService().getRaporSiswaD(sem, jenis, tipe, tahun);
      _rapor = rapor; 
    } catch (e) {
      // ignore: avoid_print
      print(e); 
    }
  }

  //ambil data rapor siswa berdasarkan kelompok,tahun ajaran, dan semester
  // khusus rapor pancasila
  Future<void> getRaporSiswaP(String sem, String tahun,String mapel) async{
    _raporP = [];
    try {
      List<RaporSiswaModel> raporP = await SiswaService().getRaporSiswaP(sem, tahun, mapel);
      _raporP = raporP; 
    } catch (e) {
      // ignore: avoid_print
      print(e); 
    }
  }

  //ambil data Mapel berdasarkan kelompok
  Future<void> getMapel(String jenis) async{
    _mapel = [];
    try {
      List<MapelModel> mapel = await SiswaService().getMapel(jenis);
      _mapel = mapel; 
    } catch (e) {
      // ignore: avoid_print
      print(e); 
    }
  }

  //ambil data nilai harian berdasarkan mapel
  Future<void> getNilaiHarin(String jenis) async{
    _nilaiHarian = [];
    try {
      List<NilaiHarianModel> nilaiHarian = await SiswaService().getNilaiHarin(jenis);
      _nilaiHarian = nilaiHarian; 
    } catch (e) {
      // ignore: avoid_print
      print(e); 
    }
  }

  //ambil data Jenis nilai harian berdasarkan mapel
  Future<void> getJenisNilaiHarin(String mapel, String tahun, String sem) async{
    _jenisNilaiHarian = [];
    try {
      List<JenisNilaiHarianModel> jenisNilaiHarian = await SiswaService().getJenisNilaiHarin(mapel, tahun, sem);
      _jenisNilaiHarian = jenisNilaiHarian; 
    } catch (e) {
      // ignore: avoid_print
      print(e); 
    }
  }

  //ambil data mapel Nilai Harian Siswa Berdasarkan jenis tahun semester
  Future<void> getMapelNilaiHarin(String tahun, String sem, String jenis) async{
    _mapelNilaiHarian = [];
    try {
      List<MapelNilaiHarianModel> mapelNilaiHarian = await SiswaService().getMapelNilaiHarin(tahun, sem, jenis);
      _mapelNilaiHarian = mapelNilaiHarian; 
    } catch (e) {
      // ignore: avoid_print
      print(e); 
    }
  }

  //ambil data mapel Absen Pelajaran Siswa Berdasarkan tahun bulan
  Future<void> getMapelAbsen(String tahun) async{
    _mapelNilaiHarian = [];
    try {
      List<MapelNilaiHarianModel> mapelNilaiHarian = await SiswaService().getMapelAbsen(tahun);
      _mapelNilaiHarian = mapelNilaiHarian; 
    } catch (e) {
      // ignore: avoid_print
      print(e); 
    }
  }

  //ambil data Detail Absen Per Pelajaran Siswa Berdasarkan tahun bulan dan mapel
  Future<void> getDetailAbsenPerMapel(String tahun, String month, String mapel) async{
    try {
      List<AbsenPerPelajaranDetailModel> absenPerMapel = await SiswaService().getDetailAbsenPerMapel(tahun, month, mapel);
      _absenPerMapel = absenPerMapel; 
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