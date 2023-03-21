import 'package:fe_info_siswa/provider/siswa_provider.dart';
import 'package:fe_info_siswa/share/theme.dart';
import 'package:fe_info_siswa/widgets/appBar_buttom.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NilaiHarianPage extends StatefulWidget {
  const NilaiHarianPage({super.key});

  @override
  State<NilaiHarianPage> createState() => _NilaiHarianPageState();
}

class _NilaiHarianPageState extends State<NilaiHarianPage> {
  String? _mapel;
  String? _mapel2 = '1';

  // ignore: unused_field
  bool _isRefreshing = false;

  Future<void> getInit() async{
    setState(() {
      _isRefreshing = true;
    });
    // data(jenis);
    setState(() {
      _isRefreshing = false;
    });
  }

  data(jenis) async{
    await Provider.of<SiswaProvider>(context, listen: false).getMapel(jenis);
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
              Text(_mapel.toString()),
            ],
          ),
        ),
      ),
    );
  }
}