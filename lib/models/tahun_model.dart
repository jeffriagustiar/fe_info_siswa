class TahunModel{
  late String? tahun;
  late String? departement;

  TahunModel({
    required this.tahun,
    required this.departement,
  });

  factory TahunModel.fromJson(Map<String, dynamic> json){
    return TahunModel(
      tahun: json['tahunajaran'], 
      departement: json['departemen']
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'tahunajaran' : tahun,
      'departemen' : departement,
    };
  }
}