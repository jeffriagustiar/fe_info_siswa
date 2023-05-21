import 'package:fe_info_siswa/share/theme.dart';
import 'package:fe_info_siswa/widgets/appBar_buttom.dart';
import 'package:fe_info_siswa/widgets/fitur_buttom.dart';
import 'package:flutter/material.dart';

class MenuCttAturan extends StatelessWidget {
  const MenuCttAturan({super.key});

  @override
  Widget build(BuildContext context) {

    Widget tailInfo(String nama, double poin, Color warna)
    {
      return Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: backgroundColor
        ),
        child: Column(
          children: [
            Text(
              nama,
              style: whiteTextStyle.copyWith(
                fontWeight: bold,
                fontSize: 14,
                color: warna
              ),
            ),
            Text(
              poin.toString(),
              style: whiteTextStyle.copyWith(
                fontWeight: bold,
                fontSize: 14,
                color: warna
              ),
            ),
          ],
        ),
      );
    }

    Widget infoPoint(){
      return Container(
        margin: EdgeInsets.all(defaultMargin),
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: const LinearGradient(colors: [
            Color(0xff6E5DE7),Color(0xff7A67FF)
          ])
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Jumlah Semua Point",
              style: whiteTextStyle.copyWith(
                fontWeight: bold,
                fontSize: 25
              ),
            ),
            const SizedBox(height: 10,),
            Text(
              "50",
              style: whiteTextStyle.copyWith(
                fontWeight: bold,
                fontSize: 25
              ),
            ),
            const SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                tailInfo("Prestasi", 50, const Color.fromARGB(255, 7, 189, 61)),
                tailInfo("Hukuman", 50, const Color.fromARGB(255, 7, 189, 61)),
                tailInfo("Pelanggaran", -50, const Color.fromARGB(255, 149, 6, 13)),
              ],
            )
          ],
        ),
      );
    }

    Widget menu()
    {
      return Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(20),
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
        child: GridView(
          padding: const EdgeInsets.only(top: 10,bottom: 10 ),
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: 0.78,
          ),
          shrinkWrap: true,
          children: [
            FiturButtom(
              nama: "Info", 
              onPressed: (){
                Navigator.pushNamed(context, 'tatatertib-sekolah');
              }, 
              img: 'assets/ic_info2.png'
            ),
            FiturButtom(
              nama: "Catatan", 
              onPressed: (){
                Navigator.pushNamed(context, 'catatan-siswa');
              }, 
              img: 'assets/ic_catatan.png'
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: background4Color,
      body: SafeArea(
        child: Column(
          children: [
            AppBarButtom(nama: 'Catatan & Aturan'),
            infoPoint(),
            menu()
          ],
        )
      ),
    );
  }
}