import 'package:fe_info_siswa/models/user_model.dart';
import 'package:fe_info_siswa/pages/home/home_page.dart';
import 'package:fe_info_siswa/pages/home/list_siswa_page.dart';
import 'package:fe_info_siswa/pages/home/profile_page.dart';
import 'package:fe_info_siswa/provider/auth_provider.dart';
import 'package:fe_info_siswa/provider/siswa_provider.dart';
import 'package:fe_info_siswa/share/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  

  @override
  Widget build(BuildContext context) {

    Widget customBottomNav(){
      return ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30)
        ),
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 10,
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
            backgroundColor: backgroundColor4,
            currentIndex: currentIndex,
            onTap: (value){
              setState(() {
                currentIndex = value ;
              });
            },
            type: BottomNavigationBarType.fixed,
            items: [
              
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(
                    top: 20,
                    bottom: 5
                  ),
                  child: Image.asset(
                    'assets/Home_icon.png',
                    width: 21,
                    color:  currentIndex == 0 ? primaryColor : Color(0xff808191),
                  ),
                ),
                label: ''
              ),
              
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(
                    top: 20,
                    bottom: 5,
                    // right: 50
                  ),
                  child: Image.asset(
                    'assets/Chat_icon.png',
                    width: 20,
                    color:  currentIndex == 1 ? primaryColor : Color(0xff808191),
                  ),
                ),
                label: ''
              ),
              
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(
                    top: 20,
                    bottom: 5,
                    // left: 50
                  ),
                  child: Image.asset(
                    'assets/Union_icon.png',
                    width: 20,
                    color:  currentIndex == 2 ? primaryColor : Color(0xff808191),
                  ),
                ),
                label: ''
              ),
              
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(
                    top: 20,
                    bottom: 5
                  ),
                  child: Image.asset(
                    'assets/Profile_icon.png',
                    width: 18,
                    color:  currentIndex == 3 ? primaryColor : Color(0xff808191),
                  ),
                ),
                label: ''
              ),
              
            ]
          ),
        ),
      );
    }

    Widget body(){
      switch (currentIndex) {
        case 0:
          return const HomePage();
          break;
        case 1:
          return ListSiswaPage();
          break;
        case 2:
          return ProfilePage();
          break;
        case 3:
          return const ProfilePage();
          break;
        default: 
        return const HomePage();
      }
    }

    return Scaffold(
      backgroundColor: currentIndex == 0 ? backgroundColor1: backgroundColor2,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: customBottomNav(),
      body: body()
    );
  }
}