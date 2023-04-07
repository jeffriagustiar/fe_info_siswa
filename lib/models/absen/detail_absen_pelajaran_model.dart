class DetailAbsenPelajaranModel{
  late String? tanggal;
  late String? jam;
  late String? nama;

  DetailAbsenPelajaranModel({
    required this.tanggal,
    required this.jam,
    required this.nama,
  });

  factory DetailAbsenPelajaranModel.fromJson(Map<String, dynamic> json){
    return DetailAbsenPelajaranModel(
      tanggal: json['tanggal'].toString(), 
      jam: json['jam'].toString(), 
      nama: json['nama']
    );
  }

  Map<String, dynamic> toJson(){
    return{
      'tanggal': tanggal,
      'jam': jam,
      'nama': nama,
    };
  }
}