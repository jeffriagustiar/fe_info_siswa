import 'package:fe_info_siswa/models/spp_model.dart';
import 'package:fe_info_siswa/pages/home/list_siswa_page.dart';
import 'package:fe_info_siswa/pages/home/profile/profile_page.dart';
import 'package:fe_info_siswa/pages/splash_page.dart';
import 'package:fe_info_siswa/provider/auth_provider.dart';
import 'package:fe_info_siswa/provider/siswa2_provider.dart';
import 'package:fe_info_siswa/provider/siswa_provider.dart';
import 'package:fe_info_siswa/provider/spp_provider.dart';
import 'package:fe_info_siswa/share/theme.dart';
import 'package:fe_info_siswa/widgets/fitur_buttom.dart';
import 'package:fe_info_siswa/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sp_util/sp_util.dart';
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
  String? kelamin = SpUtil.getString('kelamin');

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
    await Provider.of<Siswa2Provider>(context, listen: false).getSiswaByNis(nis!);
    // ignore: use_build_context_synchronously
    await Provider.of<SppProvider>(context, listen: false).getSpp();
    // ignore: use_build_context_synchronously
    await Provider.of<SiswaProvider>(context, listen: false).getsemester();
    // ignore: use_build_context_synchronously
    await Provider.of<SiswaProvider>(context, listen: false).gettahun();
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
      SpUtil.putInt('a', 0);
      SpUtil.putString('token', 'Bearer ');
      // ignore: use_build_context_synchronously
      Navigator.pushAndRemoveUntil(
        context, 
        MaterialPageRoute(
          builder: (context) => const SplashPage(),
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
                  child: kelamin == 'p' ? Image.asset('assets/ic_profile_cewek.gif',width: 64,) : Image.asset('assets/ic_profile_cowok.gif',width: 64,)
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
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
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
            FutureBuilder(
              future: data(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Loading();
                }else if(snapshot.hasError){
                  return Text('Error: ${snapshot.error}');
                }else {
                  return Text(
                    NumberFormat.currency(
                      locale: 'id_ID',
                      symbol: 'Rp ',
                      decimalDigits: 0,
                    ).format(spp.sisa),
                    style: whiteTextStyle.copyWith(
                      fontWeight: semibold,
                      fontSize: 30
                    ),
                  );
                }
              }
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
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: background4Color,
          borderRadius: BorderRadius.circular(15)
        ),
        child: Column(
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FiturButtom(
                  nama: 'Profile', 
                  onPressed: () {
                    Navigator.pushNamed(context, '/profile');
                  },
                  img: kelamin == 'p' ? 'assets/ic_profile_cewek.gif' : 'assets/ic_profile_cowok.gif',
                ),
                FiturButtom(
                  nama: 'SPP', 
                  onPressed: () {
                    Navigator.pushNamed(context, '/spp');
                  },
                  img: 'assets/ic_uang.png',
                ),
                FiturButtom(
                  nama: 'Nilai', 
                  onPressed: () {
                    Navigator.pushNamed(context, '/menu-nilai');
                  },
                  img: 'assets/ic_rapor.png',
                ),
                FiturButtom(
                  nama: 'Presensi', 
                  onPressed: () {
                    Navigator.pushNamed(context, '/absen');
                  },
                  img: 'assets/ic_absen.gif',
                ),
              ],
            ),

            const SizedBox(height: 10,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FiturButtom(
                  nama: 'Logout', 
                  onPressed: handleLogOut, 
                  img: 'assets/ic_logout.png',
                ),
                // FiturButtom(nama: 'coba', onPressed: () {
                //   Navigator.push(context, MaterialPageRoute(builder: (context) => ListSiswaPage(),));
                // },),
              ],
            ),

          ],
        ),
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
            // titileMenu(),
            fitur()
          ],
        ),
      ),
    );
  }
}