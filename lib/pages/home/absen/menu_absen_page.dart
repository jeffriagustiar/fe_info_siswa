import 'package:fe_info_siswa/share/theme.dart';
import 'package:fe_info_siswa/widgets/anak_fitur_buttom.dart';
import 'package:fe_info_siswa/widgets/appBar_buttom.dart';
import 'package:fe_info_siswa/widgets/fitur_buttom.dart';
import 'package:flutter/material.dart';

class MenuAbsenPage extends StatelessWidget {
  const MenuAbsenPage({super.key});

  @override
  Widget build(BuildContext context) {

    Widget backGround(){
      return Container(
        width: double.infinity,
        height: 250,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/boy-going-to-the-school.png'),
          )
        ),
      );
    }

    Widget contentRapor(){
      return Container(
        padding: const EdgeInsets.only(top: 450,left: 20,right: 20,bottom: 30),
        child: Column(
          children: [
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
                  const SizedBox(height: 10,),
                  Text(
                    "Absensi",
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: bold
                    ),
                  ),
                  const SizedBox(height: 10,),

                  GridView(
                    padding: const EdgeInsets.only(top: 10,bottom: 10 ),
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      childAspectRatio: 0.78,
                    ),
                    shrinkWrap: true,
                      children: [
                        FiturButtom(
                          nama: 'Harian', 
                          onPressed: () {
                            Navigator.pushNamed(
                              context, 
                              '/absen-harian',
                            );
                          },
                          img: 'assets/ic_absen.png',
                        ),
                        FiturButtom(
                          nama: 'Pelajaran', 
                          onPressed: () {
                            Navigator.pushNamed(
                              context, 
                              '/absen-mapel',
                            );
                          },
                          img: 'assets/ic_absen.png',
                        ),
                        FiturButtom(
                          nama: 'Rekap', 
                          onPressed: () {
                            Navigator.pushNamed(
                              context, 
                              '/absen-pelajaran',
                            );
                          },
                          img: 'assets/ic_absen.png',
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

    Widget infoText(String text){
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "-)",
            style: blackTextStyle.copyWith(
              height: 2,
              fontSize: 14,
              fontWeight: regular
            ),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(width: 5,),
          Expanded(
            child: Text(
              text,
              style: blackTextStyle.copyWith(
                height: 2,
                fontSize: 14,
                fontWeight: regular
              ),
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      );
    }

    Widget info(){
      return Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 120,left: 20,right: 20),
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 6,),
            Text(
              "Ada beberapa macam absensi yang bisa dilihat yaitu.",
              style: blackTextStyle.copyWith(
                height: 2,
                fontSize: 14,
                fontWeight: regular
              ),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 6,),
            infoText("Absen Harian yaitu absen yang diambil siswa saat sampai sekolah"),
            infoText("Absen Pelajaran yaitu absen yang diambil guru saat pemblajaran dimulai"),
            infoText("Absen Rekap yaitu rekapan absen siswa pada tahun tersebut"),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: background4Color,
      body: SafeArea(
        child: Column(
          children: [
            AppBarButtom(nama: 'Presensi / Absensi'),
            Expanded(
              child: ListView(
                children: [
                  Stack(
                    children: [
                      backGround(),
                      info(),
                      contentRapor(),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}