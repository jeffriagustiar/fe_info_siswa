import 'package:fe_info_siswa/services/jarak_absen_service.dart';
import 'package:fe_info_siswa/share/theme.dart';
import 'package:fe_info_siswa/widgets/appBar_buttom.dart';
import 'package:fe_info_siswa/widgets/text_buttom.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AmbilAbsenPage extends StatefulWidget {
  const AmbilAbsenPage({super.key});

  @override
  State<AmbilAbsenPage> createState() => _AmbilAbsenPageState();
}

class _AmbilAbsenPageState extends State<AmbilAbsenPage> {
  double lati = -0.1354442;
  double long = 100.533668;
  LocationService locationService = LocationService(-0.1354442,100.533668);
  double latitude =0;
  double longitude =0;
  double jarak=0;

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

    // const LatLng lokasi = LatLng(-0.0974147,100.4588992);
    LatLng  lokasi = LatLng(lati,long);

    return Scaffold(
      backgroundColor: background4Color,
      body: SafeArea(
        child: Column(
          children: [
            AppBarButtom(nama: 'Ambil Absen'),

            Expanded(
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: lokasi,
                  zoom: 16
                ),
                markers: {
                  Marker(
                    markerId: MarkerId('Lokasi Sekolah'),
                    position: lokasi,
                    infoWindow: InfoWindow(
                      title: 'Lokasi Sekolah',
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
              height: 138,
              child: Column(
                children: [

                  Row(
                    children: [
                      const Icon(Icons.location_on),
                      const SizedBox(width: 8.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Koordinat: $latitude, $longitude', style: blackTextStyle.copyWith(fontWeight: light,fontSize: 15),),
                          Text('Jarak : $jarak m', style: blackTextStyle.copyWith(fontWeight: light,fontSize: 15),),
                        ],
                      )
                    ],
                  ),

                  jarak  > 10 ? 
                    TextButtomSendiri(nama: 'Jauh dari lokasi absen',lebar: double.infinity,)
                  : 
                    TextButtomSendiri(nama: 'Absen',lebar: double.infinity,)

                ],
              ),
            ),

          ],
        ),
      )
    );
  }
}