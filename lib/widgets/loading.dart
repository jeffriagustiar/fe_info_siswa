import 'package:fe_info_siswa/share/theme.dart';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
            );
  }
}