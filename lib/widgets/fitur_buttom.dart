import 'package:fe_info_siswa/share/theme.dart';
import 'package:flutter/material.dart';

class FiturButtom extends StatelessWidget {
  final String nama;
  final Function() onPressed;
  final String img;
  
  FiturButtom({required this.nama, required this.onPressed, required this.img});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        child: Column(
          children: [
            Container(
              height: 50,
              width: 50,
              margin: EdgeInsets.only(bottom: 12,),
              decoration: BoxDecoration(
                color: background3Color,
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(image: AssetImage(img))
              ),
            ),
            Text(
              nama,
              style: secondTextStyle.copyWith(
                fontSize: 12,
                fontWeight: regular
              ),
            )
          ],
        ),
      ),
    );
  }
}