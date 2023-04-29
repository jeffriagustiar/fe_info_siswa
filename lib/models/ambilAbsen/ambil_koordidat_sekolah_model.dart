class AmbilKoordinatSekolahModel{
  late int? replid;
  late String? departemen;
  late String? jenis;
  late int? jarak;
  late String? nama;
  late double? latitude;
  late double? longitude;
  

  AmbilKoordinatSekolahModel({
    this.replid, 
    this.departemen,
    this.jenis,
    this.jarak,
    this.nama,
    this.latitude,
    this.longitude
  });

  factory AmbilKoordinatSekolahModel.fromJson(Map<String, dynamic> json){
    return AmbilKoordinatSekolahModel(
      replid:  json['replid'], 
      departemen:  json['departemen'], 
      jenis:  json['jenis'], 
      jarak:  json['jarak'], 
      nama:  json['nama'], 
      latitude: double.parse(json['latitude']) , 
      longitude: double.parse(json['longitude']), 
    );
  }

  Map<String, dynamic> toJson(){
    return{
      'replid': replid,
      // 'departemen': departemen,
      // 'jenis': jenis,
      // 'jarak': jarak,
      // 'nama': nama,
      // 'latitude': latitude,
      // 'longitude': longitude
    };
  }
}