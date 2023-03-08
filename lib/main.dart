import 'package:fe_info_siswa/pages/home/main_page.dart';
import 'package:fe_info_siswa/pages/sign_in.dart';
import 'package:fe_info_siswa/pages/siswa_page.dart';
import 'package:fe_info_siswa/pages/splash_page.dart';
import 'package:fe_info_siswa/provider/auth_provider.dart';
import 'package:fe_info_siswa/provider/siswa_provider.dart';
import 'package:fe_info_siswa/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
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
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          // '/' :(context) => MainPage(),
          '/' :(context) => SplashPage(),
          '/sign-in' :(context) => Sign_In(),
          '/home' :(context) => MainPage(),
          // '/siswa': (context) => SiswaPage(),
        },
      ),
    );
  }
}
