import 'package:fe_info_siswa/models/presen_siswa_model.dart';
import 'package:fe_info_siswa/models/siswa_model.dart';
import 'package:fe_info_siswa/pages/siswa_page.dart';
import 'package:fe_info_siswa/share/theme.dart';
import 'package:flutter/material.dart';

class PresenSiswaTile extends StatelessWidget {
  final PresensionSiswaModel presen;

  PresenSiswaTile(this.presen);

  @override
  Widget build(BuildContext context) {
  final Color color;
  final String text;
    
      // color = Color.fromARGB(255, 8, 105, 29);
    if (presen.alpa == 1) {
      color = Color.fromARGB(255, 101, 11, 4);
      text = "Without Explanation";
    } else if(presen.ijin == 1){
      color = Color.fromARGB(255, 156, 168, 28);
      text = "Permission";
    }else if(presen.hadir == 1){
      color = Color.fromARGB(255, 15, 132, 29);
      text = "Present";
    }else if(presen.sakit == 1){
      color = Color.fromARGB(255, 74, 15, 132);
      text = "Sick";
    }else{
      color = backgroundColor3;
      text = "Paid Leave";
    }

    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 10),
      padding: EdgeInsets.all(15),
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            presen.ts.toString(),
            style: primaryTextStyle.copyWith(
              fontSize: 18,
              fontWeight: semibold
            ),
          ),
          SizedBox(height: 10,),
          Container(
            // padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  // rapor.nilaiangka.toString(),
                  text,
                  style: primaryTextStyle.copyWith(
                    fontSize: 30,
                    fontWeight: bold
                  ),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
          SizedBox(height: 5,),
          
          Text(
            presen.keterangan.toString(),
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