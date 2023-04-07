import 'package:fe_info_siswa/share/theme.dart';
import 'package:flutter/material.dart';

class AnakFiturButtom extends StatelessWidget {
  final String nama;
  final String desc;
  final Function() onPressed;

  AnakFiturButtom({required this.nama, required this.desc, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        overlayColor: MaterialStateColor.resolveWith((states) => Colors.blue.shade200),
      ),
      child: Container(
        padding: const EdgeInsets.all(15),
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
                fontSize: 16,
                fontWeight: semibold
              ),
            ),
            const SizedBox(height: 10,),
            Text(
              desc,
              style: blackTextStyle.copyWith(
                fontSize: 13,
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