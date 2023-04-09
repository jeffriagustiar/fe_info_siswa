class RaporSiswaModel{
  late String? nama;
  late String? nilaiangka;
  late String? nilaihuruf;
  // late String? idsemester;
  late String? dasarpenilaian;
  late String? komentar;
  late String? komentar2;

  RaporSiswaModel({
    this.nama,
    this.nilaiangka,
    this.nilaihuruf,
    // this.idsemester,
    this.dasarpenilaian,
    this.komentar,
    this.komentar2
  });

  factory RaporSiswaModel.fromJson(Map<String, dynamic> json){
    return RaporSiswaModel(
      nama:  json['nama'],
      nilaiangka:  json['nilaiangka'],
      nilaihuruf:  json['nilaihuruf'],
      // idsemester:  json['idsemester'],
      dasarpenilaian:  json['dasarpenilaian'],
      komentar:  json['komentar'],
      komentar2:  json['komentar2'],
    );
  }

  Map<String, dynamic> toJson(){
    return{
      'nama': nama,
      'nilaiangka': nilaiangka,
      'nilaihuruf': nilaihuruf,
      // 'idsemester': idsemester,
      'dasarpenilaian': dasarpenilaian,
      'komentar': komentar,
      'komentar2': komentar2,
    };
  }
}