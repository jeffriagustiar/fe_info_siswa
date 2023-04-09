import 'package:fe_info_siswa/models/nilai/mapel_nilai_harian_model.dart';
import 'package:fe_info_siswa/provider/siswa_provider.dart';
import 'package:fe_info_siswa/share/theme.dart';
import 'package:fe_info_siswa/widgets/appBar_buttom.dart';
import 'package:fe_info_siswa/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sp_util/sp_util.dart';

class NilaiHarianPage extends StatefulWidget {
  final MapelNilaiHarianModel mapelNilai;
  final String abc;
  final String tahunAjaranNilai;
  final String semesterNilai;
  NilaiHarianPage(this.mapelNilai,{required this.abc, required this.tahunAjaranNilai, required this.semesterNilai });

  @override
  State<NilaiHarianPage> createState() => _NilaiHarianPageState();
}

class _NilaiHarianPageState extends State<NilaiHarianPage> {
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

  data2() async{
    await Provider.of<SiswaProvider>(context, listen: false).getJenisNilaiHarin(token!, widget.mapelNilai.idpelajaran!, widget.tahunAjaranNilai, widget.semesterNilai);
  }

  dataNilaiHarian(String jjenis) async{
    await Provider.of<SiswaProvider>(context, listen: false).getNilaiHarin(token!, jjenis);
  }

  @override
  Widget build(BuildContext context) {
    // final arg = ModalRoute.of(context)!.settings.arguments as Map;
    // String nama = arg['nama'];
    // String jenis = arg['jenis'];

    SiswaProvider siswaProvider = Provider.of<SiswaProvider>(context);


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
      // padding: const EdgeInsets.only(top: 15),
      width: lebar, 
      height: 30,
      child: TextButton(
        onPressed: (){
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
          Icons.search,
          // size: 20,
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

  Widget ContainerJenis(String kategori, String jjenis){
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
              Text('Kategori : $kategori', style: blackTextStyle.copyWith(fontSize: 12, fontWeight: bold),),
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
                  Container(width: 110, child: Text("Tanggal",style: blackTextStyle.copyWith(fontSize: 12, fontWeight: bold),)),
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
            future: dataNilaiHarian(jjenis),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Loading();
              } else {
                return Column(
                  children: siswaProvider.nilaiHarian.map((nilai) => dataNilai(
                    nilai.tanggal.toString(), 
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

  Widget content(){
    return FutureBuilder(
      future: data2(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // ignore: prefer_const_constructors
          return Loading();
        } else {
          return Column(
            children: siswaProvider.jenisNilaiHarian.map((jenis) => ContainerJenis(
              jenis.jenisujian.toString(),
              jenis.replid.toString()
            )).toList(),
          );
        }
      }
    );
  }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        // child: RefreshIndicator(
        //   onRefresh: getInit,
          child: Column(
            children: [
              AppBarButtom(nama: widget.mapelNilai.nama.toString()),
              Expanded(
                child: ListView(
                  children: [
                    content()
                  ],
                // ),
                      ),
              ),
            ],
          ),
      ),
    );
  }
}