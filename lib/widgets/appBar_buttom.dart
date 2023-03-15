import 'package:fe_info_siswa/share/theme.dart';
import 'package:flutter/material.dart';

class AppBarButtom extends StatelessWidget {
  final String nama;

  AppBarButtom({required this.nama});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 15, right: 15),
      color: backgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            // ignore: sized_box_for_whitespace
            child: Container(
              height: 40,
              width: 40,
              child: const Icon(
                Icons.chevron_left
              ),
            )
          ),
          Text(
            nama,
            style: blackTextStyle.copyWith(
              fontWeight: bold,
              fontSize: 18
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/home');
            },
            // ignore: sized_box_for_whitespace
            child: Container(
              width: 40,
              height: 40,
              child: Icon(Icons.home,color: backgroundColor1,)
            ),
          )
        ],
      ),
    );
  }
}