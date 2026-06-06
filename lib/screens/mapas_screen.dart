import 'package:flutter/material.dart';
import 'package:qr_scan/db/db_provider.dart';
import 'package:qr_scan/model/scan_model.dart';

class MapasScreen extends StatelessWidget {
  const MapasScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<List<ScanModel>>(

      future: DBProvider.db.getTotsScans(),

      builder: (context, snapshot) {

        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        // Filtram només coordenades
        final scans = snapshot.data!
            .where((scan) => scan.tipus == 'geo')
            .toList();

        if (scans.isEmpty) {
          return const Center(
            child: Text('No hi ha coordenades'),
          );
        }

        return ListView.builder(
          itemCount: scans.length,

          itemBuilder: (_, index) {

            final scan = scans[index];

            return ListTile(

              leading: const Icon(
                Icons.map,
                color: Colors.green,
              ),

              title: Text(scan.valor),

              subtitle: Text(
                'ID: ${scan.id}',
              ),
            );
          },
        );
      },
    );
  }
}