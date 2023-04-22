import 'package:fe_info_siswa/models/nilai/mapel_nilai_harian_model.dart';
import 'package:fe_info_siswa/provider/siswa_provider.dart';
import 'package:fe_info_siswa/share/theme.dart';
import 'package:fe_info_siswa/widgets/appBar_buttom.dart';
import 'package:fe_info_siswa/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AbsenPerPelajaranSiswaPage extends StatefulWidget {
  final MapelNilaiHarianModel mapelAbsen;
  final String tahun;
  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  AbsenPerPelajaranSiswaPage(this.mapelAbsen,{required this.tahun});

  @override
  State<AbsenPerPelajaranSiswaPage> createState() => _AbsenPerPelajaranSiswaPageState();
}

class _AbsenPerPelajaranSiswaPageState extends State<AbsenPerPelajaranSiswaPage> {

  List<String> month = [
    'Januari','Februari','Maret','April','Mei','Juni','Juli','Agustus','September','Oktober','November','Desember'
  ];
  String? _itemmonth='Januari';
  String? bulan;

  // ignore: unused_field
  bool _isRefreshing = false;

  Future<void> getInit() async{
    setState(() {
      _isRefreshing = true;
    });
    // dataAbsenDetail(bulan);
    setState(() {
      _isRefreshing = false;
    });
  }

  dataAbsenDetail(String bulan) async{
    await Provider.of<SiswaProvider>(context, listen: false).getDetailAbsenPerMapel(widget.tahun, bulan, widget.mapelAbsen.idpelajaran!);
  }

  @override
  Widget build(BuildContext context) {

    switch (_itemmonth) {
      case 'Januari':
        bulan = '1';
        break;
      case 'Februari':
        bulan = '2';
        break;
      case 'Maret':
        bulan = '3';
        break;
      case 'April':
        bulan = '4';
        break;
      case 'Mei':
        bulan = '5';
        break;
      case 'Juni':
        bulan = '6';
        break;
      case 'Juli':
        bulan = '7';
        break;
      case 'Agustus':
        bulan = '8';
        break;
      case 'September':
        bulan = '9';
        break;
      case 'Oktober':
        bulan = '10';
        break;
      case 'November':
        bulan = '11';
        break;
      case 'Desember':
        bulan = '12';
        break;
      default:
      bulan = 'Pilih';
    }

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
          textAlign: TextAlign.justify,
        )
      );
    }

    Widget dataAbsen(
      String materi,
      String tanggal, 
      String status, 
      String ket, 
    ){
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          cell(110, materi),
          const SizedBox(width: 10,),
          cell(40, status),
          const SizedBox(width: 5,),
          cell(95, tanggal),
          cell(60, ket),

        ],
      );
    }

    Widget content(){
      return Container(
        margin: const EdgeInsets.only(top: 15,left: 5, right: 5),
        padding: const EdgeInsetsDirectional.all(15),
        width: double.infinity,
        decoration: BoxDecoration(
          color: background4Color,
          borderRadius: BorderRadius.circular(15)
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                  Container(width: 100, child: Text("Materi",style: blackTextStyle.copyWith(fontSize: 12, fontWeight: bold),)),
                  const SizedBox(width: 10,),
                  // ignore: sized_box_for_whitespace
                  Container(width: 40, child: Text("Status",style: blackTextStyle.copyWith(fontSize: 12, fontWeight: bold),textAlign: TextAlign.center,)),
                  const SizedBox(width: 5,),
                  // ignore: sized_box_for_whitespace
                  Container(width: 95, child: Text("Tanggal",style: blackTextStyle.copyWith(fontSize: 12, fontWeight: bold),)),
                  // ignore: sized_box_for_whitespace
                  Container(width: 60, child: Text("Ket",style: blackTextStyle.copyWith(fontSize: 12, fontWeight: bold),textAlign: TextAlign.center,)),

                ],
              ),
              
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                width: double.infinity,
                height: 1,
                color: blackColor,
              ),

              FutureBuilder(
                future: dataAbsenDetail(bulan!),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // ignore: prefer_const_constructors
                    return Loading();
                  } else {
                    return Column(
                      children: siswaProvider.absenPerMapel.map((mapel) => 
                        dataAbsen(
                          mapel.materi.toString(), 
                          mapel.tanggal.toString(), 
                          mapel.statusHadir.toString(), 
                          mapel.keterangan.toString()
                        )
                      ).toList(),
                    );
                  }
                }
              )
            ]
        )
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
          child: Column(
            children: [
              AppBarButtom(nama: widget.mapelAbsen.nama.toString()),
              comboBox(),
              Expanded(
                child: ListView(
                  children: [
                    content(),
                    const SizedBox(height: 30,),
                  ],
                )
              )
            ],
          ),
        )
    );
  }
}