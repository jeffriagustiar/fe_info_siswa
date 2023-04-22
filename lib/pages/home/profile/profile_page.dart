import 'package:fe_info_siswa/models/siswa_model.dart';
import 'package:fe_info_siswa/provider/auth_provider.dart';
import 'package:fe_info_siswa/provider/siswa2_provider.dart';
import 'package:fe_info_siswa/share/theme.dart';
import 'package:fe_info_siswa/widgets/appBar_buttom.dart';
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

  int? nis = SpUtil.getInt('nis');

  @override
  Widget build(BuildContext context) {

    Siswa2Provider siswaProvider = Provider.of<Siswa2Provider>(context);
    // ignore: unused_local_variable
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    SiswaModel siswa = siswaProvider.siswa2;
    String gendre;
    
    if (siswa.kelamin.toString() == 'l') {
      gendre = 'Laki-laki';
    } else if(siswa.kelamin.toString() == 'p'){
      gendre = 'Perempuan';
    } else{
      gendre = 'other';
    }

    Widget header(){
      return AppBar(
        backgroundColor: backgroundColor,
        automaticallyImplyLeading: false,
        elevation: 0,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.only(left: defaultMargin, right: defaultMargin, bottom: 20),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        siswa.nama.toString(),
                        style: blackTextStyle.copyWith(
                          fontSize: 20,
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
                        // ignore: prefer_interpolation_to_compose_strings
                        'Kelas : '+siswa.kelas!.kelas.toString(),
                        style: subTextStyle.copyWith(
                          fontSize: 16
                        ),
                      )
                    ],
                  )
                ),
                const SizedBox(width: 16,),
                ClipOval(
                  child: siswa.kelamin == 'p' ? Image.asset('assets/ic_profile_cewek.gif',width: 64,) : Image.asset('assets/ic_profile_cowok.gif',width: 64,),
                ),
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
            color: backgroundColor,
            borderRadius: BorderRadius.circular(15)
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20,),
              Text(
                'Biodata Pribadi',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semibold
                ),
              ),
              menuItem('Nama Lengkap', siswa.nama.toString()),
              menuItem('Panggilan', siswa.panggilan.toString()),
              menuItem('Jenis Kelamin', gendre),
              menuItem('Tempat Lahir', siswa.tmplahir.toString()),
              menuItem('Tanggal Lahir', siswa.tgllahir.toString()),
              menuItem('Agama', siswa.agama.toString()),
              menuItem('Bahasa', 'INDONESIA'),
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
            color: backgroundColor,
            borderRadius: BorderRadius.circular(15)
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20,),
              Text(
                'Informasi Kontak',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semibold
                ),
              ),
              menuItem('Alamat :', ''),
              Text(
                siswa.alamatsiswa.toString(),
                style: secondTextStyle.copyWith(
                  fontSize: 13
                ),
                textAlign: TextAlign.justify,
              ),
              menuItem('Handphone', siswa.hpsiswa.toString()),
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
            color: backgroundColor,
            borderRadius: BorderRadius.circular(15)
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20,),
              Text(
                'Informasi Kesehatan',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semibold
                ),
              ),
              // ignore: prefer_interpolation_to_compose_strings
              menuItem('Berat', siswa.berat.toString()+' Kg'),
              // ignore: prefer_interpolation_to_compose_strings
              menuItem('Tinggi', siswa.tinggi.toString()+' Cm'),
              menuItem('Golongan Darah', siswa.darah.toString()),
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
            color: backgroundColor,
            borderRadius: BorderRadius.circular(15)
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20,),
              Text(
                'Informasi Sekolah',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semibold
                ),
              ),
              menuItem('SMP :', ''),
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
            color: backgroundColor,
            borderRadius: BorderRadius.circular(15)
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20,),
              Text(
                'Biodata Ayah',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semibold
                ),
              ),
              menuItem('Nama', siswa.namaayah.toString()),
              menuItem('Pendidikan', siswa.pendidikanayah.toString()),
              menuItem('Pekerjaan', siswa.pekerjaanayah.toString()),
              menuItem(
                'Penghasilan',
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
            color: backgroundColor,
            borderRadius: BorderRadius.circular(15)
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20,),
              Text(
                'Biodata Ibu',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semibold
                ),
              ),
              menuItem('Nama', siswa.namaibu.toString()),
              menuItem('Pendidikan', siswa.pendidikanibu.toString()),
              menuItem('Pekerjaan', siswa.pekerjaanibu.toString()),
              menuItem(
                'Penghasilan',
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
            color: backgroundColor,
            borderRadius: BorderRadius.circular(15)
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20,),
              Text(
                'Kontak Orang Tua',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semibold
                ),
              ),
              menuItem('Alamat :', ''),
              Text(
                siswa.alamatortu.toString(),
                style: secondTextStyle.copyWith(
                  fontSize: 13
                ),
                textAlign: TextAlign.justify,
              ),
              menuItem('Handphone', siswa.hportu.toString()),
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
            color: backgroundColor,
            borderRadius: BorderRadius.circular(15)
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20,),
              Text(
                'Informasi Lainnya',
                style: blackTextStyle.copyWith(
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
            color: backgroundColor,
            borderRadius: BorderRadius.circular(15)
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20,),
              Text(
                'DAPODIK',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semibold
                ),
              ),
              menuItem('NISN', siswa.nisn.toString()),
              menuItem('Tanggal Ijazah SMP', siswa.tglijasah.toString()),
              menuItem('Nomor Ijazah SMP', siswa.noijasah.toString()),
              const SizedBox(height: 20,)
            ],
          ),

        );
    }
    

    return Scaffold(
      backgroundColor: background4Color,
      body: SafeArea(
        child: Column(
          children: [
            AppBarButtom(nama: ''),
            header(),
            Expanded(
              child: ListView(
                children: [
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}