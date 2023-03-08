import 'package:fe_info_siswa/pages/home/main_page.dart';
import 'package:fe_info_siswa/pages/sign_in.dart';
import 'package:fe_info_siswa/pages/siswa_page.dart';
import 'package:fe_info_siswa/pages/splash_page.dart';
import 'package:fe_info_siswa/provider/auth_provider.dart';
import 'package:fe_info_siswa/provider/siswa2_provider.dart';
import 'package:fe_info_siswa/provider/siswa_provider.dart';
import 'package:fe_info_siswa/services/auth_service.dart';
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
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // initialRoute: '/',
        routes: {
          // '/' :(context) => MainPage(),
          // '/' :(context) => SplashPage(),
          '/' :(context) => (SpUtil.getInt('a') == 1 ? MainPage() : SplashPage()),
          '/sign-in' :(context) => Sign_In(),
          '/home' :(context) => MainPage(),
          // '/siswa': (context) => SiswaPage(),
        },
      ),
    );
  }
}
