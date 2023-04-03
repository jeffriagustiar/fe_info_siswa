class AbsenPelajaranHitungModel{
  late String? tahun;
  late String? bulan;
  late String? namaBulan;
  late String? hadir;
  late String? ijin;
  late String? sakit;
  late String? alpa;

  AbsenPelajaranHitungModel({
    required this.tahun,
    required this.bulan,
    required this.namaBulan,
    required this.hadir,
    required this.ijin,
    required this.sakit,
    required this.alpa,
  });

  factory AbsenPelajaranHitungModel.fromJson(Map<String, dynamic> json){
    return AbsenPelajaranHitungModel(
      tahun: json['tahun'].toString(), 
      bulan: json['bulan'].toString(), 
      namaBulan: json['namaBulan'], 
      hadir: json['hadir'].toString(), 
      ijin: json['ijin'].toString(), 
      sakit: json['sakit'].toString(), 
      alpa: json['alpa'].toString()
    );
  }

  Map<String, dynamic> toJson(){
    return{
      'tahun': tahun,
      'bulan': bulan,
      'namaBulan': namaBulan,
      'hadir': hadir,
      'sakit': sakit,
      'ijin': ijin,
      'alpa': alpa,
    };
  }
}