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

class NilaiUmumPage extends StatefulWidget {
  const NilaiUmumPage({super.key});

  @override
  State<NilaiUmumPage> createState() => _NilaiUmumPageState();
}

class _NilaiUmumPageState extends State<NilaiUmumPage> {

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

  // data() async{
  //   await Provider.of<SiswaProvider>(context, listen: false).gettahun();
  //   // ignore: use_build_context_synchronously
  //   await Provider.of<SiswaProvider>(context, listen: false).getsemester();
  // }
  
  data2(String jenis, String tipe) async{
    await Provider.of<SiswaProvider>(context, listen: false).getRaporSiswaD(_semester2!, jenis, tipe, _tahunAjaran2!);
  }

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as Map;
    String nama = arg['nama'];
    String jenis = arg['jenis'];
    String tipe = arg['tipe'];
    int pancasila = arg['pancasila'];

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
        cell(105, nama),
        cell(120, info),
      ],
    );
  }

  Widget icon(double lebar, String komen, String komen2){
    return Container(
      // padding: const EdgeInsets.only(top: 15),
      width: 40, 
      height: 30,
      child: TextButton(
        onPressed: (){
          showDialog(
            context: context, 
            builder: (BuildContext context){
              return AlertDialog(
                title: Text('Komentar terkait pencapaian',style: blackTextStyle.copyWith(fontWeight: bold),),
          content: Container(
            height: 300,
            child: Column(
              children: [
                cell2("Komentar Guru :", komen),
                cell2("Komentar Rapor :", komen2),
              ],
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

  Widget dataNilai(String mapel, String nilai, String angka, String komen, String komen2){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        
        cell(180, mapel),
        cell(40, nilai),
        cell(40, angka),
        icon(20, komen, komen2),

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
              Container(width: 40, child: Text("Angka",style: blackTextStyle.copyWith(fontSize: 12, fontWeight: bold),)),
              // ignore: sized_box_for_whitespace
              Container(width: 40, child: Text("Huruf",style: blackTextStyle.copyWith(fontSize: 12, fontWeight: bold),)),
              // ignore: sized_box_for_whitespace
              Container(width: 40, child: Text("Action",style: blackTextStyle.copyWith(fontSize: 12, fontWeight: bold),)),

            ],
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 5),
            width: double.infinity,
            height: 1,
            color: blackColor,
          ),
          FutureBuilder(
            future: data2(jenis,tipe),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Loading();
              } else if(siswaProvider.rapor.isEmpty){
                return NoResultInfoGif(lebar: double.infinity);
              } else {
                  return Column(
                    children: siswaProvider.rapor.map((rapor) => dataNilai(
                      rapor.nama.toString(), 
                      rapor.nilaiangka.toString(), 
                      rapor.nilaihuruf.toString(), 
                      rapor.komentar2.toString(),
                      rapor.komentar.toString(),
                    )).toList(),
                  );
                
              }
            }
          ),
        ],
      ),
    );
  }


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