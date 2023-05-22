import 'package:fe_info_siswa/provider/siswa_provider.dart';
import 'package:fe_info_siswa/share/theme.dart';
import 'package:fe_info_siswa/widgets/appBar_buttom.dart';
import 'package:fe_info_siswa/widgets/loading.dart';
import 'package:fe_info_siswa/widgets/no_result_info_gif.dart';
import 'package:fe_info_siswa/widgets/text_buttom.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CatatanSiswaPage extends StatefulWidget {
  const CatatanSiswaPage({super.key});

  @override
  State<CatatanSiswaPage> createState() => _CatatanSiswaPageState();
}

class _CatatanSiswaPageState extends State<CatatanSiswaPage> {
  String kate='pelanggaran';
  int total=0;

  String getTitleByIndex(int index) {
    switch (index) {
      case 0:
        return "prestasi";
      case 1:
        return "hukuman";
      case 2:
        return "pelanggaran";
      default:
        return "";
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
    await Provider.of<SiswaProvider>(context, listen: false).getCatatanSiswa(kate);
  }

  

  @override
  Widget build(BuildContext context) {

    SiswaProvider siswaProvider = Provider.of<SiswaProvider>(context);

    // Future<int> getData() async {
    // // Ambil data secara asinkron
    //   int data = await siswaProvider.totalPoint();
    //   return data;
    // }

    Widget catatan(String kategori, String nama, String poin)
    {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
        width: double.infinity,      
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: backgroundColor
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  kategori.toString(),
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: semibold
                  ),
                ),
                Text(
                  nama.toString(),
                  style: greyTextStyle.copyWith(
                    fontSize: 15,
                    fontWeight: regular
                  ),
                )
              ],
            ),
            Text(
              poin.toString(),
              style: blackTextStyle.copyWith(
                fontSize: 18,
                fontWeight: semibold,
                color: int.parse(poin)  < 0 ? Colors.red : Colors.green
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: background4Color,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: getInit,
          child: Column(
            children: [
              AppBarButtom(nama: "Catatan Siswa"),
        
              Container(
                height: 80,
                child: Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3, // Jumlah item dalam List View
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextButtomSendiri(
                            nama: getTitleByIndex(index), // Mengganti "Prestasi", "Hukuman", dan "Pelanggaran" dengan judul sesuai dengan indeks
                            lebar: 150, // Lebar setiap item
                            onPressed: () {
                              setState(() {
                                kate=getTitleByIndex(index);
                              });
                            },
                          ),
                        );
                      },
                    ),
                  ),
              ),
        
              const SizedBox(height: 10,),
        
              Expanded(
                child: FutureBuilder(
                  future: data(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Loading();
                    } else if(siswaProvider.catatanSiswa.isEmpty){
                      return NoResultInfoGif(lebar: double.infinity);
                    } else {
                      return ListView(
                        children: siswaProvider.catatanSiswa.map((ctt) {
                          total += int.parse(ctt.point.toString());
                          return catatan(
                            ctt.namaKategori.toString(), 
                            ctt.namaCtt.toString(), 
                            ctt.point.toString()
                          );
                        }
                          
                        ).toList()
                      );
                    }
                    
                  }
                )
              ),
        
            ],
          ),
        )
      ),
    );
  }
}