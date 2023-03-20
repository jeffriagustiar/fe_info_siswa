import 'package:fe_info_siswa/provider/siswa_provider.dart';
import 'package:fe_info_siswa/share/theme.dart';
import 'package:fe_info_siswa/widgets/appBar_buttom.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sp_util/sp_util.dart';

class NilaiUmumPage extends StatefulWidget {
  const NilaiUmumPage({super.key});

  @override
  State<NilaiUmumPage> createState() => _NilaiUmumPageState();
}

class _NilaiUmumPageState extends State<NilaiUmumPage> {

  String? _tahunAjaran;
  String? _tahunAjaran2 = '2022/2023';
  String? _semester;
  String? _semester2= '21';
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
    await Provider.of<SiswaProvider>(context, listen: false).gettahun();
    // ignore: use_build_context_synchronously
    await Provider.of<SiswaProvider>(context, listen: false).getsemester();
    // ignore: use_build_context_synchronously
    await Provider.of<SiswaProvider>(context, listen: false).getRaporSiswaD(token!, _semester2!, 'KMK', 'ASSOF', _tahunAjaran2!);
  }

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as Map;
    String nama = arg['nama'];

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
            Text(
              "Tahun Ajaran",
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
                      value: _tahunAjaran,
                      onChanged: (newValue) {
                          setState(() {
                            _tahunAjaran = newValue;
                            _tahunAjaran2 = newValue;
                          });
                        },
                      items: siswaProvider.tahun.map((location) {
                          return DropdownMenuItem(
                            child: new Text(location.tahun.toString(),),
                            value: location.tahun.toString(),
                          );
                        }).toList()
                    );
                  }
                )
              ),
            Text(
              "Semester",
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
                      value: _semester,
                      onChanged: (newValue) {
                          setState(() {
                            _semester = newValue;
                            _semester2 = newValue;
                          });
                        },
                      items: siswaProvider.semester.map((location) {
                          return DropdownMenuItem(
                            child: new Text(location.semester.toString(),),
                            value: location.replid.toString(),
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

  Widget cell2(double lebar, String nama){
    return Container(
      width: lebar, 
      child: Text(
        nama,
        style: blackTextStyle.copyWith(
          fontSize: 12
        ),
      )
    );
  }

  Widget dataNilai(String mapel, String nilai, String angka){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        
        cell2(180, mapel),
        cell2(40, nilai),
        cell2(40, angka),
        cell2(40, "icon"),

      ],
    );
  }

  Widget content2(String tes){
    return Container(
      margin: EdgeInsets.only(top: 20,left: 10, right: 10),
      padding: EdgeInsetsDirectional.all(15),
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

              Container(width: 180, child: Text("Mata Pelajaran",style: blackTextStyle.copyWith(fontSize: 12, fontWeight: bold),)),
              Container(width: 40, child: Text("Angka",style: blackTextStyle.copyWith(fontSize: 12, fontWeight: bold),)),
              Container(width: 40, child: Text("Huruf",style: blackTextStyle.copyWith(fontSize: 12, fontWeight: bold),)),
              Container(width: 40, child: Text("Action",style: blackTextStyle.copyWith(fontSize: 12, fontWeight: bold),)),

            ],
          ),
          Container(
            margin: EdgeInsets.only(bottom: 5),
            width: double.infinity,
            height: 1,
            color: blackColor,
          ),
          Column(
            children: siswaProvider.rapor.map((rapor) => dataNilai(rapor.nama.toString(), rapor.nilaiangka.toString(), rapor.nilaihuruf.toString())).toList(),
          ),
        ],
      ),
    );
  }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            AppBarButtom(nama: nama),
            Text(_semester.toString()),
            Text(_tahunAjaran.toString()),
            Text(token.toString()),
            comboBox(),
            content2(nama)
            // RefreshIndicator(
            //   onRefresh: getInit,
            //   child: ListView(
            //     children: [
            //       comboBox(),
            //       content2(nama)
            //     ],
            //   ), 
            // ),
          ],
        ),
      ),
    );
  }
}