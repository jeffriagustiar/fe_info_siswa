class MapelModel{
  late String? replid;
  late String? nama;

  MapelModel({
    required this.replid,
    required this.nama,
  });

  factory MapelModel.fromJson(Map<String, dynamic> json){
    return MapelModel(
      replid: json['replid'].toString(), 
      nama: json['nama']
    );
  }

  Map<String, dynamic> toJson(){
    return{
      'replid' : replid,
      'nama' : nama,
    };
  }
}