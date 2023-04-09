// ignore_for_file: use_key_in_widget_constructors

import 'package:fe_info_siswa/pages/home/home_page.dart';
import 'package:fe_info_siswa/provider/auth_provider.dart';
import 'package:fe_info_siswa/share/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: camel_case_types
class Sign_In extends StatefulWidget {
  @override
  State<Sign_In> createState() => _Sign_InState();
}

// ignore: camel_case_types
class _Sign_InState extends State<Sign_In> {
  // const Sign_In({super.key});
  TextEditingController nisController = TextEditingController(text: '');

  TextEditingController passwordController = TextEditingController(text: '');

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {

    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleSignIn() async{

      setState(() {
        isLoading = true;
      });

      if(
        await authProvider.login( 
          nis: nisController.text, 
          pinsiswa: passwordController.text
        )
        ){
          // UserModel user = authProvider.user;
          // String a = user.api_token!;
          // String? token = SpUtil.getString('token');
          // await Provider.of<SiswaProvider>(context, listen: false).getsiswa(token!);
          // ignore: use_build_context_synchronously
          Navigator.pushAndRemoveUntil(
            context, 
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ), 
            ModalRoute.withName('/home')
          );
          // print(a);
        }else{
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: alertColor,
              content: const Text(
                "Gagal Login",
                textAlign: TextAlign.center,
              )
            )
          );
        }

        setState(() {
          isLoading = false;
        });
    }

    Widget header() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Login',
              style: blackTextStyle.copyWith(
                fontWeight: semibold,
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              'Login untuk menlanjutkan',
              style: subTextStyle.copyWith(fontWeight: regular, fontSize: 14),
            )
          ],
        ),
      );
    }

    Widget emailInput() {
      return Container(
        margin: const EdgeInsets.only(top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'NISN',
              style:
                  blackTextStyle.copyWith(fontWeight: medium, fontSize: 16),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                    color: background4Color,
                    borderRadius: BorderRadius.circular(12)),
                child: Center(
                  child: Row(
                    children: [
                      const Icon(
                        Icons.person,
                        color: Colors.blue,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: TextFormField(
                          style: blackTextStyle,
                          controller: nisController,
                          decoration: InputDecoration.collapsed(
                            hintText: 'NISN Kamu',
                            hintStyle: secondTextStyle,
                          ),
                        )
                      )
                    ],
                  ),
                )
              )
          ],
        ),
      );
    }

    Widget passwordInput() {
      return Container(
        margin: const EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Password or PIN',
              style:
                  blackTextStyle.copyWith(fontWeight: medium, fontSize: 16),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                    color: background4Color,
                    borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: Row(
                        children: [
                          const Icon(
                            Icons.key,
                            color: Colors.blue,
                          ),
                          const SizedBox(width: 15,),
                          Expanded(
                            child: TextFormField(
                              obscureText: true,
                              style: blackTextStyle,
                              controller: passwordController,
                              decoration: InputDecoration.collapsed(
                                hintText: 'Password atau PIN kamu',
                                hintStyle: secondTextStyle,
                              ),
                            )
                          )
                        ],
                      ),
                    )
            )
          ],
        ),
      );
    }

    Widget buttom() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: const EdgeInsets.only(top: 30),
        child: TextButton(
            style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
            onPressed: handleSignIn,
            child: Text(
              'Sign In',
              style:
                  primaryTextStyle.copyWith(fontWeight: medium, fontSize: 16),
            )),
      );
    }

    Widget logo(){
      return Center(
        child: Container(
          margin: EdgeInsets.only(top: 40),
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/logo.png'))
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView(
                  children: [
                    // header(),
                    logo(),
                    emailInput(),
                    passwordInput(),
                    buttom(),
                  ],
                )
              ),
              // const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}