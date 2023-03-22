class NilaiHarianModel{
  late String? tanggal;
  late String? nilaiujian;
  late String? keterangan;
  late String? ts;
  late String? keterangan2;
  late String? jenisujian;
  late String? nama;
  late String? kode;

  NilaiHarianModel({
    required this.tanggal,
    required this.nilaiujian,
    required this.keterangan,
    required this.ts,
    required this.keterangan2,
    required this.jenisujian,
    required this.nama,
    required this.kode,
  });

  factory NilaiHarianModel.fromJson(Map<String, dynamic> json){
    return NilaiHarianModel(
      tanggal: json['tanggal'], 
      nilaiujian: json['nilaiujian'], 
      keterangan: json['keterangan'], 
      ts: json['ts'], 
      keterangan2: json['keterangan2'], 
      jenisujian: json['jenisujian'], 
      nama: json['nama'], 
      kode: json['kode']
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'tanggal' : tanggal,
      'nilaiujian' : nilaiujian,
      'keterangan' : keterangan,
      'ts' : ts,
      'keterangan2' : keterangan2,
      'jenisujian' : jenisujian,
      'nama' : nama,
      'kode' : kode,
    };
  }
}