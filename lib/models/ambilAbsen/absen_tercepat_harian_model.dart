import 'package:fe_info_siswa/models/kelas_model.dart';
import 'package:fe_info_siswa/models/siswa_model.dart';

class AbsenTercepatHarianModel{
  late int? replid;
  late String? masuk;
  late SiswaModel? siswa;
  late KelasModel? kelas;

  AbsenTercepatHarianModel({
    this.replid, 
    this.masuk, 
    this.siswa, 
    this.kelas
  });

  factory AbsenTercepatHarianModel.fromJson(Map<String, dynamic> json){
    return AbsenTercepatHarianModel(
      replid:  json['replid'], 
      masuk:  json['masuk'], 
      siswa: SiswaModel.fromJson(json['siswa']),
      kelas: KelasModel.fromJson(json['siswa']['kelas']),
    );
  }

  Map<String, dynamic> toJson(){
    return{
      'replid': replid,
      'masuk': masuk,
      'siswa' : siswa?.toJson(),
      'kelas' : kelas?.toJson(),
    };
  }
}