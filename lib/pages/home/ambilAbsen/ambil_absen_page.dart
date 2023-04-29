import 'package:fe_info_siswa/models/ambilAbsen/ambil_koordidat_sekolah_model.dart';
import 'package:fe_info_siswa/provider/siswa2_provider.dart';
import 'package:fe_info_siswa/services/jarak_absen_service.dart';
import 'package:fe_info_siswa/share/theme.dart';
import 'package:fe_info_siswa/widgets/appBar_buttom.dart';
import 'package:fe_info_siswa/widgets/text_buttom.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class AmbilAbsenPage extends StatefulWidget {
  const AmbilAbsenPage({super.key});

  @override
  State<AmbilAbsenPage> createState() => _AmbilAbsenPageState();
}

class _AmbilAbsenPageState extends State<AmbilAbsenPage> {
  LocationService locationService = LocationService();
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

    Siswa2Provider siswaProvider = Provider.of<Siswa2Provider>(context);
    AmbilKoordinatSekolahModel koordinat = siswaProvider.lokasi;

    // const LatLng lokasi = LatLng(-0.0974147,100.4588992);
    LatLng  lokasi = LatLng(koordinat.latitude!,koordinat.longitude!);

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
                          // Text(koordinat.latitude.toString(), style: blackTextStyle.copyWith(fontWeight: light,fontSize: 15),),
                        ],
                      )
                    ],
                  ),

                  jarak  > int.parse(koordinat.jarak.toString())  ? 
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