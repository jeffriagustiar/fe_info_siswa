import 'package:fe_info_siswa/models/rapor_siswa_model.dart';
import 'package:fe_info_siswa/models/siswa_model.dart';
import 'package:fe_info_siswa/models/spp_model.dart';
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

  //ambil data siswa
  Future<void> getsiswa(String token) async{
    try {
      List<SiswaModel> siswa = await SiswaService().getSiswa(token);
      _siswa = siswa; 
    } catch (e) {
      print(e); 
    }
  }

  // ambil semua detail spp
  Future<void> getSppDetail(String token) async{
    try {
      List<SppModel> spp = await SppService().getSppDetail(token);
      _spp = spp; 
    } catch (e) {
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
      print(e); 
    }
  }

}