import 'package:fe_info_siswa/pages/home/absen/menu_absen_page.dart';
import 'package:fe_info_siswa/pages/home/home_page.dart';
import 'package:fe_info_siswa/pages/home/absen/absensi_harian_siswa_page.dart';
import 'package:fe_info_siswa/pages/home/nilai/list_nilai_rapor_page.dart';
import 'package:fe_info_siswa/pages/home/nilai/menu_nilai.dart';
import 'package:fe_info_siswa/pages/home/nilai/menu_nilai_harian.dart';
import 'package:fe_info_siswa/pages/home/nilai/menu_nilai_rapor.dart';
import 'package:fe_info_siswa/pages/home/nilai/nilai_harian_page.dart';
import 'package:fe_info_siswa/pages/home/nilai/nilai_umum_page.dart';
import 'package:fe_info_siswa/pages/home/profile_page.dart';
import 'package:fe_info_siswa/pages/sign_in.dart';
import 'package:fe_info_siswa/pages/splash_page.dart';
import 'package:fe_info_siswa/pages/spp_page.dart';
import 'package:fe_info_siswa/provider/auth_provider.dart';
import 'package:fe_info_siswa/provider/siswa2_provider.dart';
import 'package:fe_info_siswa/provider/siswa_provider.dart';
import 'package:fe_info_siswa/provider/spp_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sp_util/sp_util.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SpUtil.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SiswaProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => Siswa2Provider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SppProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // initialRoute: '/',
        routes: {
          // '/' :(context) => MainPage(),
          // '/' :(context) => SplashPage(),
          '/' :(context) => (SpUtil.getInt('a') == 1 ? HomePage() : SplashPage()),
          // '/' :(context) => SplashPage(),
          '/sign-in' :(context) => Sign_In(),
          '/home' :(context) => HomePage(),
          '/profile' :(context) => ProfilePage(),
          '/nilai' :(context) => ListNilaiRaporPage(),
          '/absen' :(context) => MenuAbsenPage(),
          '/absen-harian' :(context) => AbsenHarianSiswaPage(),
          '/spp' :(context) => SppPage(),
          '/menu-nilai' :(context) => MenuNilaiPage(),
          '/menu-nilai-rapor' :(context) => MenuNilaiRaporPage(),
          '/nilai-rapor-umum' :(context) => NilaiUmumPage(),
          '/menu-nilai-harian' :(context) => MenuNilaiHarianPage(),
          '/nilai-harian' :(context) => NilaiHarianPage()
          // '/siswa': (context) => SiswaPage(),
        },
      ),
    );
  }
}
