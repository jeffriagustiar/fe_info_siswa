import 'package:fe_info_siswa/provider/siswa_provider.dart';
import 'package:fe_info_siswa/share/theme.dart';
import 'package:fe_info_siswa/widgets/loading.dart';
import 'package:fe_info_siswa/widgets/siswa_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sp_util/sp_util.dart';

class ListSiswaPage extends StatefulWidget {
  const ListSiswaPage({super.key});

  @override
  State<ListSiswaPage> createState() => _ListSiswaPageState();
}

class _ListSiswaPageState extends State<ListSiswaPage> {

  int? angka = SpUtil.getInt('a');
  int? nis = SpUtil.getInt('nis');

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
    await Provider.of<SiswaProvider>(context, listen: false).getsiswa();
  }
  
  @override
  Widget build(BuildContext context) {

    // AuthProvider authProvider = Provider.of<AuthProvider>(context);
    // UserModel user = authProvider.user;

    SiswaProvider siswaProvider = Provider.of<SiswaProvider>(context);



    Widget title(){
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          right: defaultMargin,
          left: defaultMargin
        ),
        child: Text(
          'List Students',
          style: primaryTextStyle.copyWith(
            fontSize: 22,
            fontWeight: semibold
          ),
        ),
      );
    }

    Widget listSiswa(){
      return Container(
        margin: const EdgeInsets.only(
          top: 14,
        ),
        child: FutureBuilder(
          future: data(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Loading();
            } else {
              return Column(
            children: siswaProvider.siswa.map((siswa) => SiswaTile(siswa)).toList(),
            );
            }
          },
          
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: getInit,
      child: ListView(
        children: [
          title(),
          listSiswa()
          
        ],
      ),
    );
  }
}