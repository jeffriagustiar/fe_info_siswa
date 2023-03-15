import 'package:fe_info_siswa/models/spp_model.dart';
import 'package:fe_info_siswa/pages/home/profile_page.dart';
import 'package:fe_info_siswa/pages/splash_page.dart';
import 'package:fe_info_siswa/pages/spp_page.dart';
import 'package:fe_info_siswa/provider/auth_provider.dart';
import 'package:fe_info_siswa/provider/siswa2_provider.dart';
import 'package:fe_info_siswa/provider/spp_provider.dart';
import 'package:fe_info_siswa/share/theme.dart';
import 'package:fe_info_siswa/widgets/fitur_buttom.dart';
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
  String? kelas = SpUtil.getString('kelas');
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

    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    // UserModel user = authProvider.user;

    // SiswaProvider siswaProvider = Provider.of<SiswaProvider>(context);

    SppProvider sppProvider = Provider.of<SppProvider>(context);
    SppModel spp = sppProvider.spp;

    handleLogOut() async {
      await authProvider.logout(
        nis: nis.toString(),
        token: token!,
      );
      Navigator.pushAndRemoveUntil(
        context, 
        MaterialPageRoute(
          builder: (context) => SplashPage(),
        ), 
        ModalRoute.withName('/'));
    }


    Widget header(){
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),

        child: Row(
          children: [

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    SpUtil.getString('nama')!,
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semibold
                    ),
                  ),
                  Text(
                    "Welcome",style: greyTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: regular
                    ),
                  ),
                ],
              ),
            ),

            ClipOval(
              child: GestureDetector(
                onTap: (){
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context) => const ProfilePage(),
                    )
                  );
                },
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: Image.asset('assets/profile_image.png',width: 64,)
                )
              ),
            )

          ],
        ),

      );
    }

    Widget infoSpp(){
      return Container(
        margin: EdgeInsets.all(defaultMargin),
        padding: EdgeInsets.all(defaultMargin),
        width: double.infinity,
        // height: 235,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          // color: background2Color,
          gradient: const LinearGradient(colors: [
            Color(0xff6E5DE7),Color(0xff7A67FF)
          ])
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Tunggakan SPP",
              style: whiteTextStyle.copyWith(
                fontWeight: regular,
                fontSize: 14
              ),
            ),
            const SizedBox(height: 15,),
            Text(
              NumberFormat.currency(
                locale: 'id_ID',
                symbol: 'Rp ',
                decimalDigits: 0,
              ).format(spp.sisa),
              style: whiteTextStyle.copyWith(
                fontWeight: semibold,
                fontSize: 30
              ),
            ),
          ],
        ),
      );
    }

    
    Widget titileMenu(){
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          right: defaultMargin,
          left: defaultMargin,
          bottom: 12
        ),
        child: Text(
          'Fitur',
          style: blackTextStyle.copyWith(
            fontSize: 18,
            fontWeight: semibold
          ),
        ),
      );
    }

    Widget fitur(){
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FiturButtom(nama: 'Profile', onPressed: () {
                  Navigator.pushNamed(context, '/profile');
                },),
                FiturButtom(nama: 'SPP', onPressed: () {
                  Navigator.pushNamed(context, '/spp');
                },),
                FiturButtom(nama: 'Nilai', onPressed: () {
                  Navigator.pushNamed(context, '/nilai');
                },),
                FiturButtom(nama: 'Presensi', onPressed: () {
                  Navigator.pushNamed(context, '/absen');
                },),
              ],
            ),

            SizedBox(height: 10,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FiturButtom(nama: 'Logout', onPressed: handleLogOut),
              ],
            ),

          ],
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
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context, MaterialPageRoute(
                    builder: (context) => SppPage(),
                  )
                );
              },
              child: Container(
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
              ),
            );
          }
        },
      );
    }
    

    return Scaffold(
      backgroundColor: backgroundColor,
      body: RefreshIndicator(
        onRefresh: getInit,
        child: ListView(
          children: [
            header(),
            infoSpp(),
            titileMenu(),
            fitur()
          ],
        ),
      ),
    );
  }
}