import 'package:fe_info_siswa/models/siswa_model.dart';
import 'package:fe_info_siswa/pages/splash_page.dart';
import 'package:fe_info_siswa/provider/auth_provider.dart';
import 'package:fe_info_siswa/provider/siswa2_provider.dart';
import 'package:fe_info_siswa/share/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    SiswaModel siswa = siswaProvider.siswa2;
    String gendre;

    handleSingUp() async {
      await authProvider.logout(
        nis: nis.toString(),
        token: token!,
      );
      Navigator.pushAndRemoveUntil(
        context, 
        MaterialPageRoute(
          builder: (context) => SplashPage(),
        ), 
        ModalRoute.withName('/'));
    }
    
    if (siswa.kelamin.toString() == 'l') {
      gendre = 'male';
    } else if(siswa.kelamin.toString() == 'p'){
      gendre = 'famale';
    } else{
      gendre = 'other';
    }

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
                const SizedBox(width: 16,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        siswa.nama.toString(),
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
                      ),
                      Text(
                        'Class : '+siswa.kelas!.kelas.toString(),
                        style: subTextStyle.copyWith(
                          fontSize: 16
                        ),
                      )
                    ],
                  )
                ),
                GestureDetector(
                  onTap: handleSingUp,
                  child: Image.asset('assets/Exit_Button.png',width: 20,)
                )
              ],
            ),
          )
        ),
      );
    }

    Widget menuItem(String text,String text2){
      return Container(
        margin: const EdgeInsets.only(top: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text, style: secondTextStyle.copyWith(fontSize: 13),),
            Text(text2, style: secondTextStyle.copyWith(fontSize: 13),textAlign: TextAlign.justify,),
          ],
        ),
      );
    }

    Widget personalBio(){
      return Container(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          margin: const EdgeInsets.all(10),
          width: double.infinity,
          decoration: BoxDecoration(
            color: backgroundColor3,
            borderRadius: BorderRadius.circular(15)
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20,),
              Text(
                'Personal Biodata',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semibold
                ),
              ),
              menuItem('Full Name', siswa.nama.toString()),
              menuItem('Nickname', siswa.panggilan.toString()),
              menuItem('Gendre', gendre),
              menuItem('Place of Birt', siswa.tmplahir.toString()),
              menuItem('Date of Birt', siswa.tgllahir.toString()),
              menuItem('Relegion', siswa.agama.toString()),
              menuItem('Daily Language', 'INDONESIA'),
              const SizedBox(height: 20,)
            ],
          ),

        );
    }

    Widget contactInfo(){
      return Container(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          margin: const EdgeInsets.all(10),
          width: double.infinity,
          decoration: BoxDecoration(
            color: backgroundColor3,
            borderRadius: BorderRadius.circular(15)
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20,),
              Text(
                'Contact Information',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semibold
                ),
              ),
              menuItem('Address :', ''),
              Text(
                siswa.alamatsiswa.toString(),
                style: secondTextStyle.copyWith(
                  fontSize: 13
                ),
                textAlign: TextAlign.justify,
              ),
              menuItem('Phone Number', siswa.hpsiswa.toString()),
              menuItem('E-mail', siswa.emailsiswa.toString()),
              const SizedBox(height: 20,)
            ],
          ),

        );
    }

    Widget healthInfo(){
      return Container(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          margin: const EdgeInsets.all(10),
          width: double.infinity,
          decoration: BoxDecoration(
            color: backgroundColor3,
            borderRadius: BorderRadius.circular(15)
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20,),
              Text(
                'Health Information',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semibold
                ),
              ),
              menuItem('Weight', siswa.berat.toString()),
              menuItem('Height', siswa.tinggi.toString()),
              menuItem('Blood Type', siswa.darah.toString()),
              const SizedBox(height: 20,)
            ],
          ),

        );
    }

    Widget schoolInfo(){
      return Container(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          margin: const EdgeInsets.all(10),
          width: double.infinity,
          decoration: BoxDecoration(
            color: backgroundColor3,
            borderRadius: BorderRadius.circular(15)
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20,),
              Text(
                'School Information',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semibold
                ),
              ),
              menuItem('Junior Height School :', ''),
              Text(
                siswa.asalsekolah.toString(),
                style: secondTextStyle.copyWith(
                  fontSize: 13
                ),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 20,)
            ],
          ),

        );
    }

    Widget fatherInfo(){
      return Container(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          margin: const EdgeInsets.all(10),
          width: double.infinity,
          decoration: BoxDecoration(
            color: backgroundColor3,
            borderRadius: BorderRadius.circular(15)
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20,),
              Text(
                'Father Biodata',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semibold
                ),
              ),
              menuItem('Name', siswa.namaayah.toString()),
              menuItem('Education', siswa.pendidikanayah.toString()),
              menuItem(
                'Job',
                NumberFormat.currency(
                  locale: 'id_ID',
                  symbol: 'Rp ',
                  decimalDigits: 0,
                ).format(int.parse(siswa.penghasilanayah.toString()))
              
              ),
              const SizedBox(height: 20,)
            ],
          ),

        );
    }

    Widget motherInfo(){
      return Container(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          margin: const EdgeInsets.all(10),
          width: double.infinity,
          decoration: BoxDecoration(
            color: backgroundColor3,
            borderRadius: BorderRadius.circular(15)
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20,),
              Text(
                'Mother Biodata',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semibold
                ),
              ),
              menuItem('Name', siswa.namaibu.toString()),
              menuItem('Education', siswa.pendidikanibu.toString()),
              menuItem(
                'Job',
                NumberFormat.currency(
                  locale: 'id_ID',
                  symbol: 'Rp ',
                  decimalDigits: 0,
                ).format(int.parse(siswa.penghasilanibu.toString()))
              ),
              const SizedBox(height: 20,)
            ],
          ),

        );
    }

    Widget contactParentInfo(){
      return Container(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          margin: const EdgeInsets.all(10),
          width: double.infinity,
          decoration: BoxDecoration(
            color: backgroundColor3,
            borderRadius: BorderRadius.circular(15)
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20,),
              Text(
                'Contact Parent Information',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semibold
                ),
              ),
              menuItem('Address :', ''),
              Text(
                siswa.alamatortu.toString(),
                style: secondTextStyle.copyWith(
                  fontSize: 13
                ),
                textAlign: TextAlign.justify,
              ),
              menuItem('Phone Number', siswa.hportu.toString()),
              menuItem('E-mail', siswa.emailayah.toString()),
              const SizedBox(height: 20,)
            ],
          ),

        );
    }

    Widget otherInfo(){
      return Container(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          margin: const EdgeInsets.all(10),
          width: double.infinity,
          decoration: BoxDecoration(
            color: backgroundColor3,
            borderRadius: BorderRadius.circular(15)
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20,),
              Text(
                'Other Information',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semibold
                ),
              ),
              menuItem('NIK', siswa.nik.toString()),
              menuItem('Hobby', siswa.hobi.toString()),
              const SizedBox(height: 20,)
            ],
          ),

        );
    }

    Widget personalEduBio(){
      return Container(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          margin: const EdgeInsets.all(10),
          width: double.infinity,
          decoration: BoxDecoration(
            color: backgroundColor3,
            borderRadius: BorderRadius.circular(15)
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20,),
              Text(
                'Personal Education Information',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semibold
                ),
              ),
              menuItem('NISN', siswa.nisn.toString()),
              menuItem('Date Certificate SMP', siswa.tglijasah.toString()),
              menuItem('Number Certificate SMP', siswa.noijasah.toString()),
              const SizedBox(height: 20,)
            ],
          ),

        );
    }
    

    return ListView(
      children: [
        header(),
        personalBio(),
        personalEduBio(),
        contactInfo(),
        healthInfo(),
        schoolInfo(),
        fatherInfo(),
        motherInfo(),
        contactParentInfo(),
        otherInfo()
      ],
    );
  }
}