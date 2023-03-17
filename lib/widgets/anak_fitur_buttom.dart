import 'package:fe_info_siswa/share/theme.dart';
import 'package:flutter/material.dart';

class AnakFiturButtom extends StatelessWidget {
  final String nama;
  final String desc;
  final Function() onPressed;

  AnakFiturButtom({required this.nama, required this.desc, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(20),
        height: 250,
        width: 150,
        decoration: BoxDecoration(
          color: background3Color,
          borderRadius: BorderRadius.circular(15)
        ),
        child: Column(
          children: [
            Text(
              nama,
              style: blackTextStyle.copyWith(
                fontSize: 18,
                fontWeight: bold
              ),
            ),
            const SizedBox(height: 10,),
            Text(
              desc,
              style: blackTextStyle.copyWith(
                fontSize: 14,
                fontWeight: regular
              ),
              textAlign: TextAlign.justify,
            )
          ],
        ),
      ),
    );
  }
}