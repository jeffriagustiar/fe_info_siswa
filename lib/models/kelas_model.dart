class KelasModel{
  late String? kelas;

  KelasModel({
    this.kelas = ''
  });

  factory KelasModel.fromJson(Map<String, dynamic> json){
    return KelasModel(kelas: json['kelas']);
  }

  Map<String, dynamic> toJson(){
    return{
      'kelas' : kelas
    };
  }
}