import 'package:fe_info_siswa/pages/home/CttDanAturan/catatan_siswa_page.dart';
import 'package:fe_info_siswa/pages/home/CttDanAturan/info_page.dart';
import 'package:fe_info_siswa/pages/home/CttDanAturan/menu_ctt_aturan.dart';
import 'package:fe_info_siswa/pages/home/absen/absen_pelajaran_siswa_page.dart';
import 'package:fe_info_siswa/pages/home/absen/list_mapel_absen_pelajaran_page.dart';
import 'package:fe_info_siswa/pages/home/absen/menu_absen_page.dart';
import 'package:fe_info_siswa/pages/home/ambilAbsen/ambil_absen_page.dart';
import 'package:fe_info_siswa/pages/home/home_page.dart';
import 'package:fe_info_siswa/pages/home/absen/absensi_harian_siswa_page.dart';
import 'package:fe_info_siswa/pages/home/nilai/menu_nilai.dart';
import 'package:fe_info_siswa/pages/home/nilai/nilaiHarian/list_nilai_harian_page.dart';
import 'package:fe_info_siswa/pages/home/nilai/nilaiRapor/list_nilai_rapor_page.dart';
import 'package:fe_info_siswa/pages/home/nilai/nilaiRapor/nilai_pancasila_rapor_page.dart';
import 'package:fe_info_siswa/pages/home/nilai/nilaiRapor/nilai_umum_page.dart';
import 'package:fe_info_siswa/pages/home/profile/profile_page.dart';
import 'package:fe_info_siswa/pages/sign_in.dart';
import 'package:fe_info_siswa/pages/splash_page.dart';
import 'package:fe_info_siswa/pages/home/spp/spp_page.dart';
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
          // '/' :(context) => (SpUtil.getInt('a') == 1 ? HomePage() : SplashPage()),
          '/' :(context) => const SplashPage(),
          '/sign-in' :(context) => Sign_In(),
          '/home' :(context) => const HomePage(),

          //? Profile
          '/profile' :(context) => const ProfilePage(),

          //? Spp
          '/spp' :(context) => const SppPage(),

          //? Nilai 
          '/nilai' :(context) => const ListNilaiRaporPage(),
            //? Nilai Rapor
            '/menu-nilai' :(context) => const MenuNilaiPage(),
            '/nilai-rapor-umum' :(context) => const NilaiUmumPage(),
            '/nilai-rapor-pancasila' :(context) => const NilaiPancasilaRaporPage(),
            //? Nilai Harian
            '/nilai-harian' :(context) => const ListNilaiHarianPage(),
            // '/nilai-harian' :(context) => NilaiHarianPage(),
          
          //? Absen
          '/absen' :(context) => const MenuAbsenPage(),
          '/absen-harian' :(context) => const AbsenHarianSiswaPage(),
          '/absen-pelajaran' :(context) => const AbsenPelajaranSiswaPage(),
          '/absen-mapel' :(context) => const ListMapelAbsenPelajaranPage(),

          //? Catatan dan Aturan
          'menu-ctt-aturan' :(context) => const MenuCttAturan(),
          'tatatertib-sekolah' :(context) => const InfoPage(),
          'catatan-siswa' :(context) => const CatatanSiswaPage(),

          //? Ambil Absen
          '/ambil-absen' :(context) => const AmbilAbsenPage()
          // '/siswa': (context) => SiswaPage(),
        },
      ),
    );
  }
}
