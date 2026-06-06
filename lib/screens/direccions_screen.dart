import 'package:flutter/material.dart';
import 'package:qr_scan/db/db_provider.dart';
import 'package:qr_scan/model/scan_model.dart';
import 'package:qr_scan/utils/launch_url.dart';

class DireccionsScreen extends StatelessWidget {
  const DireccionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<List<ScanModel>>(

      // Llegim tots els registres de SQLite
      future: DBProvider.db.getTotsScans(),

      builder: (context, snapshot) {

        // Mentre es carreguen les dades
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        // Filtram només els registres de tipus URL
        final scans = snapshot.data!
            .where((scan) => scan.tipus == 'http')
            .toList();

        // Si no hi ha dades
        if (scans.isEmpty) {
          return const Center(
            child: Text('No hi ha direccions'),
          );
        }

        // Mostram el llistat de URLs
        return ListView.builder(

          itemCount: scans.length,

          itemBuilder: (_, index) {

            final scan = scans[index];

            return ListTile(

              // Icona de la fila
              leading: const Icon(
                Icons.http,
                color: Colors.blue,
              ),

              // URL guardada
              title: Text(
                scan.valor,
              ),

              // Identificador SQLite
              subtitle: Text(
                'ID: ${scan.id}',
              ),

              // Obrir la URL quan es prem
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