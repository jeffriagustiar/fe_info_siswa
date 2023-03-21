import 'package:fe_info_siswa/provider/siswa_provider.dart';
import 'package:fe_info_siswa/share/theme.dart';
import 'package:fe_info_siswa/widgets/appBar_buttom.dart';
import 'package:fe_info_siswa/widgets/loading.dart';
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
  }
  data2(String jenis, String tipe) async{
    await Provider.of<SiswaProvider>(context, listen: false).getRaporSiswaD(token!, _semester2!, jenis, tipe, _tahunAjaran2!);
  }

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as Map;
    String nama = arg['nama'];
    String jenis = arg['jenis'];
    String tipe = arg['tipe'];
    int pancasila = arg['pancasila'];

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
                            // ignore: unnecessary_new, sort_child_properties_last
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
                            // ignore: sort_child_properties_last, unnecessary_new
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

  Widget icon(double lebar, String komen){
    return Container(
      padding: const EdgeInsets.only(top: 15),
      width: lebar, 
      child: GestureDetector(
        onTap: (){
          showDialog(
            context: context, 
            builder: (BuildContext context){
              return AlertDialog(
                title: Text('Komentar terkait pencapaian',style: blackTextStyle.copyWith(fontWeight: bold),),
          content: Text(komen, textAlign: TextAlign.justify,),
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

  Widget dataNilai(String mapel, String nilai, String angka, String komen){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        
        cell2(180, mapel),
        cell2(40, nilai),
        cell2(40, angka),
        icon(20, komen),

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
              } else {
                if (pancasila==1) {
                  return Column(
                    children: siswaProvider.rapor.map((rapor) => dataNilai(
                      // ignore: prefer_interpolation_to_compose_strings
                      rapor.nama.toString()+" "+rapor.dasarpenilaian.toString(), 
                      rapor.nilaiangka.toString(), 
                      rapor.nilaihuruf.toString(), 
                      rapor.komentar2.toString()
                    )).toList(),
                  );
                } else {
                  return Column(
                    children: siswaProvider.rapor.map((rapor) => dataNilai(
                      rapor.nama.toString(), 
                      rapor.nilaiangka.toString(), 
                      rapor.nilaihuruf.toString(), 
                      rapor.komentar2.toString()
                    )).toList(),
                  );
                }
                
              }
            }
          ),
        ],
      ),
    );
  }

  Widget keterangan(){
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
              Container(width: 200, child: Text("Keterangan Pelajaran Pancasila",style: blackTextStyle.copyWith(fontSize: 12, fontWeight: bold),)),

            ],
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 5),
            width: double.infinity,
            height: 1,
            color: blackColor,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              cell2(150, "D1 : Beriaman, bertaqwa kepadaTuhan YME dan berakhlak mulia"),
              cell2(150, "SB : Sangat Berkembang"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              cell2(150, "D2 : Bernalar kritis"),
              cell2(150, "BSH : Berkembang Sesuai Harapan"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              cell2(150, "D3 : Mandiri"),
              cell2(150, "MB : Mulai Berkembang"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              cell2(150, "D4 : Kebhinekaan Global"),
              cell2(150, "BB : Belum Berkembang"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              cell2(150, "D5 : Kreatif"),
              cell2(150, ""),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              cell2(150, "D6 : Bergotongroyong"),
              cell2(150, ""),
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
              AppBarButtom(nama: nama),
              comboBox(),
              content2(tipe, jenis),
              pancasila == 1 ? keterangan() : const SizedBox(height: 20,),
              const SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}