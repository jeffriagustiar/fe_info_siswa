import 'package:fe_info_siswa/models/semester_model.dart';
import 'package:fe_info_siswa/models/tahun_model.dart';
import 'package:fe_info_siswa/provider/siswa_provider.dart';
import 'package:fe_info_siswa/share/theme.dart';
import 'package:fe_info_siswa/widgets/appBar_buttom.dart';
import 'package:fe_info_siswa/widgets/info_pilih.dart';
import 'package:fe_info_siswa/widgets/loading.dart';
import 'package:fe_info_siswa/widgets/no_result_info_gif.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NilaiPancasilaRaporPage extends StatefulWidget {
  const NilaiPancasilaRaporPage({super.key});

  @override
  State<NilaiPancasilaRaporPage> createState() => _NilaiPancasilaRaporPageState();
}

class _NilaiPancasilaRaporPageState extends State<NilaiPancasilaRaporPage> {

  String? _tahunAjaran;
  String? _tahunAjaran2 = '';
  String? _semester;
  String? _semester2= '';

  // ignore: unused_field
  bool _isRefreshing = false;

  Future<void> getInit() async{
    setState(() {
      _isRefreshing = true;
    });
    // data();
    setState(() {
      _isRefreshing = false;
    });
  }

  dataMapel(jenis) async{
    await Provider.of<SiswaProvider>(context, listen: false).getMapel(jenis);
  }

  // data() async{
  //   await Provider.of<SiswaProvider>(context, listen: false).gettahun();
  //   // ignore: use_build_context_synchronously
  //   await Provider.of<SiswaProvider>(context, listen: false).getsemester();
  // }
  
  data2(String mapel) async{
    await Provider.of<SiswaProvider>(context, listen: false).getRaporSiswaP(_semester2!, _tahunAjaran2!, mapel);
  }

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as Map;
    String nama = arg['nama'];
    String jenis = arg['jenis'];
    String tipe = arg['tipe'];

    SiswaProvider siswaProvider = Provider.of<SiswaProvider>(context);
    List<SemesterModel> semester = siswaProvider.semester;
    List<TahunModel> tahun = siswaProvider.tahun;

    Widget comboBox(){
      return Container(
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
        width: double.infinity,
        // height: 100,
        decoration: BoxDecoration(
          color: background4Color,
          borderRadius: BorderRadius.circular(15)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Tahun Ajaran",
              style: blackTextStyle,
            ),
            ButtonTheme(
                alignedDropdown: true,
                child: 
                
                // FutureBuilder(
                //   future: data(),
                //   builder: (context, snapshot) {
                //     return 
                    
                    DropdownButton(
                      style: TextStyle(
                        color: blackColor
                      ),
                      borderRadius: BorderRadius.circular(15),
                      focusColor: blackColor,
                      underline: Container(
                        height: 2,
                        color: backgroundColor6,
                      ),
                      value: _tahunAjaran,
                      onChanged: (newValue) {
                          setState(() {
                            _tahunAjaran = newValue;
                            _tahunAjaran2 = newValue;
                          });
                        },
                      items: tahun.map((location) {
                          return DropdownMenuItem(
                            // ignore: unnecessary_new, sort_child_properties_last
                            child: new Text(location.tahun.toString(),),
                            value: location.tahun.toString(),
                          );
                        }).toList()
                    )
                    
                //     ;
                //   }
                // )

              ),
            Text(
              "Semester",
              style: blackTextStyle,
            ),
            
            ButtonTheme(
                alignedDropdown: true,
                child: 
                
                // FutureBuilder(
                //   future: data(),
                //   builder: (context, snapshot) {
                //     return 
                    
                    DropdownButton(
                      style: TextStyle(
                        color: blackColor
                      ),
                      borderRadius: BorderRadius.circular(15),
                      focusColor: blackColor,
                      underline: Container(
                        height: 2,
                        color: backgroundColor6,
                      ),
                      value: _semester,
                      onChanged: (newValue) {
                          setState(() {
                            _semester = newValue;
                            _semester2 = newValue;
                          });
                        },
                      items: semester.map((location) {
                          return DropdownMenuItem(
                            // ignore: sort_child_properties_last, unnecessary_new
                            child: new Text(location.semester.toString(),),
                            value: location.replid.toString(),
                          );
                        }).toList()
                    )
                    
                //     ;
                //   }
                // )

              ),
          ],
        ),
      );
  }

  Widget cell(double lebar, String nama){
    return Container(
      padding: const EdgeInsets.only(top: 15),
      width: lebar, 
      child: Text(
        nama,
        style: blackTextStyle.copyWith(
          fontSize: 12
        ),
      )
    );
  }

  Widget cell2(String nama, String info){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        cell(115, nama),
        cell(115, info),
      ],
    );
  }

  Widget icon(double lebar,String mapel, String idmapel){
    return Container(
      padding: const EdgeInsets.only(top: 15),
      width: lebar, 
      child: GestureDetector(
        onTap: (){
          showDialog(
            context: context, 
            builder: (BuildContext context){
              return AlertDialog(
                title: Text('Detail Penilaian Pancasila',style: blackTextStyle.copyWith(fontSize: 18,fontWeight: bold),),
                // ignore: sized_box_for_whitespace
                content: Container(
                height: 300,
                child: FutureBuilder(
                  future: data2(idmapel),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Loading();
                    } else if(siswaProvider.raporP.isEmpty){
                      return NoResultInfoGif(lebar: double.infinity);
                    }  else {
                      return ListView(
                        children:[
                          Text(mapel,style: blackTextStyle.copyWith(fontWeight: semibold),),
                          Column(
                            children: siswaProvider.raporP.map((rapor) => cell2(
                                rapor.dasarpenilaian.toString(), 
                                // ignore: prefer_interpolation_to_compose_strings
                                rapor.nilaihuruf.toString()+' '+rapor.nilaiangka.toString(), 
                              )).toList(),
                          )
                        ]
                      );
                    }
                  }
              ),
            ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Tutup'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
            }
          );
        },
        child: const Icon(
          Icons.search
        ),
      )
    );
  }

  Widget dataNilai(String mapel,String idmapel){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        
        cell(180, mapel),
        icon(20, mapel,idmapel),

      ],
    );
  }

  Widget content2(String tipe, String jenis){
    return Container(
      margin: const EdgeInsets.only(top: 20,left: 10, right: 10),
      padding: const EdgeInsetsDirectional.all(15),
      width: double.infinity,
      decoration: BoxDecoration(
        color: background4Color,
        borderRadius: BorderRadius.circular(15)
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              // ignore: sized_box_for_whitespace
              Container(width: 180, child: Text("Mata Pelajaran",style: blackTextStyle.copyWith(fontSize: 12, fontWeight: bold),)),
              // ignore: sized_box_for_whitespace
              Container(width: 40, child: Text("Detail",style: blackTextStyle.copyWith(fontSize: 12, fontWeight: bold),)),

            ],
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 5),
            width: double.infinity,
            height: 1,
            color: blackColor,
          ),
          FutureBuilder(
            future: dataMapel(jenis),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Loading();
              } else if(siswaProvider.mapel.isEmpty){
                return NoResultInfoGif(lebar: double.infinity);
              }  else {
                  return Column(
                    children: siswaProvider.mapel.map((rapor) => dataNilai(
                      rapor.nama.toString(), 
                      rapor.replid.toString(),
                    )).toList(),
                  );
                
              }
            }
          ),
        ],
      ),
    );
  }

  // Widget keterangan(){
  //   return Container(
  //     margin: const EdgeInsets.only(top: 20,left: 10, right: 10),
  //     padding: const EdgeInsetsDirectional.all(15),
  //     width: double.infinity,
  //     decoration: BoxDecoration(
  //       color: background4Color,
  //       borderRadius: BorderRadius.circular(15)
  //     ),
  //     child: Column(
  //       children: [
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [

  //             // ignore: sized_box_for_whitespace
  //             Container(width: 200, child: Text("Keterangan Pelajaran Pancasila",style: blackTextStyle.copyWith(fontSize: 12, fontWeight: bold),)),

  //           ],
  //         ),
  //         Container(
  //           margin: const EdgeInsets.only(bottom: 5),
  //           width: double.infinity,
  //           height: 1,
  //           color: blackColor,
  //         ),
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             cell(150, "D1 : Beriaman, bertaqwa kepada Tuhan YME dan berakhlak mulia"),
  //             cell(150, "SB : Sangat Berkembang"),
  //           ],
  //         ),
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             cell(150, "D2 : Bernalar kritis"),
  //             cell(150, "BSH : Berkembang Sesuai Harapan"),
  //           ],
  //         ),
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             cell(150, "D3 : Mandiri"),
  //             cell(150, "MB : Mulai Berkembang"),
  //           ],
  //         ),
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             cell(150, "D4 : Kebhinekaan Global"),
  //             cell(150, "BB : Belum Berkembang"),
  //           ],
  //         ),
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             cell(150, "D5 : Kreatif"),
  //             cell(150, ""),
  //           ],
  //         ),
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             cell(150, "D6 : Bergotongroyong"),
  //             cell(150, ""),
  //           ],
  //         ),
  //       ],
  //     ),
  //   );
  // }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: getInit,
          child: Column(
            children: [
              AppBarButtom(nama: nama),
              comboBox(),
              Expanded(
                child: ListView(
                  children: [
                    _tahunAjaran2=='' || _semester2=='' ? 
                    InfoPilih(textInfo: 'Silahkan pilih terlebih dahulu tahuan ajaran dan semester untuk melanjutkan')
                      : 
                    content2(tipe, jenis),
                    // pancasila == 1 ? keterangan() : const SizedBox(height: 20,),
                    const SizedBox(height: 20,),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}