import 'package:fe_info_siswa/models/siswa_model.dart';
import 'package:fe_info_siswa/provider/siswa2_provider.dart';
import 'package:fe_info_siswa/share/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sp_util/sp_util.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  String? token = SpUtil.getString('token');
  int? nis = SpUtil.getInt('nis');

  @override
  void initState() { 
    getInit();
    super.initState();
  }

  getInit() async{
    
  }

  @override
  Widget build(BuildContext context) {

    Siswa2Provider siswaProvider = Provider.of<Siswa2Provider>(context);
    SiswaModel siswa = siswaProvider.siswa2;

    Widget header(){
      return AppBar(
        backgroundColor: backgroundColor1,
        automaticallyImplyLeading: false,
        elevation: 0,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.all(defaultMargin),
            child: Row(
              children: [
                ClipOval(
                  child: Image.asset('assets/profile_image.png',width: 64,),
                ),
                SizedBox(width: 16,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hallo, ${siswa.nama}',
                        style: primaryTextStyle.copyWith(
                          fontSize: 24,
                          fontWeight: semibold
                        ),
                      ),
                      Text(
                        'NIS : ${siswa.nis}',
                        style: subTextStyle.copyWith(
                          fontSize: 16
                        ),
                      )
                    ],
                  )
                ),
                GestureDetector(
                  onTap: () {
                    // Navigator.pushNamedAndRemoveUntil(context, '/sign-in', (route) => false);
                  },
                  child: Image.asset('assets/Exit_Button.png',width: 20,)
                )
              ],
            ),
          )
        ),
      );
    }

    Widget menuItem(String text){
      return Container(
        margin: EdgeInsets.only(top: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text, style: secondTextStyle.copyWith(fontSize: 13),),
            Icon(Icons.chevron_right, color: primaryTextColor,)
          ],
        ),
      );
    }

    Widget content(){
      return Expanded(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          width: double.infinity,
          decoration: BoxDecoration(
            color: backgroundColor3
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              Text(
                'Account',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semibold
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Navigator.pushNamed(context, '/edit-profile');
                },
                child: menuItem('Edit Profile')
              ),
              menuItem('Your Order'),
              menuItem('Help'),

              SizedBox(height: 30,),
              Text(
                'General',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semibold
                ),
              ),
              menuItem('Privacy & Policy'),
              menuItem('Term of Service'),
              menuItem('Rate App'),
            ],
          ),

        )
      );
    }

    return Column(
      children: [
        header(),
        content()
      ],
    );
  }
}