import 'package:fe_info_siswa/provider/siswa2_provider.dart';
import 'package:fe_info_siswa/provider/siswa_provider.dart';
import 'package:fe_info_siswa/share/theme.dart';
import 'package:fe_info_siswa/widgets/loading.dart';
import 'package:fe_info_siswa/widgets/presen_siswa_tile.dart';
import 'package:fe_info_siswa/widgets/siswa_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sp_util/sp_util.dart';

class ListPresensionPage extends StatefulWidget {
  const ListPresensionPage({super.key});

  @override
  State<ListPresensionPage> createState() => _ListPresensionPageState();
}

class _ListPresensionPageState extends State<ListPresensionPage> {

  String? token = SpUtil.getString('token');
  int? angka = SpUtil.getInt('a');
  int? nis = SpUtil.getInt('nis');
  
  List<String> year = ['2021','2022','2023','2024','2025','2026'];
  String? _itemyear='2023';
  List<String> month = ['1','2','3','4','5','6','7','8','9','10','11','12'];
  String? _itemmonth='1';

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
    await Provider.of<SiswaProvider>(context, listen: false).getpresenSiswa(token!, _itemyear!, _itemmonth!);
  }
  
  @override
  Widget build(BuildContext context) {

    SiswaProvider siswaProvider = Provider.of<SiswaProvider>(context);

    Widget Title(){
      return Container(
        margin: EdgeInsets.only(
          top: 20,
          right: defaultMargin,
          left: defaultMargin
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Select',
              style: primaryTextStyle.copyWith(
                fontSize: 22,
                fontWeight: semibold
              ),
            ),

            ButtonTheme(
              alignedDropdown: true,
              child: DropdownButton(
                style: TextStyle(
                  color: Colors.amber
                ),
                borderRadius: BorderRadius.circular(15),
                focusColor: Colors.amber,
                underline: Container(
                  height: 2,
                  color: backgroundColor6,
                ),
                value: _itemyear,
                onChanged: (newValue) {
                    setState(() {
                      _itemyear = newValue;
                    });
                  },
                items: year.map((location) {
                    return DropdownMenuItem(
                      child: new Text(location,),
                      value: location,
                    );
                  }).toList()
              )
            ),

            ButtonTheme(
              alignedDropdown: true,
              child: DropdownButton(
                style: TextStyle(
                  color: Colors.amber
                ),
                borderRadius: BorderRadius.circular(15),
                focusColor: Colors.amber,
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
                      child: new Text(location),
                      value: location,
                    );
                  }).toList()
              )
            ),

          ],
        ),
      );
    }

    Widget listSiswa(){
      return Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: FutureBuilder(
          future: data(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Loading();
            } else {
              return Column(
            children: siswaProvider.presen.map((presen) => PresenSiswaTile(presen)).toList(),
            );
            }
          },
          
        ),
      );
    }

    return 
    Scaffold(
      body: RefreshIndicator(
        onRefresh: getInit,
        child: ListView(
          children: [
            Title(),
            listSiswa(),
            SizedBox(height: 10,)
          ],
        ),
      ),
    );
  }
}