import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:qr_scan/model/scan_model.dart';

class MapaScreen extends StatelessWidget {

  const MapaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // Recuperam l'objecte Scan enviat des de MapasScreen
    final ScanModel scan =
        ModalRoute.of(context)!.settings.arguments as ScanModel;

    // Coordenades del QR
    final LatLng punt = LatLng(
      scan.latitud,
      scan.longitud,
    );

    return Scaffold(

      appBar: AppBar(
        title: const Text('Mapa'),
      ),

      body: GoogleMap(

        // Posició inicial de la càmera
        initialCameraPosition: CameraPosition(
          target: punt,
          zoom: 16,
        ),

        // Marker sobre la ubicació
        markers: {

          Marker(
            markerId: const MarkerId('desti'),
            position: punt,
          ),
        },

        // Funcionalitat extra per a la pràctica
        circles: {

          Circle(
            circleId: const CircleId('zona'),

            center: punt,

            radius: 100,
          ),
        },
      ),
    );
  }
}