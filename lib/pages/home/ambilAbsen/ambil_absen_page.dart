import 'package:fe_info_siswa/models/ambilAbsen/ambil_koordidat_sekolah_model.dart';
import 'package:fe_info_siswa/provider/siswa2_provider.dart';
import 'package:fe_info_siswa/provider/siswa_provider.dart';
import 'package:fe_info_siswa/services/jarak_absen_service.dart';
import 'package:fe_info_siswa/share/theme.dart';
import 'package:fe_info_siswa/widgets/appBar_buttom.dart';
import 'package:fe_info_siswa/widgets/loading.dart';
import 'package:fe_info_siswa/widgets/text_buttom.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sp_util/sp_util.dart';

class AmbilAbsenPage extends StatefulWidget {
  const AmbilAbsenPage({super.key});

  @override
  State<AmbilAbsenPage> createState() => _AmbilAbsenPageState();
}

class _AmbilAbsenPageState extends State<AmbilAbsenPage> {
  String? cek = SpUtil.getString('cek');
  LocationService locationService = LocationService();
  double latitude =0;
  double longitude =0;
  double jarak=0;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    locationService.locationStream.listen((userLocation) {
      setState(() {
        latitude = userLocation.lati;
        longitude = userLocation.longi;
        jarak = userLocation.jarak;
      });
    });
  }

  @override
  void dispose(){
    locationService.dispose();
    super.dispose();
  }

  

  @override
  Widget build(BuildContext context) {

    Siswa2Provider siswaProvider = Provider.of<Siswa2Provider>(context);
    SiswaProvider siswaProvider2 = Provider.of<SiswaProvider>(context);
    AmbilKoordinatSekolahModel koordinat = siswaProvider.lokasi;

    // const LatLng lokasi = LatLng(-0.0974147,100.4588992);
    LatLng  lokasi = LatLng(koordinat.latitude!,koordinat.longitude!);
    final DateTime now = DateTime.now();
    String status ;

    if (now.hour >= 5 && now.hour < 10 && now.minute > 0) {
      status = 'Masuk';
    } else if(now.hour >= 12 && now.hour < 20 && now.minute > 0){
      status = 'Pulang';
    }else{
      status = 'Belum waktunya';
    }


    absen() async {
      setState(() {
        isLoading = true;
      });
      
      if (await siswaProvider2.ambilAbsenSiswa()) {
        Navigator.pushNamed(context, '/home');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: alertColor,
            content: Text(
              'Gagal Register!',
              textAlign: TextAlign.center,
            )));
      }

      setState(() {
        isLoading = false;
      });
    }



    return Scaffold(
      backgroundColor: background4Color,
      body: SafeArea(
        child: Column(
          children: [
            AppBarButtom(nama: 'Ambil Absen'),

            isLoading ? Loading() : SizedBox(),
            
            Expanded(
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: lokasi,
                  zoom: 16
                ),
                markers: {
                  Marker(
                    markerId: MarkerId('Lokasi Sekolah : '+koordinat.nama.toString()),
                    position: lokasi,
                    infoWindow: InfoWindow(
                      title: 'Lokasi Sekolah : '+koordinat.nama.toString(),
                    ),
                  ),
                  Marker(
                    markerId: MarkerId('Lokasi Kamu'),
                    position: LatLng(latitude, longitude),
                    infoWindow: InfoWindow(
                      title: 'Lokasi Kamu',
                    ),
                  ),
                },
              ),
            ),

            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16.0),
              width: double.infinity,
              height: 161,
              child: Column(
                children: [

                  Row(
                    children: [
                      const Icon(Icons.location_on),
                      const SizedBox(width: 8.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              status, 
                              style: blackTextStyle.copyWith(fontWeight: light,fontSize: 15),
                            )
                          ),
                          Text('Koordinat: $latitude, $longitude', style: blackTextStyle.copyWith(fontWeight: light,fontSize: 15),),
                          Text('Jarak : $jarak m', style: blackTextStyle.copyWith(fontWeight: light,fontSize: 15),),
                          // Text(koordinat.latitude.toString(), style: blackTextStyle.copyWith(fontWeight: light,fontSize: 15),),
                        ],
                      )
                    ],
                  ),
                  
                  jarak  > int.parse(koordinat.jarak.toString())  ? 
                    TextButtomSendiri(nama: 'Jauh dari lokasi absen',onPressed: (){},lebar: double.infinity,)
                  : 
                    status == 'Masuk' ?
                      cek != 'ada' ?
                        TextButtomSendiri(nama: 'Absen Masuk',onPressed: absen,lebar: double.infinity,)
                      :
                        TextButtomSendiri(nama: 'Absen Sudah Diambil',onPressed: (){},lebar: double.infinity,)
                    :
                      status == 'Pulang' ? 
                        TextButtomSendiri(nama: 'Absen Pulang',onPressed: absen,lebar: double.infinity,)
                      :
                        TextButtomSendiri(nama: status,onPressed: (){},lebar: double.infinity,)

                ],
              ),
            ),

          ],
        ),
      )
    );
  }
}