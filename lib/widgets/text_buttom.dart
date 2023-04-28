import 'package:fe_info_siswa/share/theme.dart';
import 'package:flutter/material.dart';

class TextButtomSendiri extends StatelessWidget {
  final String nama;
  final double lebar;
  TextButtomSendiri({super.key, required this.nama, required this.lebar});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        width: lebar,
        margin: const EdgeInsets.only(top: 10),
        child: TextButton(
            style: TextButton.styleFrom(
                backgroundColor: Colors.blue.shade200,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
            onPressed: (){},
            child: Text(
              nama,
              style:
                  blackTextStyle.copyWith(fontWeight: semibold, fontSize: 20),
            )),
      );
  }
}