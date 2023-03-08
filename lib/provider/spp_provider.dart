import 'package:fe_info_siswa/models/spp_model.dart';
import 'package:fe_info_siswa/services/spp_service.dart';
import 'package:flutter/material.dart';

class SppProvider with ChangeNotifier{
  late SppModel _spp = SppModel(
    besar: '0', 
    dibayar: '0', 
    sisa: 0, 
    persen: '0.0',
    persen2: 0
  );

  SppModel get spp => _spp;

  set spp(SppModel spp){
    _spp = spp;
    notifyListeners();
  }

  Future<void> getSpp(String token) async{
    try {
      SppModel spp = await SppService().getSpp(token);
      _spp = spp;
    } catch (e) {
      print(e); 
    }
  }
}