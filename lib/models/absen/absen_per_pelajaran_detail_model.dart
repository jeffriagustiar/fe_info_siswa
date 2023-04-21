class AbsenPerPelajaranDetailModel{
  late String? statusHadir;
  late String? keterangan;
  late String? materi;
  late String? tanggal;

  AbsenPerPelajaranDetailModel({
    required this.statusHadir,
    required this.keterangan,
    required this.materi,
    required this.tanggal,
  });

  factory AbsenPerPelajaranDetailModel.fromJson(Map<String, dynamic> json){
    return AbsenPerPelajaranDetailModel(
      statusHadir: json['statusHadir'].toString(), 
      keterangan: json['keterangan'].toString(), 
      materi: json['materi'], 
      tanggal: json['tanggal'].toString()
    );
  }

  Map<String, dynamic> toJson(){
    return{
      'statusHadir': statusHadir,
      'keterangan': keterangan,
      'materi': materi,
      'tanggal': tanggal,
    };
  }
}