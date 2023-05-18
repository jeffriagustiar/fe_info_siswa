class KategoriModel{
  late int? replid;
  late String? namaKategori;
  late String? kategori;
  late String? ket;
  late String? ts;

  KategoriModel({
    this.replid,
    this.namaKategori,
    this.kategori,
    this.ket,
    this.ts,
  });

  factory KategoriModel.fromJson(Map<String, dynamic> json){
    return KategoriModel(
      replid:  json['replid'],
      namaKategori: json['nama_kategori'],
      kategori: json['kategori'],
      ket: json['ket'],
      ts: json['ts'],
    );
  }

  Map<String, dynamic> toJson(){
    return{
      'replid': replid,
      'nama_kategori': namaKategori,
      'kategori': kategori,
      'ket': ket,
      'ts': ts,
    };
  }
}