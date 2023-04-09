class MapelNilaiHarianModel{
  late String? idpelajaran;
  late String? kode;
  late String? nama;

  MapelNilaiHarianModel({
    required this.idpelajaran,
    required this.kode,
    required this.nama,
  });

  factory MapelNilaiHarianModel.fromJson(Map<String, dynamic> json){
    return MapelNilaiHarianModel(
      idpelajaran: json['idpelajaran'].toString(), 
      kode: json['kode'],
      nama: json['nama'],
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'idpelajaran' : idpelajaran,
      'kode' : kode,
      'nama' : nama,
    };
  }
}