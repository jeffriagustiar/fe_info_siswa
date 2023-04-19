import 'package:fe_info_siswa/provider/siswa_provider.dart';
import 'package:fe_info_siswa/share/theme.dart';
import 'package:fe_info_siswa/widgets/appBar_buttom.dart';
import 'package:fe_info_siswa/widgets/info_pilih.dart';
import 'package:fe_info_siswa/widgets/loading.dart';
import 'package:fe_info_siswa/widgets/no_result_info_gif.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AbsenPelajaranSiswaPage extends StatefulWidget {
  const AbsenPelajaranSiswaPage({super.key});

  @override
  State<AbsenPelajaranSiswaPage> createState() => _AbsenPelajaranSiswaPageState();
}

class _AbsenPelajaranSiswaPageState extends State<AbsenPelajaranSiswaPage> {

  String? _tahun;
  String? _tahun2 = '';

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

  data() async{
    await Provider.of<SiswaProvider>(context, listen: false).getDataTahun();
  }

  dataAbsen() async{
    await Provider.of<SiswaProvider>(context, listen: false).getAbsenPelajaranSiswa(_tahun2!);
  }

  dataAbsenDetail(String bulan, String status) async{
    await Provider.of<SiswaProvider>(context, listen: false).getAbsenPelajaranSiswaDetail(_tahun2!, bulan, status);
  }

  @override
  Widget build(BuildContext context) {

    SiswaProvider siswaProvider = Provider.of<SiswaProvider>(context);

    Widget garis(){
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        width: double.infinity,
        height: 1,
        color: blackColor,
      );
    }

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
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Pilih Tahun : ",
              style: blackTextStyle,
            ),
            ButtonTheme(
                alignedDropdown: true,
                child: FutureBuilder(
                  future: data(),
                  builder: (context, snapshot) {
                    return DropdownButton(
                      // icon: const Icon(Icons.date_range_rounded, color: Colors.black,),
                      style: TextStyle(
                        color: blackColor
                      ),
                      borderRadius: BorderRadius.circular(15),
                      focusColor: blackColor,
                      underline: Container(
                        height: 2,
                        color: backgroundColor6,
                      ),
                      value: _tahun,
                      onChanged: (newValue) {
                          setState(() {
                            _tahun = newValue;
                            _tahun2 = newValue;
                          });
                        },
                      items: siswaProvider.tahun.map((location) {
                          return DropdownMenuItem(
                            // ignore: unnecessary_new, sort_child_properties_last
                            child: new Text(location.tahun.toString(),),
                            value: location.tahun.toString(),
                          );
                        }).toList()
                    );
                  }
                )
              ),
          ],
        ),
      );
    }

    Widget judul(){
      return Container(
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 5),
        width: double.infinity,
        // height: 100,
        decoration: BoxDecoration(
          color: background4Color,
          borderRadius: BorderRadius.circular(15)
        ),
        child: Column(
          children: [
            Text(
              "Absensi Pelajaran Tahun $_tahun2",
              style: blackTextStyle.copyWith(
                fontWeight: semibold,
                fontSize: 14
              ),
            ),
            garis()
          ],
        ),
      );
    }

    Widget textContentH(String text, String isi){
      return Text(
        "$text : $isi",
        style: blackTextStyle.copyWith(
          fontWeight: semibold,
          fontSize: 14
        ),
      );
    }

    Widget textDetail(String tanggal, String mapel){
      return Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            // ignore: sized_box_for_whitespace
            Container(width: 110, child: Text(tanggal,style: blackTextStyle.copyWith(fontSize: 12, fontWeight: bold),)),
            // ignore: sized_box_for_whitespace
            Container(width: 110, child: Text(mapel,style: blackTextStyle.copyWith(fontSize: 12, fontWeight: bold))),
      
          ],
        ),
      );
    }

    Widget textContent(String text, String isi, String status, String bulan2, String bulan){
      return TextButton(
        onPressed: (){
          showDialog(
            context: context, 
            builder: (BuildContext context){
              return AlertDialog(
                title: Text('Rekap Data $text Siswa, Bulan $bulan',style: blackTextStyle.copyWith(fontWeight: bold, fontSize: 16),),
                content: Container(
                  width: double.infinity,
                  height: 350,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          
                          // ignore: sized_box_for_whitespace
                          Container(width: 110, child: Text("Tanggal",style: blackTextStyle.copyWith(fontSize: 12, fontWeight: bold),)),
                          // ignore: sized_box_for_whitespace
                          Container(width: 110, child: Text("Mata Pelajaran",style: blackTextStyle.copyWith(fontSize: 12, fontWeight: bold))),
                          
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        width: double.infinity,
                        height: 1,
                        color: blackColor,
                      ),
                      Expanded(
                        child: ListView(
                          children: [
                            
                            FutureBuilder(
                              future: dataAbsenDetail(bulan2, status),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState == ConnectionState.waiting) {
                                  return const Loading();
                                } else if(siswaProvider.absenPelajaranDetail.isEmpty){
                                  return NoResultInfoGif(lebar: double.infinity);
                                } else {
                                  return Column(
                                    children: siswaProvider.absenPelajaranDetail.map((absenDetail) => textDetail(
                                      absenDetail.tanggal.toString(), 
                                      absenDetail.nama.toString()
                                    )).toList(),
                                  );
                                }
                              }
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                backgroundColor: background4Color,
                actions: [
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
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
          )
        ),
        child: Text(
          "$text : $isi",
          style: blackTextStyle.copyWith(
            fontWeight: semibold,
            fontSize: 14
          ),
        ),
      );
    }

    Widget content(
      String bulan,
      String hadir,
      String ijin,
      String sakit,
      String alpa,
      String bulan2
    ){
      return Container(
        margin: const EdgeInsets.only(top: 15,left: 10, right: 10),
        padding: const EdgeInsetsDirectional.all(15),
        width: double.infinity,
        decoration: BoxDecoration(
          color: background4Color,
          borderRadius: BorderRadius.circular(15)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textContentH("Bulan", bulan),
            // const SizedBox(height: 10,),
            garis(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                textContent("Hadir", hadir,'0',bulan2, bulan),
                textContent("Ijin", ijin,'2',bulan2, bulan),
                textContent("Sakit", sakit,'1',bulan2, bulan),
                textContent("Alpa", alpa,'3',bulan2, bulan),
              ],
            ),
                  ],
                ),
              );
    }

    Widget dataContent(){
      return Column(
        children: [
          judul(),
          FutureBuilder(
            future: dataAbsen(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Loading();
              } else if(siswaProvider.absenPelajaran.isEmpty){
                return NoResultInfoGif(lebar: double.infinity);
              }else {
                return Column(
                  children: siswaProvider.absenPelajaran.map((absen) => content(
                    absen.namaBulan.toString(), 
                    absen.hadir.toString(), 
                    absen.ijin.toString(), 
                    absen.sakit.toString(), 
                    absen.alpa.toString(),
                    absen.bulan.toString()
                  )).toList()
                );
              }
            }
          )
        ],
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: getInit,
          child: Column(
            children: [
              AppBarButtom(nama: "Absen Pelajaran"),
              comboBox(),
              Expanded(
                child: ListView(
                  children: [
                    _tahun2=='' ? 
                    InfoPilih(textInfo: 'Silahkan pilih tahun terlebih dahulu untuk melanjutkan')
                      :
                    dataContent(),
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