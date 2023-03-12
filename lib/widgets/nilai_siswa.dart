import 'package:fe_info_siswa/models/rapor_siswa_model.dart';
import 'package:fe_info_siswa/share/theme.dart';
import 'package:flutter/material.dart';

class NilaiSiswa extends StatelessWidget {
  final RaporSiswaModel rapor;
  NilaiSiswa(this.rapor);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 20),
      padding: EdgeInsets.all(15),
      width: double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor3,
        borderRadius: BorderRadius.circular(15)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            rapor.nama.toString(),
            style: primaryTextStyle.copyWith(
              fontSize: 18,
              fontWeight: semibold
            ),
          ),
          SizedBox(height: 10,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 70),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  rapor.nilaiangka.toString(),
                  style: primaryTextStyle.copyWith(
                    fontSize: 30,
                    fontWeight: bold
                  ),
                ),
                Text(
                  rapor.nilaihuruf.toString(),
                  style: primaryTextStyle.copyWith(
                    fontSize: 30,
                    fontWeight: bold
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 5,),
          Text(
            "Scoring Type : ${rapor.dasarpenilaian}",
            style: primaryTextStyle.copyWith(
              fontSize: 14,
              fontWeight: medium
            ),
          ),
          Text(
            "Comment : \n${rapor.komentar}",
            style: primaryTextStyle.copyWith(
              fontSize: 14,
              fontWeight: medium
            ),
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: 5,),
        ],
      ),
    );
  }
}