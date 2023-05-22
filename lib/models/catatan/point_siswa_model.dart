class PointSiswaModel{
  late String? prestasi;
  late String? pelanggaran;
  late String? hukuman;
  late String? total;

  PointSiswaModel({
    this.prestasi,
    this.pelanggaran,
    this.hukuman,
    this.total
  });

  factory PointSiswaModel.fromJson(Map<String, dynamic> json){
    return PointSiswaModel(
      prestasi: json['prestasi'].toString(),
      pelanggaran: json['pelanggaran'].toString(),
      hukuman: json['hukuman'].toString(),
      total: json['total'].toString(),
    );
  }
}