import 'package:fe_info_siswa/share/theme.dart';
import 'package:flutter/material.dart';

class InfoPilih extends StatelessWidget {
  final String textInfo;
  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  InfoPilih({required this.textInfo});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/ic_info.png'),
        Padding(
          padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
          child: Text(textInfo,style: blackTextStyle.copyWith(fontSize: 15, fontWeight: bold),textAlign: TextAlign.justify,),
        )
      ],
    );
  }
}