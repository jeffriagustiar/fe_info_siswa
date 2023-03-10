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

  Future<void> getsiswa(String token) async{
    try {
      List<SiswaModel> siswa = await SiswaService().getSiswa(token);
      _siswa = siswa; 
    } catch (e) {
      print(e); 
    }
  }

  Future<void> getSppDetail(String token) async{
    try {
      List<SppModel> spp = await SppService().getSppDetail(token);
      _spp = spp; 
    } catch (e) {
      print(e); 
    }
  }

}