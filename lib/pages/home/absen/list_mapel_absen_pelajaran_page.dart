import 'package:fe_info_siswa/models/nilai/mapel_nilai_harian_model.dart';
import 'package:fe_info_siswa/pages/home/absen/absen_per_pelajaran_siswa_page.dart';
import 'package:fe_info_siswa/provider/siswa_provider.dart';
import 'package:fe_info_siswa/share/theme.dart';
import 'package:fe_info_siswa/widgets/appBar_buttom.dart';
import 'package:fe_info_siswa/widgets/info_pilih.dart';
import 'package:fe_info_siswa/widgets/loading.dart';
import 'package:fe_info_siswa/widgets/no_result_info_gif.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListMapelAbsenPelajaranPage extends StatefulWidget {
  const ListMapelAbsenPelajaranPage({super.key});

  @override
  State<ListMapelAbsenPelajaranPage> createState() => _ListMapelAbsenPelajaranPageState();
}

class _ListMapelAbsenPelajaranPageState extends State<ListMapelAbsenPelajaranPage> {

  String? _tahun;
  String? _tahun2 = '';

  // ignore: unused_field
  bool _isRefreshing = false;

  Future<void> getInit() async{
    setState(() {
      _isRefreshing = true;
    });
    // data2(jenis);
    setState(() {
      _isRefreshing = false;
    });
  }

  dataTahun() async{
    await Provider.of<SiswaProvider>(context, listen: false).getDataTahun();
  }

  dataMapel()async{
    await Provider.of<SiswaProvider>(context, listen: false).getMapelAbsen(_tahun2!);
  }

  @override
  Widget build(BuildContext context) {

    SiswaProvider siswaProvider = Provider.of<SiswaProvider>(context);

    Widget comboBox(){
      return Container(
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.only(left: 40, right: 40, top: 15, bottom: 15),
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
                  future: dataTahun(),
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

          ],
        ),
      );
    }

    Widget content(MapelNilaiHarianModel mapelAbsen){
    return Container(
      margin: const EdgeInsets.only(top: 5),
      padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      width: double.infinity,
      decoration: BoxDecoration(
        color: background4Color,
        borderRadius: BorderRadius.circular(15)
      ),
      child: TextButton(
        onPressed: () {
          Navigator.push(
          context, 
          MaterialPageRoute(
            builder: (context) => AbsenPerPelajaranSiswaPage(mapelAbsen, tahun: _tahun2!),
            
          )
        );
        },
        style: ButtonStyle(
          overlayColor: MaterialStateColor.resolveWith((states) => Colors.blue.shade200),
        ),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('assets/ic_cari.gif', width: 60,),
            const SizedBox(width: 15,),
            Expanded(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(mapelAbsen.nama.toString(),style: blackTextStyle.copyWith(fontWeight: bold, fontSize: 15), overflow: TextOverflow.ellipsis, softWrap: true,maxLines: 3,),
                  // ignore: prefer_interpolation_to_compose_strings
                  Text("Kode : "+mapelAbsen.kode.toString(),style: blackTextStyle,),
                ],
              ),
            ),
            const SizedBox(width: 5,),
            const Icon(Icons.chevron_right, size: 60,)
          ],
        ),
      ),
    );
  }

  Widget panggilContent(){
    return FutureBuilder(
      future: dataMapel(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Loading();
        } else if(siswaProvider.mapelNilaiHarian.isEmpty){
          return NoResultInfoGif(lebar: double.infinity);
        }else {
          return Column(
            children: siswaProvider.mapelNilaiHarian.map((mapel) => content(
              mapel
            )).toList()
          );
        }
      }
    );
  }


    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: getInit,
          child: Column(
            children: [
              AppBarButtom(nama: 'Absen Per Pelajaran'),
              comboBox(),
              Expanded(
                child: ListView(
                  children: [
                    _tahun2=='' ? 
                    InfoPilih(textInfo: 'Silahkan pilih tahun terlebih dahulu untuk melanjutkan') 
                      :
                    panggilContent(),
                    SizedBox(height: 20,)
                  ],
                )
              )
            ],
          ),
        )
      ),
    );
  }
}