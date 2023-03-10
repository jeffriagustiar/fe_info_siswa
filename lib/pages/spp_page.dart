import 'package:fe_info_siswa/provider/siswa_provider.dart';
import 'package:fe_info_siswa/widgets/loading.dart';
import 'package:fe_info_siswa/widgets/spp_tile.dart';
import 'package:flutter/material.dart';
import 'package:fe_info_siswa/share/theme.dart';
import 'package:fe_info_siswa/share/theme.dart';
import 'package:provider/provider.dart';
import 'package:sp_util/sp_util.dart';

class SppPage extends StatefulWidget {
  const SppPage({super.key});

  @override
  State<SppPage> createState() => _SppPageState();
}

class _SppPageState extends State<SppPage> {

  String? token = SpUtil.getString('token');

  // ignore: unused_field
  bool _isRefreshing = false;

  Future<void> getInit() async{
    setState(() {
      _isRefreshing = true;
    });
    data();
    setState(() {
      _isRefreshing = false;
    });
  }

  data() async{
    await Provider.of<SiswaProvider>(context, listen: false).getSppDetail(token!);
  }

  @override
  Widget build(BuildContext context) {
    
    SiswaProvider siswaProvider = Provider.of<SiswaProvider>(context);

    Widget header(){
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          right: defaultMargin,
          left: defaultMargin
        ),
        child: Text(
          'Information Paid',
          style: primaryTextStyle.copyWith(
            fontSize: 22,
            fontWeight: semibold
          ),
        ),
      );
    }

    Widget content(){
      return FutureBuilder(
        future: data(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
              return Loading();
            } else {
              return Column(
            children: siswaProvider.spp.map((spp) => SppTile(spp)).toList(),
            );
            }
        },
      );
    }
    
    return Scaffold(
      backgroundColor: backgroundColor1,
      appBar: AppBar(
        backgroundColor: backgroundColor4,
      ),
      body: ListView(
        children: [
          header(),
          content(),
        ],
      ),
    );
  }
}