import 'package:fe_info_siswa/provider/siswa_provider.dart';
import 'package:fe_info_siswa/share/theme.dart';
import 'package:fe_info_siswa/widgets/appBar_buttom.dart';
import 'package:fe_info_siswa/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sp_util/sp_util.dart';

class NilaiHarianPage extends StatefulWidget {
  const NilaiHarianPage({super.key});

  @override
  State<NilaiHarianPage> createState() => _NilaiHarianPageState();
}

class _NilaiHarianPageState extends State<NilaiHarianPage> {
  String? _mapel;
  String? _mapel2 = '1';
  String? _sem;
  String? _sem2 = '21';
  String? token = SpUtil.getString('token');
  String? kelas = SpUtil.getInt('idkelas').toString();

  // ignore: unused_field
  bool _isRefreshing = false;

  Future<void> getInit() async{
    setState(() {
      _isRefreshing = true;
    });
    data2();
    setState(() {
      _isRefreshing = false;
    });
  }

  data(jenis) async{
    await Provider.of<SiswaProvider>(context, listen: false).getMapel(jenis);
  }

  dataSemester() async{
    await Provider.of<SiswaProvider>(context, listen: false).getsemester();
  }

  data2() async{
    await Provider.of<SiswaProvider>(context, listen: false).getNilaiHarin(token!, _mapel2!, kelas!, _sem2!);
  }

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as Map;
    String nama = arg['nama'];
    String jenis = arg['jenis'];

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Mata Pelajaran",
              style: blackTextStyle,
            ),
            ButtonTheme(
                alignedDropdown: true,
                child: FutureBuilder(
                  future: data(jenis),
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
                      value: _mapel,
                      onChanged: (newValue) {
                          setState(() {
                            _mapel = newValue;
                            _mapel2 = newValue;
                          });
                        },
                      items: siswaProvider.mapel.map((location) {
                          return DropdownMenuItem(
                            // ignore: unnecessary_new, sort_child_properties_last
                            child: new Text(location.nama.toString(),),
                            value: location.replid.toString(),
                          );
                        }).toList()
                    );
                  }
                )
              ),

              Row(
                children: [
                  Text(
                    "Semester",
                    style: blackTextStyle,
                  ),
                  SizedBox(width: 10,),
                  ButtonTheme(
                    alignedDropdown: true,
                    child: FutureBuilder(
                      future: dataSemester(),
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
                          value: _sem,
                          onChanged: (newValue) {
                              setState(() {
                                _sem = newValue;
                                _sem2 = newValue;
                              });
                            },
                          items: siswaProvider.semester.map((location) {
                              return DropdownMenuItem(
                                // ignore: unnecessary_new, sort_child_properties_last
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

  Widget icon(
    double lebar, 
    String mapel, 
    String tNilai, 
    String jNilai,
    String tgl,
    String nilai,
    String tglI,
    String keterangan,
    String tujuan,
  ){
    return Container(
      padding: const EdgeInsets.only(top: 15),
      width: lebar, 
      child: GestureDetector(
        onTap: (){
          showDialog(
            context: context, 
            builder: (BuildContext context){
              return AlertDialog(
                title: Text('Detail Nilai',style: blackTextStyle.copyWith(fontWeight: bold),),
                content: Container(
                  width: double.infinity,
                  height: 350,
                  child: ListView(
                    children: [
                      cell2("Mata Pelajaran :", mapel),
                      cell2("Kategori :", tNilai),
                      cell2("Jenis Nilai :", jNilai),
                      cell2("Tanggal Diambil :", tgl),
                      cell2("Nilai :", nilai),
                      cell2("Tanggal Diinput :", tglI),
                      cell2("Keterangan :", keterangan),
                      cell2("Tujuan :", tujuan),
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
        child: const Icon(
          Icons.search
        ),
      )
    );
  }

  Widget dataNilai(
    String tanggal, 
    String nilai, 
    String keterangan, 
    String mapel,
    String tNilai,
    String jNilai,
    String tgl,
    String tglI,
    String tujuan,
  ){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        
        cell(110, tanggal),
        const SizedBox(width: 5,),
        cell(40, nilai),
        const SizedBox(width: 5,),
        cell(110, keterangan),
        icon(40, mapel, tNilai, jNilai, tgl, nilai, tglI, keterangan, tujuan),

      ],
    );
  }

  Widget content(){
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
              Container(width: 110, child: Text("Kategori",style: blackTextStyle.copyWith(fontSize: 12, fontWeight: bold),)),
              const SizedBox(width: 5,),
              // ignore: sized_box_for_whitespace
              Container(width: 40, child: Text("Nilai",style: blackTextStyle.copyWith(fontSize: 12, fontWeight: bold),textAlign: TextAlign.center,)),
              const SizedBox(width: 5,),
              // ignore: sized_box_for_whitespace
              Container(width: 110, child: Text("Keterangan",style: blackTextStyle.copyWith(fontSize: 12, fontWeight: bold),)),
              // ignore: sized_box_for_whitespace
              Container(width: 40, child: Text("Detail",style: blackTextStyle.copyWith(fontSize: 12, fontWeight: bold),textAlign: TextAlign.center,)),

            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            width: double.infinity,
            height: 1,
            color: blackColor,
          ),
          FutureBuilder(
            future: data2(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Loading();
              } else {
                return Column(
                  children: siswaProvider.nilaiHarian.map((nilai) => dataNilai(
                    nilai.jenisujian.toString(), 
                    nilai.nilaiujian.toString(), 
                    nilai.keterangan.toString(), 
                    nilai.nama.toString(),
                    nilai.jenisujian.toString(), 
                    nilai.kode.toString(), 
                    nilai.tanggal.toString(), 
                    nilai.ts.toString(), 
                    nilai.keterangan2.toString(), 
                  )).toList(),
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
        child: RefreshIndicator(
          onRefresh: getInit,
          child: ListView(
            children: [
              AppBarButtom(nama: nama),
              comboBox(),
              // Text(_mapel.toString()),
              content()
            ],
          ),
        ),
      ),
    );
  }
}