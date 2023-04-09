import 'package:fe_info_siswa/provider/siswa_provider.dart';
import 'package:fe_info_siswa/share/theme.dart';
import 'package:fe_info_siswa/widgets/appBar_buttom.dart';
import 'package:fe_info_siswa/widgets/loading.dart';
import 'package:fe_info_siswa/widgets/no_result_info_gif.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sp_util/sp_util.dart';

class AbsenHarianSiswaPage extends StatefulWidget {
  const AbsenHarianSiswaPage({super.key});

  @override
  State<AbsenHarianSiswaPage> createState() => _AbsenHarianSiswaPageState();
}

class _AbsenHarianSiswaPageState extends State<AbsenHarianSiswaPage> {

  List<String> month = ['1','2','3','4','5','6','7','8','9','10','11','12'];
  String? _itemmonth='1';
  String? _tahun;
  String? _tahun2 = 'Pilih';
  String? kepala;
  String? token = SpUtil.getString('token');

  // ignore: unused_field
  bool _isRefreshing = false;

  Future<void> getInit() async{
    setState(() {
      _isRefreshing = true;
    });
    data();
    setState(() {
      _isRefreshing = false;
    });
  }

  data() async{
    await Provider.of<SiswaProvider>(context, listen: false).getDataTahun();
    // ignore: use_build_context_synchronously
    await Provider.of<SiswaProvider>(context, listen: false).getpresenSiswa(token!, _tahun2!, _itemmonth!);
  }

  @override
  Widget build(BuildContext context) {

    switch (_itemmonth) {
      case '1':
        kepala='Absen Januari';
        break;
      case '2':
        kepala='Absen Februari';
        break;
      case '3':
        kepala='Absen Maret';
        break;
      case '4':
        kepala='Absen April';
        break;
      case '5':
        kepala='Absen Mei';
        break;
      case '6':
        kepala='Absen Juni';
        break;
      case '7':
        kepala='Absen Juli';
        break;
      case '8':
        kepala='Absen Agustus';
        break;
      case '9':
        kepala='Absen September';
        break;
      case '10':
        kepala='Absen Oktober';
        break;
      case '11':
        kepala='Absen November';
        break;
      case '12':
        kepala='Absen Desember';
        break;
      default:
      kepala='Pilih Tahun dan Bulan terlebih dahulu';
    }

    
    SiswaProvider siswaProvider = Provider.of<SiswaProvider>(context);

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
            // combobox untuk tahun
            Text(
              "Pilih Tahun",
              style: blackTextStyle,
            ),
            ButtonTheme(
                alignedDropdown: true,
                child: FutureBuilder(
                  future: data(),
                  builder: (context, snapshot) {
                    return DropdownButton(
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

            // combobox untuk bulan
            Text(
              "Pilih Bulan",
              style: blackTextStyle,
            ),
            ButtonTheme(
              alignedDropdown: true,
              child: DropdownButton(
                style: TextStyle(color: blackColor),
                borderRadius: BorderRadius.circular(15),
                focusColor: blackColor,
                underline: Container(
                  height: 2,
                  color: backgroundColor6,
                ),
                value: _itemmonth,
                onChanged: (newValue) {
                    setState(() {
                      _itemmonth = newValue;
                    });
                  },
                items: month.map((location) {
                    return DropdownMenuItem(
                      // ignore: unnecessary_new, sort_child_properties_last
                      child: new Text(location,),
                      value: location,
                    );
                  }).toList()
              )
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

    Widget icon(double lebar){
      return Container(
        padding: const EdgeInsets.only(top: 15),
        height: 1, 
        child: const Icon(
          Icons.search
        ),
      );
    }

    Widget dataAbsen(String tanggal,String hadir, String izin, String sakit, String alpa, String ket){
      return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        
        cell(100, tanggal),
        const SizedBox(width: 10,),
        cell(40, hadir),
        cell(40, izin),
        cell(40, sakit),
        cell(40, alpa),
        // icon(40,),

      ],
    );
    }

    Widget contentDetail(){
      return Container(
        margin: const EdgeInsets.only(top: 20,left: 10, right: 10),
        padding: const EdgeInsetsDirectional.all(15),
        width: double.infinity,
        decoration: BoxDecoration(
          color: background4Color,
          borderRadius: BorderRadius.circular(15)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(kepala!,style: blackTextStyle.copyWith(fontSize: 13,fontWeight: bold),),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              width: double.infinity,
              height: 1,
              color: blackColor,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                // ignore: sized_box_for_whitespace
                Container(width: 100, child: Text("Tanggal",style: blackTextStyle.copyWith(fontSize: 12, fontWeight: bold),)),
                const SizedBox(width: 5,),
                // ignore: sized_box_for_whitespace
                Container(width: 40, child: Text("Hadir",style: blackTextStyle.copyWith(fontSize: 12, fontWeight: bold),textAlign: TextAlign.center,)),
                const SizedBox(width: 5,),
                // ignore: sized_box_for_whitespace
                Container(width: 40, child: Text("Izin",style: blackTextStyle.copyWith(fontSize: 12, fontWeight: bold),)),
                // ignore: sized_box_for_whitespace
                Container(width: 40, child: Text("Sakit",style: blackTextStyle.copyWith(fontSize: 12, fontWeight: bold),)),
                // ignore: sized_box_for_whitespace
                Container(width: 40, child: Text("Alpa",style: blackTextStyle.copyWith(fontSize: 12, fontWeight: bold),)),
                // ignore: sized_box_for_whitespace
                // Container(width: 40, child: Text("Detail",style: blackTextStyle.copyWith(fontSize: 12, fontWeight: bold),textAlign: TextAlign.center,)),

              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              width: double.infinity,
              height: 1,
              color: blackColor,
            ),

            FutureBuilder(
              future: data(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Loading();
                } else if(siswaProvider.presen.isEmpty){
                  return NoResultInfoGif(lebar: double.infinity);
                } else {
                  return Column(
                    children: siswaProvider.presen.map((absen) => dataAbsen(
                      absen.ts.toString(), 
                      absen.hadir.toString(), 
                      absen.ijin.toString(), 
                      absen.sakit.toString(), 
                      absen.alpa.toString(), 
                      absen.keterangan.toString()
                    )).toList(),
                  );
                }
              }
            ),

          ],
        ),
      );
    }

    Widget hitung(){
      return Container(
        margin: const EdgeInsets.only(top: 20,left: 10, right: 10),
        padding: const EdgeInsetsDirectional.all(15),
        width: double.infinity,
        decoration: BoxDecoration(
          color: background4Color,
          borderRadius: BorderRadius.circular(15)
        ),
        child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5
        ),
        shrinkWrap: true,
          children: [
            Container(
              height: 50,
              width: 50,
              child: Text("data")
            ),
            Container(
              height: 50,
              width: 50,
              child: Text("data")
            ),
            Container(
              height: 50,
              width: 50,
              child: Text("data")
            ),
            Container(
              height: 50,
              width: 50,
              child: Text("data")
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
              AppBarButtom(nama: 'Absen Harian'),
              comboBox(),
              contentDetail(),
              // hitung(), // untuk hitung jumlah absensi
            ],
          ),
        )
      ),
    );
  }
}