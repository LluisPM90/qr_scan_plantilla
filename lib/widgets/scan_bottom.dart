import 'package:flutter/material.dart';
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
            builder: (_) => const ScanScreen(),
          ),
        );

        // Mostram el resultat per consola
        if (result != null) {
          print(result);
        }
      },
    );
  }
}