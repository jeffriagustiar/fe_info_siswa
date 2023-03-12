import 'package:fe_info_siswa/models/kelas_model.dart';
import 'package:fe_info_siswa/models/siswa_model.dart';
import 'package:fe_info_siswa/services/siswa_service.dart';
import 'package:flutter/material.dart';

class Siswa2Provider with ChangeNotifier{
  late SiswaModel _siswa2 = SiswaModel(
    replid:  0, 
      nis:  0, 
      nisn:  '', 
      nik:  '', 
      nama:  '', 
      panggilan:  '', 
      idkelas:  0, 
      suku:  '', 
      agama:  '', 
      kondisi:  '', 
      kelamin:  '', 
      tmplahir:  '', 
      tgllahir:  '', 
      anakke:  0, 
      jsaudara:  0, 
      berat:  '', 
      tinggi:  '', 
      darah:  '', 
      alamatsiswa:  '', 
      telponsiswa:  '', 
      emailsiswa:  '', 
      asalsekolah:  '', 
      noijasah:  '', 
      tglijasah:  '', 
      namaayah:  '', 
      namaibu:  '', 
      statusayah:  '', 
      statusibu:  '', 
      tmplahirayah:  '', 
      tmplahiribu:  '', 
      tgllahirayah:  '', 
      tgllahiribu:  '', 
      pendidikanayah:  '', 
      pendidikanibu:  '', 
      pekerjaanayah:  '', 
      pekerjaanibu:  '', 
      wali:  '', 
      penghasilanayah:  0, 
      penghasilanibu:  0, 
      alamatortu:  '', 
      hportu:  '', 
      emailayah:  '', 
      alamatsurat:  '', 
      hobi:  '', 
      api_token:  '', 
      pinsiswa:  '', 
      pinortu:  '', 
      pinortuibu:  '',
      hpsiswa: '',
      kelas: KelasModel(
        kelas: ''
      )
  );

  SiswaModel get siswa2 => _siswa2;

  set siswa2(SiswaModel siswa2){
    _siswa2 = siswa2;
    notifyListeners();
  }

  Future<void> getSiswaByNis(String token,int nis) async{
    try {
      SiswaModel siswa = await SiswaService().getSiswaByNis(token, nis);
      _siswa2 = siswa; 
    } catch (e) {
      print(e); 
    }
  }
}