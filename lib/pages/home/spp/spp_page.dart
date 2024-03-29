import 'package:fe_info_siswa/provider/siswa_provider.dart';
import 'package:fe_info_siswa/widgets/appBar_buttom.dart';
import 'package:fe_info_siswa/widgets/loading.dart';
import 'package:fe_info_siswa/widgets/spp_tile.dart';
import 'package:flutter/material.dart';
import 'package:fe_info_siswa/share/theme.dart';
import 'package:provider/provider.dart';

class SppPage extends StatefulWidget {
  const SppPage({super.key});

  @override
  State<SppPage> createState() => _SppPageState();
}

class _SppPageState extends State<SppPage> {

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
    await Provider.of<SiswaProvider>(context, listen: false).getSppDetail();
  }

  @override
  Widget build(BuildContext context) {
    
    SiswaProvider siswaProvider = Provider.of<SiswaProvider>(context);

    Widget content(){
      return FutureBuilder(
        future: data(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
              return Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const SizedBox(height: 10,),
                  const Loading(),
                ],
              );
            } else {
              return Column(
            children: siswaProvider.spp.map((spp) => SppTile(spp)).toList(),
            );
            }
        },
      );
    }
    
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: getInit,
          child: Column(
            children: [
              AppBarButtom(nama: 'Informasi Pembayaran SPP'),
              Expanded(
                child: ListView(
                  children: [
                    content(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}