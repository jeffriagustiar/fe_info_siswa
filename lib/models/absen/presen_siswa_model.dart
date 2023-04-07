class PresensionSiswaModel{
  late int? idpresensi;
  late String? nis;
  late int? hadir;
  late int? ijin;
  late int? sakit;
  late int? cuti;
  late int? alpa;
  late String? keterangan;
  late String? ts;

  PresensionSiswaModel({
    this.idpresensi,
    this.nis,
    this.hadir,
    this.ijin,
    this.sakit,
    this.cuti,
    this.alpa,
    this.keterangan,
    this.ts
  });

  factory PresensionSiswaModel.fromJson(Map<String, dynamic> json){
    return PresensionSiswaModel(
      idpresensi:  json['idpresensi'],
      nis:  json['nis'],
      hadir:  json['hadir'],
      ijin:  json['ijin'],
      sakit:  json['sakit'],
      cuti:  json['cuti'],
      alpa:  json['alpa'],
      keterangan:  json['keterangan'],
      ts:  json['ts'],
    );
  }

  Map<String, dynamic> toJson(){
    return{
      'idpresensi' : idpresensi,
      'nis' : nis,
      'hadir' : hadir,
      'ijin' : ijin,
      'sakit' : sakit,
      'cuti' : cuti,
      'alpa' : alpa,
      'keterangan' : keterangan,
      'ts' : ts,
    };
  }
}