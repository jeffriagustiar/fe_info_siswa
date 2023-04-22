class UserModel{
  late int? replid;
  late int? nis;
  late String? nisn;
  late String? nik;
  late String? nama;
  late String? panggilan;
  late int? idkelas;
  late String? suku;
  late String? agama;
  late String? kondisi;
  late String? kelamin;
  late String? tmplahir;
  late String? tgllahir;
  late int? anakke;
  late int? jsaudara;
  late String? berat;
  late String? tinggi;
  late String? darah;
  late String? alamatsiswa;
  late String? telponsiswa;
  late String? emailsiswa;
  late String? asalsekolah;
  late String? noijasah;
  late String? tglijasah;
  late String? namaayah;
  late String? namaibu;
  late String? statusayah;
  late String? statusibu;
  late String? tmplahirayah;
  late String? tmplahiribu;
  late String? tgllahirayah;
  late String? tgllahiribu;
  late String? pendidikanayah;
  late String? pendidikanibu;
  late String? pekerjaanayah;
  late String? pekerjaanibu;
  late String? wali;
  late int? penghasilanayah;
  late int? penghasilanibu;
  late String? alamatortu;
  late String? hportu;
  late String? emailayah;
  late String? alamatsurat;
  late String? hobi;
  // ignore: non_constant_identifier_names
  late String? api_token;
  late String? pinsiswa;
  late String? pinortu;
  late String? pinortuibu;



  UserModel({
    required this.replid, 
    required this.nis, 
    required this.nisn, 
    required this.nik, 
    required this.nama, 
    required this.panggilan, 
    required this.idkelas, 
    required this.suku, 
    required this.agama, 
    required this.kondisi, 
    required this.kelamin, 
    required this.tmplahir, 
    required this.tgllahir, 
    required this.anakke, 
    required this.jsaudara, 
    required this.berat, 
    required this.tinggi, 
    required this.darah, 
    required this.alamatsiswa, 
    required this.telponsiswa, 
    required this.emailsiswa, 
    required this.asalsekolah, 
    required this.noijasah, 
    required this.tglijasah, 
    required this.namaayah, 
    required this.namaibu, 
    required this.statusayah, 
    required this.statusibu, 
    required this.tmplahirayah, 
    required this.tmplahiribu, 
    required this.tgllahirayah, 
    required this.tgllahiribu, 
    required this.pendidikanayah, 
    required this.pendidikanibu, 
    required this.pekerjaanayah, 
    required this.pekerjaanibu, 
    required this.wali, 
    required this.penghasilanayah, 
    required this.penghasilanibu, 
    required this.alamatortu, 
    required this.hportu, 
    required this.emailayah, 
    required this.alamatsurat, 
    required this.hobi, 
    // ignore: non_constant_identifier_names
    required this.api_token, 
    required this.pinsiswa, 
    required this.pinortu, 
    required this.pinortuibu, 
  });

  factory UserModel.fromJson(Map<String, dynamic> json){
    return UserModel(
      replid:  json['replid'], 
      nis:  json['nis'], 
      nisn:  json['nisn'], 
      nik:  json['nik'], 
      nama:  json['nama'], 
      panggilan:  json['panggilan'], 
      idkelas:  json['idkelas'], 
      suku:  json['suku'], 
      agama:  json['agama'], 
      kondisi:  json['kondisi'], 
      kelamin:  json['kelamin'], 
      tmplahir:  json['tmplahir'], 
      tgllahir:  json['tgllahir'], 
      anakke:  json['anakke'], 
      jsaudara:  json['jsaudara'], 
      berat:  json['berat'], 
      tinggi:  json['tinggi'], 
      darah:  json['darah'], 
      alamatsiswa:  json['alamatsiswa'], 
      telponsiswa:  json['telponsiswa'], 
      emailsiswa:  json['emailsiswa'], 
      asalsekolah:  json['asalsekolah'], 
      noijasah:  json['noijasah'], 
      tglijasah:  json['tglijasah'], 
      namaayah:  json['namaayah'], 
      namaibu:  json['namaibu'], 
      statusayah:  json['statusayah'], 
      statusibu:  json['statusibu'], 
      tmplahirayah:  json['tmplahirayah'], 
      tmplahiribu:  json['tmplahiribu'], 
      tgllahirayah:  json['tgllahirayah'], 
      tgllahiribu:  json['tgllahiribu'], 
      pendidikanayah:  json['pendidikanayah'], 
      pendidikanibu:  json['pendidikanibu'], 
      pekerjaanayah:  json['pekerjaanayah'], 
      pekerjaanibu:  json['pekerjaanibu'], 
      wali:  json['wali'], 
      penghasilanayah:  json['penghasilanayah'], 
      penghasilanibu:  json['penghasilanibu'], 
      alamatortu:  json['alamatortu'], 
      hportu:  json['hportu'], 
      emailayah:  json['emailayah'], 
      alamatsurat:  json['alamatsurat'], 
      hobi:  json['hobi'], 
      api_token:  json['api_token'], 
      pinsiswa:  json['pinsiswa'], 
      pinortu:  json['pinortu'], 
      pinortuibu:  json['pinortuibu']
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'replid': replid,
      'nis': nis,
      'nisn': nisn,
      'nik': nik,
      'nama': nama,
      'panggilan': panggilan,
      'idkelas': idkelas,
      'suku': suku,
      'agama': agama,
      'kondisi': kondisi,
      'kelamin': kelamin,
      'tmplahir': tmplahir,
      'tgllahir': tgllahir,
      'anakke': anakke,
      'jsaudara': jsaudara,
      'berat': berat,
      'tinggi': tinggi,
      'darah': darah,
      'alamatsiswa': alamatsiswa,
      'telponsiswa': telponsiswa,
      'emailsiswa': emailsiswa,
      'asalsekolah': asalsekolah,
      'noijasah': noijasah,
      'tglijasah': tglijasah,
      'namaayah': namaayah,
      'namaibu': namaibu,
      'statusayah': statusayah,
      'statusibu': statusibu,
      'tmplahirayah': tmplahirayah,
      'tmplahiribu': tmplahiribu,
      'tgllahirayah': tgllahirayah,
      'tgllahiribu': tgllahiribu,
      'pendidikanayah': pendidikanayah,
      'pendidikanibu': pendidikanibu,
      'pekerjaanayah': pekerjaanayah,
      'pekerjaanibu': pekerjaanibu,
      'wali': wali,
      'penghasilanayah': pendidikanayah,
      'penghasilanibu': penghasilanibu,
      'alamatortu': alamatortu,
      'hportu': hportu,
      'emailayah': emailayah,
      'alamatsurat': alamatsurat,
      'hobi': hobi,
      'api_token': api_token,
      'pinsiswa': pinsiswa,
      'pinortu': pinortu,
      'pinortuibu': pinortuibu
    };
  }
}