class SppModel{
  late String? besar;
  late String? dibayar;
  late int? sisa;
  late String? persen;
  late int? persen2;

  SppModel({
    required this.besar,
    required this.dibayar,
    required this.sisa,
    required this.persen,
    required this.persen2,
  });

  factory SppModel.fromJson(Map<String , dynamic> json){
    return SppModel(
      besar: json['besar'], 
      dibayar: json['dibayar'], 
      sisa: json['sisa'], 
      persen: json['persen'],
      persen2: json['persen2']
    );
  }

  Map<String , dynamic> toJson(){
    return {
      'besar': besar, 
      'dibayar': dibayar, 
      'sisa': sisa, 
      'persen': persen,
      'persen2': persen2,
    };
  }
}