import 'package:fe_info_siswa/models/siswa_model.dart';
import 'package:fe_info_siswa/pages/siswa_page.dart';
import 'package:fe_info_siswa/share/theme.dart';
import 'package:flutter/material.dart';

class SiswaTile extends StatelessWidget {
  final SiswaModel siswa;

  SiswaTile(this.siswa);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context, 
          MaterialPageRoute(
            builder: (context) => SiswaPage(siswa),
          )
        );
      },
      child: Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          bottom: defaultMargin
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/profile_image.png',
                width: 120,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 12,),
    
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Football',
                    style: secondTextStyle.copyWith(
                      fontSize: 12
                    ),
                  ),
                  SizedBox(height: 6,),
                  Text(
                    siswa.nama!,
                    style: primaryTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semibold
                    ),
                  ),
                  SizedBox(height: 6,),
                  Text(
                    'abc',
                    style: priceTextStyle.copyWith(
                      fontWeight: medium
                    ),
                  )
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}