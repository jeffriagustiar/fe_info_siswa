import 'package:fe_info_siswa/models/spp_model.dart';
import 'package:fe_info_siswa/share/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SppTile extends StatelessWidget {
  SppModel spp;
  SppTile(this.spp, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: defaultMargin,right: defaultMargin,top: 20),
        width: double.infinity,
        // height: 10,
        decoration: BoxDecoration(
          color: backgroundColor3,
          borderRadius: BorderRadius.circular(15)
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Amount',
                    style: primaryTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: medium
                    ),
                  ),
                  Text(
                    NumberFormat.currency(
                      locale: 'id_ID',
                      symbol: 'Rp ',
                      decimalDigits: 0,
                    ).format(int.parse(spp.jumlah.toString())),
                    style: priceTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: medium
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Date",
                    style: secondTextStyle.copyWith(
                      fontWeight: medium,
                      fontSize: 15
                    ),
                  ),
                  Text(
                    spp.tanggal.toString(),
                    style: secondTextStyle.copyWith(
                      fontWeight: medium,
                      fontSize: 15
                    )
                  ),
                ],
              ),
              SizedBox(height: 2,),
              Text(
                "Description :",
                style: secondTextStyle.copyWith(
                  fontSize: 15,
                  fontWeight: medium
                ),
              ),
              Text(
                spp.keterangan.toString(),
                style: secondTextStyle.copyWith(
                  fontSize: 15,
                  fontWeight: medium
                ),
                textAlign: TextAlign.justify,
              )
            ],
          ),
        ),
      );
  }
}