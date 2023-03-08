import 'package:fe_info_siswa/share/theme.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {

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
                        'Hallo, Alex',
                        style: primaryTextStyle.copyWith(
                          fontSize: 24,
                          fontWeight: semibold
                        ),
                      ),
                      Text(
                        '@alexkeinn',
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