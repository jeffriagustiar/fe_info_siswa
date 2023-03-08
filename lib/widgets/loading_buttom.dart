import 'package:fe_info_siswa/share/theme.dart';
import 'package:flutter/material.dart';

class LoadingButtom extends StatelessWidget {
  const LoadingButtom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        width: double.infinity,
        margin: const EdgeInsets.only(top: 30),
        child: TextButton(
            style: TextButton.styleFrom(
                backgroundColor: primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
            onPressed: (){},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ignore: sized_box_for_whitespace
                Container(width: 16,height: 16, child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation(
                    primaryTextColor
                  ),
                )),
                const SizedBox(width: 4,),
                Text(
                  'Loading',
                  style:
                      primaryTextStyle.copyWith(fontWeight: medium, fontSize: 16),
                ),
              ],
            )),
      );
  }
}