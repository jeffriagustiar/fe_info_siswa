import 'package:fe_info_siswa/models/user_model.dart';
import 'package:fe_info_siswa/provider/auth_provider.dart';
import 'package:fe_info_siswa/provider/siswa_provider.dart';
import 'package:fe_info_siswa/share/theme.dart';
import 'package:fe_info_siswa/widgets/loading_buttom.dart';
import 'package:fe_info_siswa/widgets/siswa_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() { 
    getInit();
    super.initState();
  }

  getInit() async{
    
  }
  
  @override
  Widget build(BuildContext context) {

    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;

    SiswaProvider siswaProvider = Provider.of<SiswaProvider>(context);


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
                    'Hello, ${user.nama}',
                    style: primaryTextStyle.copyWith(
                      fontSize: 24,
                      fontWeight: semibold
                    ),
                  ),
                  Text(
                    '${user.panggilan}',style: subTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  )
                ],
              ),
            ),

            Spacer(),

            Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: AssetImage('assets/profile_image.png'))
              ),
            )

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
          'List Students',
          style: primaryTextStyle.copyWith(
            fontSize: 22,
            fontWeight: semibold
          ),
        ),
      );
    }

    Widget newArrivals(){
      return Container(
        margin: EdgeInsets.only(
          top: 14,
        ),
        child: Column(
          children: siswaProvider.siswa.map((siswa) => SiswaTile(siswa)).toList(),
        ),
      );
    }

    return ListView(
      children: [
        header(),
        newArrivalsTitle(),
        newArrivals()
      ],
    );
  }
}