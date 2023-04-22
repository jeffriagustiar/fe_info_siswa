import 'package:fe_info_siswa/models/kelas_model.dart';

class SiswaModel{
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
  late String? hpsiswa;
  late KelasModel? kelas;

  SiswaModel({
    this.replid, 
    this.nis, 
    this.nisn, 
    this.nik, 
    this.nama, 
    this.panggilan, 
    this.idkelas, 
    this.suku, 
    this.agama, 
    this.kondisi, 
    this.kelamin, 
    this.tmplahir, 
    this.tgllahir, 
    this.anakke, 
    this.jsaudara, 
    this.berat, 
    this.tinggi, 
    this.darah, 
    this.alamatsiswa, 
    this.telponsiswa, 
    this.emailsiswa, 
    this.asalsekolah, 
    this.noijasah, 
    this.tglijasah, 
    this.namaayah, 
    this.namaibu, 
    this.statusayah, 
    this.statusibu, 
    this.tmplahirayah, 
    this.tmplahiribu, 
    this.tgllahirayah, 
    this.tgllahiribu, 
    this.pendidikanayah, 
    this.pendidikanibu, 
    this.pekerjaanayah, 
    this.pekerjaanibu, 
    this.wali, 
    this.penghasilanayah, 
    this.penghasilanibu, 
    this.alamatortu, 
    this.hportu, 
    this.emailayah, 
    this.alamatsurat, 
    this.hobi, 
    // ignore: non_constant_identifier_names
    this.api_token, 
    this.pinsiswa, 
    this.pinortu, 
    this.pinortuibu,  
    this.hpsiswa,  
    this.kelas
  });

  factory SiswaModel.fromJson(Map<String, dynamic> json){
    return SiswaModel(
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
      pinortuibu:  json['pinortuibu'],
      hpsiswa:  json['hpsiswa'],
      kelas: KelasModel.fromJson(json['kelas']),
    );
  }

  Map<String, dynamic> toJson(){
    return{
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
      'pinortuibu': pinortuibu,
      'hpsiswa': hpsiswa,
      'kelas' : kelas?.toJson(),
    };
  }
}