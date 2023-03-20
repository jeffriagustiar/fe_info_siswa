class SemesterModel{
  late String? replid;
  late String? semester;

  SemesterModel({
    required this.replid,
    required this.semester,
  });

  factory SemesterModel.fromJson(Map<String, dynamic> json){
    return SemesterModel(
      replid: json['replid'].toString(), 
      semester: json['semester']
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'replid' : replid,
      'semester' : semester
    };
  }
}