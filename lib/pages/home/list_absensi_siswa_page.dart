import 'package:fe_info_siswa/provider/siswa2_provider.dart';
import 'package:fe_info_siswa/provider/siswa_provider.dart';
import 'package:fe_info_siswa/share/theme.dart';
import 'package:fe_info_siswa/widgets/loading.dart';
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
  
  List<String> number = ['21','22'];
  String? _item;

  abc(){
    if (_item == '21') {
      return _item='1';
    } else {
      return _item='2';
    }
  }

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
  }
  
  @override
  Widget build(BuildContext context) {

    // AuthProvider authProvider = Provider.of<AuthProvider>(context);
    // UserModel user = authProvider.user;

    SiswaProvider siswaProvider = Provider.of<SiswaProvider>(context);



    Widget Title(){
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          right: defaultMargin,
          left: defaultMargin
        ),
        child: Row(
          children: [
            Text(
              'Semester',
              style: primaryTextStyle.copyWith(
                fontSize: 22,
                fontWeight: semibold
              ),
            ),

            ButtonTheme(
              alignedDropdown: true,
              child: DropdownButton(
                value: _item, 
                onChanged: (newValue) {
                    setState(() {
                      _item = newValue;
                    });
                  },
                items: number.map((location) {
                    return DropdownMenuItem(
                      child: new Text(location),
                      value: location,
                    );
                  }).toList()
              )
            )

          ],
        ),
      );
    }

    Widget listSiswa(){
      return Container(
        margin: EdgeInsets.only(
          top: 14,
        ),
        child: FutureBuilder(
          future: data(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Loading();
            } else {
              return Column(
            children: siswaProvider.siswa.map((siswa) => SiswaTile(siswa)).toList(),
            );
            }
          },
          
        ),
      );
    }

    return 
    RefreshIndicator(
      onRefresh: getInit,
      child: ListView(
        children: [
          Text(_item.toString()),
          Title(),
          listSiswa()
          
        ],
      ),
    );
  }
}