import 'package:fe_info_siswa/share/theme.dart';
import 'package:fe_info_siswa/widgets/anak_fitur_buttom.dart';
import 'package:fe_info_siswa/widgets/appBar_buttom.dart';
import 'package:flutter/material.dart';

class MenuNilaiRaporPage extends StatelessWidget {
  const MenuNilaiRaporPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: ListView(
        children: [
          AppBarButtom(nama: 'Nilai Rapor'),
          const SizedBox(height: 20,),
          Container(
            padding: const EdgeInsets.only(right: 30,left: 30),
            child: Text(
              "Pilih Nilai Rapor Yang Mau Dilihat",
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
            child: Column(
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AnakFiturButtom(
                      nama: 'Nilai Umum', 
                      desc: "Nilai Mata Pelajaran Umum merupakan matapelajaran yang secara umum dipelajari",
                      onPressed: () {
                        Navigator.pushNamed(
                          context, 
                          '/nilai-rapor-umum',
                          arguments: {
                            'nama' : 'Pelajaran Umum'
                          }
                        );
                      },
                    ),
                    AnakFiturButtom(
                      nama: 'Nilai Kejuruan',
                      desc: "Nilai Mata Pelajaran Kejuruan merupakan konsentasi berdasarkan jurusan",
                      onPressed: () {
                        Navigator.pushNamed(context, '/nilai-rapor-umum');
                      },
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AnakFiturButtom(
                      nama: 'Nilai Pancasila', 
                      desc: "Nilai Penguatan Profil Pelajar Pancasila",
                      onPressed: () {
                        Navigator.pushNamed(context, '/nilai-rapor-umum');
                      },
                    ),
                    AnakFiturButtom(
                      nama: 'Nilai Ex School ', 
                      desc: "Nilai Ex School atau Ekstrakurikuler merupakan pelajaran extra",
                      onPressed: () {
                        Navigator.pushNamed(context, '/nilai');
                      },
                    ),
                  ],
                ),

              ],
            ),
          )

        ],
      ),
    );
  }
}