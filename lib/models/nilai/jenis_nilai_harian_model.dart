class JenisNilaiHarianModel{
  late String? replid;
  late String? jenisujian;

  JenisNilaiHarianModel({
    required this.replid,
    required this.jenisujian,
  });

  factory JenisNilaiHarianModel.fromJson(Map<String, dynamic> json){
    return JenisNilaiHarianModel(
      replid: json['replid'].toString(), 
      jenisujian: json['jenisujian']
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'replid' : replid,
      'jenisujian' : jenisujian,
    };
  }
}