import 'package:flutter/material.dart';
import 'package:qr_scan/db/db_provider.dart';
import 'package:qr_scan/model/scan_model.dart';
import 'package:qr_scan/screens/scan_screen.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      child: const Icon(
        Icons.filter_center_focus,
      ),
      onPressed: () async {
        // Obrim la pantalla d'escaneig
        final result = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ScanScreen(),
          ),
        );

        // Si s'ha llegit un QR
        if (result != null) {
          // Cream l'objecte Scan
          final nouScan = ScanModel(
            valor: result,
          );

          // Guardam el registre a SQLite
          final id = await DBProvider.db.nouScan(
            nouScan,
          );

          // Mostram per consola l'identificador creat
          print('ID insertat: $id');
        }
      },
    );
  }
}
