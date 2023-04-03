import 'package:fe_info_siswa/provider/siswa_provider.dart';
import 'package:fe_info_siswa/share/theme.dart';
import 'package:fe_info_siswa/widgets/appBar_buttom.dart';
import 'package:fe_info_siswa/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sp_util/sp_util.dart';

class AbsenPelajaranSiswaPage extends StatefulWidget {
  const AbsenPelajaranSiswaPage({super.key});

  @override
  State<AbsenPelajaranSiswaPage> createState() => _AbsenPelajaranSiswaPageState();
}

class _AbsenPelajaranSiswaPageState extends State<AbsenPelajaranSiswaPage> {

  String? _tahun;
  String? _tahun2 = '';
  String? token = SpUtil.getString('token');

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
    await Provider.of<SiswaProvider>(context, listen: false).getAbsenPelajaranSiswa(token!, _tahun2!);
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

    Widget textContent(String text, String isi){
      return TextButton(
        onPressed: (){},
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
                textContent("Hadir", hadir),
                textContent("Ijin", ijin),
                textContent("Sakit", sakit),
                textContent("Alpa", alpa),
              ],
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
          child: ListView(
            children: [
              AppBarButtom(nama: "Absen Pelajaran"),
              comboBox(),
              judul(),
              FutureBuilder(
                future: dataAbsen(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Loading();
                  } else {
                    return Column(
                      children: siswaProvider.absenPelajaran.map((absen) => content(
                        absen.namaBulan.toString(), 
                        absen.hadir.toString(), 
                        absen.ijin.toString(), 
                        absen.sakit.toString(), 
                        absen.alpa.toString()
                      )).toList()
                    );
                  }
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}