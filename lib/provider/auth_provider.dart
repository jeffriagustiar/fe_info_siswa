import 'package:fe_info_siswa/models/user_model.dart';
import 'package:fe_info_siswa/services/auth_service.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier{
  late UserModel _user;

  UserModel get user => _user;

  set user(UserModel user) {
    _user = user;
    notifyListeners();
  }

  Future<bool> login({
    required String nis,
    required String pinsiswa,
  }) async {
    
    try {
      UserModel user = await AuthService().login(
        nis: nis, 
        pinsiswa: pinsiswa
      );

      _user = user;
      return true;
    } catch (e) {
      // ignore: avoid_print
      print(e); 
      return false;
    }

  }

  Future<bool> logout({
    required String nis,
    required String token,
  }) async {
    try {
      UserModel user = await AuthService().logout(
        nis: nis, 
        token: token
      );

      _user = user;
      return true;
    } catch (e) {
      // ignore: avoid_print
      print(e);
      return false;
    }
  }
}