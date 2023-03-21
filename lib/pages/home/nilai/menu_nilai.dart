import 'package:fe_info_siswa/share/theme.dart';
import 'package:fe_info_siswa/widgets/anak_fitur_buttom.dart';
import 'package:fe_info_siswa/widgets/appBar_buttom.dart';
import 'package:flutter/material.dart';

class MenuNilaiPage extends StatelessWidget {
  const MenuNilaiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: ListView(
        children: [
          AppBarButtom(nama: ''),
          const SizedBox(height: 20,),
          Container(
            padding: const EdgeInsets.only(right: 30,left: 30),
            child: Text(
              "Pilih Penilaian Yang Mau Dilihat",
              style: blackTextStyle.copyWith(
                fontSize: 15,
                fontWeight: medium
              ),
            ),
          ),

          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.only(top: 20),
            // height: 400,
            width: double.infinity,
            decoration: BoxDecoration(
              color: background4Color,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 10,
                  offset: const Offset(0, 1),
                ),
              ]
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AnakFiturButtom(
                  nama: 'Nilai Rapor', 
                  desc: "Nilai rapor merupakan hasil nilai akhir yang dicapai oleh peserta didik",
                  onPressed: () {
                    Navigator.pushNamed(context, '/menu-nilai-rapor');
                  },
                ),
                AnakFiturButtom(
                  nama: 'Nilai Harian',
                  desc: "Nilai harian merupakan nilai yang diambil oleh guru perhari pengambilan",
                  onPressed: () {
                    Navigator.pushNamed(context, '/menu-nilai-harian');
                  },
                ),
              ],
            ),
          )

        ],
      ),
    );
  }
}