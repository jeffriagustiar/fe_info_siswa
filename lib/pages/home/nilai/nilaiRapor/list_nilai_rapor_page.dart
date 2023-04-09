import 'package:fe_info_siswa/provider/siswa2_provider.dart';
import 'package:fe_info_siswa/provider/siswa_provider.dart';
import 'package:fe_info_siswa/share/theme.dart';
import 'package:fe_info_siswa/widgets/loading.dart';
import 'package:fe_info_siswa/widgets/nilai_siswa.dart';
import 'package:fe_info_siswa/widgets/siswa_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sp_util/sp_util.dart';

class ListNilaiRaporPage extends StatefulWidget {
  const ListNilaiRaporPage({super.key});

  @override
  State<ListNilaiRaporPage> createState() => _ListNilaiRaporPageState();
}

class _ListNilaiRaporPageState extends State<ListNilaiRaporPage> {

  String? token = SpUtil.getString('token');
  int? angka = SpUtil.getInt('a');
  int? nis = SpUtil.getInt('nis');

  // ignore: unused_field
  bool _isRefreshing = false;

  Future<void> getInit() async{
    setState(() {
      _isRefreshing = true;
    });
    data();
    data2();
    setState(() {
      _isRefreshing = false;
    });
  }

  data() async{
    await Provider.of<SiswaProvider>(context, listen: false).getRaporSiswa(token!, '21');
  }
  data2() async{
    await Provider.of<SiswaProvider>(context, listen: false).getRaporSiswa(token!, '22');
  }
  
  @override
  Widget build(BuildContext context) {

    SiswaProvider siswaProvider = Provider.of<SiswaProvider>(context);

    // Widget listSiswa(){
    //   return Container(
    //     margin: EdgeInsets.only(
    //       top: 14,
    //     ),
    //     child: FutureBuilder(
    //       future: getInit(),
    //       builder: (context, snapshot) {
    //         if (snapshot.connectionState == ConnectionState.waiting) {
    //           return Loading();
    //         } else {
    //           return Column(
    //         children: siswaProvider.siswa.map((siswa) => SiswaTile(siswa)).toList(),
    //         );
    //         }
    //       },
          
    //     ),
    //   );
    // }

    Widget detailSem1(){
      return FutureBuilder(
          future: data(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Loading();
            } else {
              return Column(
            children: siswaProvider.rapor.map((rapor) => NilaiSiswa(rapor)).toList(),
            );
            }
          },
          
        );
    }

    Widget detailSem2(){
      return FutureBuilder(
          future: data2(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Loading();
            } else {
              return Column(
            children: siswaProvider.rapor.map((rapor) => NilaiSiswa(rapor)).toList(),
            );
            }
          },
          
        );
    }

    Widget semester1(){
      return RefreshIndicator(
      onRefresh: getInit,
      child: ListView(
        children: [
          detailSem1()
        ],
      )
    );
    }

    Widget semester2(){
      return RefreshIndicator(
      onRefresh: getInit,
      child: ListView(
        children: [
          detailSem2()
        ],
      )
    );
    }

    return DefaultTabController(
      animationDuration: Duration(seconds: 1),
      length: 2,
      child: Scaffold(
        backgroundColor: backgroundColor2,
        appBar: AppBar(
          backgroundColor: backgroundColor4,
          bottom: const TabBar(
            tabs: [
              Tab(
                text: "Semster 1",
              ),
              Tab(
                text: "Semster 2",
              ),
            ],
          ),
          title: const Text('Student Score Report'),
        ),
        body: TabBarView(
          children: [
            semester1(),
            semester2(),
          ],
        ),
      ),
    );
  }
}