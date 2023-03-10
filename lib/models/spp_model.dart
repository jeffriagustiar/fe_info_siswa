class SppModel{
  // akomulasi dan sisa SPP siswa
  late String? besar;
  late String? dibayar;
  late int? sisa;
  late String? persen;
  late int? persen2;

  // data pembayaran semua SPP siswa
  late String? tanggal;
  late String? jumlah;
  late String? keterangan;

  SppModel({
    //akomulasi dan sisa SPP siswa
    required this.besar,
    required this.dibayar,
    required this.sisa,
    required this.persen,
    required this.persen2,

    // data pembayaran semua SPP siswa
    required this.tanggal,
    required this.jumlah,
    required this.keterangan,
  });

  factory SppModel.fromJson(Map<String , dynamic> json){
    return SppModel(

      //akomulasi dan sisa SPP siswa
      besar: json['besar'], 
      dibayar: json['dibayar'], 
      sisa: json['sisa'], 
      persen: json['persen'],
      persen2: json['persen2'],

      // data pembayaran semua SPP siswa
      tanggal: json['tanggal'],
      jumlah: json['jumlah'],
      keterangan: json['keterangan'],
    );
  }

  Map<String , dynamic> toJson(){
    return {

      //akomulasi dan sisa SPP siswa
      'besar': besar, 
      'dibayar': dibayar, 
      'sisa': sisa, 
      'persen': persen,
      'persen2': persen2,

      //data pembayaran semua SPP siswa
      'tanggal' : tanggal,
      'jumlah' : jumlah,
      'keterangan' : keterangan
    };
  }
}