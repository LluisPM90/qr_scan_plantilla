import 'package:flutter/material.dart';
import 'package:qr_scan/db/db_provider.dart';
import 'package:qr_scan/model/scan_model.dart';
import 'package:qr_scan/utils/launch_url.dart';

class MapasScreen extends StatelessWidget {
  const MapasScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ScanModel>>(

      // Llegim tots els registres de la base de dades
      future: DBProvider.db.getTotsScans(),

      builder: (context, snapshot) {

        // Mentre es carreguen les dades
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        // Filtram només les coordenades
        final scans = snapshot.data!
            .where((scan) => scan.tipus == 'geo')
            .toList();

        // Si no hi ha coordenades guardades
        if (scans.isEmpty) {
          return const Center(
            child: Text('No hi ha coordenades'),
          );
        }

        // Mostram el llistat de coordenades
        return ListView.builder(

          itemCount: scans.length,

          itemBuilder: (_, index) {

            final scan = scans[index];

            return ListTile(

              // Icona del mapa
              leading: const Icon(
                Icons.map,
                color: Colors.green,
              ),

              // Coordenades llegides del QR
              title: Text(
                scan.valor,
              ),

              // ID del registre
              subtitle: Text(
                'ID: ${scan.id}',
              ),

              // Obrir Google Maps en prémer
              onTap: () {

                LaunchURL.obrirScan(scan);
              },
            );
          },
        );
      },
    );
  }
}