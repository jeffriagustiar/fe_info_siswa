import 'package:fe_info_siswa/share/theme.dart';
import 'package:fe_info_siswa/widgets/anak_fitur_buttom.dart';
import 'package:fe_info_siswa/widgets/appBar_buttom.dart';
import 'package:fe_info_siswa/widgets/fitur_buttom.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class MenuNilaiPage extends StatelessWidget {
  const MenuNilaiPage({super.key});

  @override
  Widget build(BuildContext context) {

    Widget backGround(){
      return Container(
        width: double.infinity,
        height: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/online-certificate-course.png'),
          )
        ),
      );
    }

    Widget contentRapor(){
      return Container(
        padding: EdgeInsets.only(top: 390,left: 20,right: 20),
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
                    "Nilai Rapor",
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
                          nama: 'Umum', 
                          onPressed: () {
                            Navigator.pushNamed(
                              context, 
                              '/nilai-rapor-umum',
                              arguments: {
                                'nama' : 'Pelajaran Umum',
                                'jenis' : 'KMU',
                                'tipe' : 'ASSOF',
                                'pancasila' : 0
                              }
                            );
                          },
                          img: 'assets/ic_uang.png',
                        ),
                        FiturButtom(
                          nama: 'Kejuruan', 
                          onPressed: () {
                            Navigator.pushNamed(
                              context, 
                              '/nilai-rapor-umum',
                              arguments: {
                                'nama' : 'Pelajaran Kejuruan',
                                'jenis' : 'KMK',
                                'tipe' : 'ASSOF',
                                'pancasila' : 0
                              }
                            );
                          },
                          img: 'assets/ic_uang.png',
                        ),
                        FiturButtom(
                          nama: 'Pancasila', 
                          onPressed: () {
                            Navigator.pushNamed(
                              context, 
                              '/nilai-rapor-pancasila',
                              arguments: {
                                'nama' : 'Pelajaran Pancasila',
                                'jenis' : 'P5',
                                'tipe' : 'D',
                                'pancasila' : 1
                              }
                            );
                          },
                          img: 'assets/ic_uang.png',
                        ),
                        FiturButtom(
                          nama: 'Ex School', 
                          onPressed: () {
                            Navigator.pushNamed(
                              context, 
                              '/nilai-rapor-umum',
                              arguments: {
                                'nama' : 'Pelajaran Ex School ',
                                'jenis' : 'KURIK',
                                'tipe' : 'KURIK',
                                'pancasila' : 0
                              }
                            );
                          },
                          img: 'assets/ic_uang.png',
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

    Widget contentHarian(){
      return Container(
        padding: EdgeInsets.only(top: 590,left: 20,right: 20,bottom: 30),
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
                    "Nilai Harian",
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
                          nama: 'Umum', 
                          onPressed: () {
                            Navigator.pushNamed(
                              context, 
                              '/nilai-harian',
                              arguments: {
                                'nama' : 'Pelajaran Umum',
                                'jenis' : 'KMU',
                                'tipe' : 'ASSOF',
                                'pancasila' : 0
                              }
                            );
                          },
                          img: 'assets/ic_uang.png',
                        ),
                        FiturButtom(
                          nama: 'Kejuruan', 
                          onPressed: () {
                            Navigator.pushNamed(
                              context, 
                              '/nilai-harian',
                              arguments: {
                                'nama' : 'Pelajaran Kejuruan',
                                'jenis' : 'KMK',
                                'tipe' : 'ASSOF',
                                'pancasila' : 0
                              }
                            );
                          },
                          img: 'assets/ic_uang.png',
                        ),
                        FiturButtom(
                          nama: 'Pancasila', 
                          onPressed: () {
                            Navigator.pushNamed(
                              context, 
                              '/nilai-harian',
                              arguments: {
                                'nama' : 'Pelajaran Pancasila',
                                'jenis' : 'P5',
                                'tipe' : 'D',
                                'pancasila' : 1
                              }
                            );
                          },
                          img: 'assets/ic_uang.png',
                        ),
                        FiturButtom(
                          nama: 'Ex School', 
                          onPressed: () {
                            Navigator.pushNamed(
                              context, 
                              '/nilai-harian',
                              arguments: {
                                'nama' : 'Pelajaran Ex School ',
                                'jenis' : 'KURIK',
                                'tipe' : 'KURIK',
                                'pancasila' : 0
                              }
                            );
                          },
                          img: 'assets/ic_uang.png',
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
      return Container(
        child: Row(
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
                  )
      );
    }

    Widget info(){
      return Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 120,left: 20,right: 20),
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 30),
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
                    "Nilai dibagi menjadi dua yaitu Nilai Rapor dan Nilai Harian.",
                    style: blackTextStyle.copyWith(
                      height: 2,
                      fontSize: 14,
                      fontWeight: regular
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 6,),
                  infoText("Nilai Rapor merupakan hasil nilai akhir yang dicapai oleh siswa"),
                  infoText("Nilai Harian merupakan nilai yang diambil oleh guru perhari pengambilan"),
                ],
              ),
            );
    }
    
    return Scaffold(
      backgroundColor: background4Color,
      body: SafeArea(
        child: Column(
          children: [
            AppBarButtom(nama: 'Nilai'),
            Expanded(
              child: ListView(
                children: [
                  Stack(
                    children: [
                      backGround(),
                      info(),
                      contentRapor(),
                      contentHarian(),
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