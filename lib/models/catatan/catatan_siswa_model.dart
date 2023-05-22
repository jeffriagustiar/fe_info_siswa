class CatatanSiswaModel{
    late String? namaKategori;
    late String? namaCtt;
    late String? ket;
    late String? tanggal;
    late int? point;

    CatatanSiswaModel({
      this.namaKategori,
      this.namaCtt,
      this.ket,
      this.tanggal,
      this.point
    });

    factory CatatanSiswaModel.fromJson(Map<String, dynamic> json){
      return CatatanSiswaModel(
        namaKategori: json['nama_kategori'],
        namaCtt: json['nama_ctt'],
        ket: json['ket'],
        tanggal: json['tanggal'],
        point: json['point'],
      );
    }

    Map<String, dynamic> toJson(){
      return{
        'nama_kategori' : namaKategori,
        'nama_ctt' : namaCtt,
        'ket' : ket,
        'tanggal' : tanggal,
        'point' : point
      };
    }
}