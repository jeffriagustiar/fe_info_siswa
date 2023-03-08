import 'package:fe_info_siswa/models/spp_model.dart';
import 'package:fe_info_siswa/provider/siswa2_provider.dart';
import 'package:fe_info_siswa/provider/spp_provider.dart';
import 'package:fe_info_siswa/share/theme.dart';
import 'package:fe_info_siswa/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sp_util/sp_util.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String? token = SpUtil.getString('token');
  int? angka = SpUtil.getInt('a');
  int? nis = SpUtil.getInt('nis');

  // ignore: unused_field
  bool _isRefreshing = false;

  Future<void> getInit() async{
    setState(() {
      _isRefreshing = true;
    });
    data();
    setState(() {
      _isRefreshing = false;
    });
  }

  data() async{
    await Provider.of<Siswa2Provider>(context, listen: false).getSiswaByNis(token!, nis!);
    // ignore: use_build_context_synchronously
    await Provider.of<SppProvider>(context, listen: false).getSpp(token!);
  }
  
  @override
  Widget build(BuildContext context) {

    // AuthProvider authProvider = Provider.of<AuthProvider>(context);
    // UserModel user = authProvider.user;

    // SiswaProvider siswaProvider = Provider.of<SiswaProvider>(context);

    SppProvider sppProvider = Provider.of<SppProvider>(context);
    SppModel spp = sppProvider.spp;


    Widget header(){
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin
        ),

        child: Row(
          children: [

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    // 'Hello, ${user.nama}',
                    SpUtil.getString('nama')!,
                    style: primaryTextStyle.copyWith(
                      fontSize: 24,
                      fontWeight: semibold
                    ),
                  ),
                  Text(
                    // '${user.panggilan}  '+
                    "Nis : "+SpUtil.getInt('nis').toString(),style: subTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  )
                ],
              ),
            ),

          ],
        ),

      );
    }

    
    Widget newArrivalsTitle(){
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          right: defaultMargin,
          left: defaultMargin
        ),
        child: Text(
          'Info Students',
          style: primaryTextStyle.copyWith(
            fontSize: 22,
            fontWeight: semibold
          ),
        ),
      );
    }

    Widget callData(){
      return FutureBuilder(
        future: data(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Loading();
          }else if(snapshot.hasError){
            return Text('Error: ${snapshot.error}');
          }else {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              padding: EdgeInsets.all(15),
              width: double.infinity,
              decoration: BoxDecoration(
                color: backgroundColor3,
                borderRadius: BorderRadius.circular(15)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Information SPP",
                    style: primaryTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semibold
                    ),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Paid : ${
                          NumberFormat.currency(
                            locale: 'id_ID',
                            symbol: 'Rp ',
                            decimalDigits: 0,
                          ).format(int.parse(spp.dibayar!))
                        }",
                        style: primaryTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: medium
                        ),
                      ),

                      Text(
                        "UnPaid : ${
                          NumberFormat.currency(
                            locale: 'id_ID',
                            symbol: 'Rp ',
                            decimalDigits: 0,
                          ).format(spp.sisa)
                        }",
                        style: primaryTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: medium
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5,),
                  Text(
                        "Persentasion Paid",
                        style: primaryTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: medium
                        ),
                      ),
                  SizedBox(height: 5,),
                  new LinearPercentIndicator(
                      width: MediaQuery.of(context).size.width - 90,
                      animation: true,
                      lineHeight: 20.0,
                      animationDuration: 2000,
                      percent: double.parse(spp.persen!),
                      center: Text("${spp.persen2}%"),
                      linearStrokeCap: LinearStrokeCap.roundAll,
                      progressColor: primaryColor,
                    ),
                ],
              ),
            );
          }
        },
      );
    }

    return RefreshIndicator(
      onRefresh: getInit,
      child: ListView(
        children: [
          header(),
          newArrivalsTitle(),
          SizedBox(height: 20,),
          callData(),
          // test()
        ],
      ),
    );
  }
}