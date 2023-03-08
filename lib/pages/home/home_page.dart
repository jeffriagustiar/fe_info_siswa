import 'package:fe_info_siswa/provider/siswa2_provider.dart';
import 'package:fe_info_siswa/provider/siswa_provider.dart';
import 'package:fe_info_siswa/share/theme.dart';
import 'package:fe_info_siswa/widgets/loading.dart';
import 'package:fe_info_siswa/widgets/siswa_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sp_util/sp_util.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

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
    setState(() {
      _isRefreshing = false;
    });
  }

  data() async{
    await Provider.of<SiswaProvider>(context, listen: false).getsiswa(token!);
    // ignore: use_build_context_synchronously
    await Provider.of<Siswa2Provider>(context, listen: false).getSiswaByNis(token!, nis!);
  }
  
  @override
  Widget build(BuildContext context) {

    // AuthProvider authProvider = Provider.of<AuthProvider>(context);
    // UserModel user = authProvider.user;

    // SiswaProvider siswaProvider = Provider.of<SiswaProvider>(context);


    Widget header(){
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin
        ),

        child: Row(
          children: [

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    // 'Hello, ${user.nama}',
                    SpUtil.getString('nama')!,
                    style: primaryTextStyle.copyWith(
                      fontSize: 24,
                      fontWeight: semibold
                    ),
                  ),
                  Text(
                    // '${user.panggilan}  '+
                    "Nis : "+SpUtil.getInt('nis').toString(),style: subTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  )
                ],
              ),
            ),

          ],
        ),

      );
    }

    
    Widget newArrivalsTitle(){
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

    Widget callData(){
      return FutureBuilder(
        future: data(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Loading();
          } else {
            return Text("data berhasil di ambil");
          }
        },
      );
    }

    return RefreshIndicator(
      onRefresh: getInit,
      child: ListView(
        children: [
          header(),
          newArrivalsTitle(),
          callData()
        ],
      ),
    );
  }
}