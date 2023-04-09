import 'package:fe_info_siswa/provider/siswa_provider.dart';
import 'package:fe_info_siswa/share/theme.dart';
import 'package:fe_info_siswa/widgets/appBar_buttom.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sp_util/sp_util.dart';

class ListNilaiHarianPage extends StatefulWidget {
  const ListNilaiHarianPage({super.key});

  @override
  State<ListNilaiHarianPage> createState() => _ListNilaiHarianPageState();
}

class _ListNilaiHarianPageState extends State<ListNilaiHarianPage> {

  String? _sem;
  String? _sem2 = '21';
  String? _tahunAjaran;
  String? _tahunAjaran2 = '2022/2023';
  String? token = SpUtil.getString('token');
  String? kelas = SpUtil.getInt('idkelas').toString();

  // ignore: unused_field
  bool _isRefreshing = false;

  Future<void> getInit() async{
    setState(() {
      _isRefreshing = true;
    });
    // data2();
    setState(() {
      _isRefreshing = false;
    });
  }

  data(jenis) async{
    await Provider.of<SiswaProvider>(context, listen: false).getMapel(jenis);
  }

  dataSemeTahun() async{
    await Provider.of<SiswaProvider>(context, listen: false).gettahun(token!);
    // ignore: use_build_context_synchronously
    await Provider.of<SiswaProvider>(context, listen: false).getsemester(/*token!*/);
  }

  data2() async{
    // await Provider.of<SiswaProvider>(context, listen: false).getJenisNilaiHarin(token!, _mapel2!, _tahunAjaran2!, _sem2!);
  }

  dataNilaiHarian(String jjenis) async{
    await Provider.of<SiswaProvider>(context, listen: false).getNilaiHarin(token!, jjenis);
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Tahun Ajaran",
                  style: blackTextStyle,
                ),
                ButtonTheme(
                  alignedDropdown: true,
                  child: FutureBuilder(
                    future: dataSemeTahun(),
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
              const SizedBox(width: 10,),
              ButtonTheme(
                alignedDropdown: true,
                child: FutureBuilder(
                  future: dataSemeTahun(),
                  builder: (context, snapshot) {
                    return DropdownButton(
                      style: TextStyle(color: blackColor),
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

  Widget content(){
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
      width: double.infinity,
      // height: 100,
      decoration: BoxDecoration(
        color: background4Color,
        borderRadius: BorderRadius.circular(15)
      ),
      child: Container(
        // padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('assets/ic_cari.gif', width: 60,),
            const SizedBox(width: 5,),
            Expanded(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Matapelajaran", style: blackTextStyle.copyWith(fontWeight: bold, fontSize: 15),),
                  const SizedBox(height: 5,),
                  Text("Bahasa Indonesiaasjdhkjasdhkasjdh",style: blackTextStyle, overflow: TextOverflow.ellipsis, softWrap: true,maxLines: 3,),
                  Text("Kode : BI",style: blackTextStyle,),
                ],
              ),
            ),
            const SizedBox(width: 5,),
            const Icon(Icons.chevron_right, size: 60,)
          ],
        ),
      ),
    );
  }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: getInit,
          child: Column(
            children: [
              AppBarButtom(nama: nama),
              Expanded(
                child: ListView(
                  children: [
                    comboBox(),
                    content()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}