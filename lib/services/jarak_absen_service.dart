import 'dart:async';

import 'dart:math';
import 'package:fe_info_siswa/models/ambilAbsen/ambil_absen_model.dart';
import 'package:location/location.dart';

double distance(double lat1, double lon1, double lat2, double lon2) {
  const p = 0.017453292519943295;
  final a = 0.5 -
      cos((lat2 - lat1) * p) / 2 +
      cos(lat1 * p) *
          cos(lat2 * p) *
          (1 - cos((lon2 - lon1) * p)) /
          2;
  return 6371000 * asin(sqrt(a));
}

String distanceFromCurrentLocation(double currentLat, double currentLon, double statikLat, double statikLon) {
  final distanceInMeter = distance(currentLat, currentLon, statikLat, statikLon);
  return distanceInMeter.toStringAsFixed(2);
}

class LocationService{
  Location location = Location();

  StreamController<AmbilAbsenModel> _locationStreamController = StreamController<AmbilAbsenModel>();

  Stream<AmbilAbsenModel> get locationStream => _locationStreamController.stream;

  LocationService(double lati, double long){
    location.requestPermission().then((permissionStatus) {
      if (permissionStatus == PermissionStatus.granted) {
        location.onLocationChanged.listen((LocationData) {
          if(LocationData != null){
            // Contoh penggunaan untuk menghitung jarak antara lokasi saat ini dengan lokasi statis (0,0)
            double currentLat = LocationData.latitude!;
            double currentLon = LocationData.longitude!;
            double staticLat = -0.1354442;
            double staticLon = 100.533668;

            String distance = distanceFromCurrentLocation(currentLat, currentLon, staticLat, staticLon);
            print('Jarak dari lokasi saat ini ke lokasi statis: $distance m');
            _locationStreamController.add(
              AmbilAbsenModel(
                lati: LocationData.latitude!, 
                longi: LocationData.longitude!,
                jarak: double.parse(distance)
              )
            );


          }
         });
      }
    });
  }
void dispose() => _locationStreamController.close();
}
