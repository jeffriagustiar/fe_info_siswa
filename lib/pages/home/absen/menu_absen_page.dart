import 'package:fe_info_siswa/share/theme.dart';
import 'package:fe_info_siswa/widgets/anak_fitur_buttom.dart';
import 'package:fe_info_siswa/widgets/appBar_buttom.dart';
import 'package:flutter/material.dart';

class MenuAbsenPage extends StatelessWidget {
  const MenuAbsenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: ListView(
        children: [
          AppBarButtom(nama: 'Presensi / Absensi'),
           const SizedBox(height: 20,),
          Container(
            padding: const EdgeInsets.only(right: 30,left: 30),
            child: Text(
              "Presensi Atau Absensi Siswa Selanjutnya Pilih Presensi Yang Mau Dilihat",
              style: blackTextStyle.copyWith(
                fontSize: 15,
                fontWeight: medium
              ),
              textAlign: TextAlign.justify,
            ),
          ),

          Container(
            padding: const EdgeInsets.all(10),
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
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AnakFiturButtom(
                      nama: 'Harian', 
                      desc: "Merupakan kehadiran yang diambil saat siswa sampai disekolah berdasarkan jam masuk sekolah",
                      onPressed: () {
                        Navigator.pushNamed(context, '/absen-harian');
                      },
                    ),
                    AnakFiturButtom(
                      nama: 'Pelajaran',
                      desc: "Merupakan kehadiran yang diambil saat siswa mengikuti proser pemblajaran",
                      onPressed: () {
                        Navigator.pushNamed(context, '/absen-pelajaran');
                      },
                    ),
                  ],
                ),
                // const SizedBox(height: 10,),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     AnakFiturButtom(
                //       nama: 'Ex School', 
                //       desc: "Merupakan kehadiran siswa mengikuti extra kurikuler sekolah",
                //       onPressed: () {
                //         // Navigator.pushNamed(context, '/menu-nilai-rapor');
                //       },
                //     ),
                //   ],
                // ),
              ],
            ),
            
          )

        ],
      ),
    );
  }
}