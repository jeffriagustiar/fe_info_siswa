import 'package:fe_info_siswa/share/theme.dart';
import 'package:fe_info_siswa/widgets/appBar_buttom.dart';
import 'package:flutter/material.dart';

class CatatanSiswaPage extends StatelessWidget {
  const CatatanSiswaPage({super.key});

  @override
  Widget build(BuildContext context) {

    Widget catatan(String kategori, String nama, int poin)
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
                color: poin < 0 ? Colors.red : Colors.green
              ),
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
            AppBarButtom(nama: "Catatan Siswa"),

            Expanded(
              child: ListView(
                children: [
                  catatan("ABC","AB2",10),
                  catatan("CBA","2CBA",-10),
                ],
              )
            ),

          ],
        )
      ),
    );
  }
}