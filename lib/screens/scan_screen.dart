import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScanScreen extends StatefulWidget {

  const ScanScreen({Key? key}) : super(key: key);

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}


class _ScanScreenState extends State<ScanScreen> {

  // Evita llegir el mateix QR múltiples vegades
  bool scanned = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Escanejar QR'),
      ),

      // Widget de la càmera
      body: MobileScanner(

        // S'executa quan detecta un QR
        onDetect: (capture) {

          // Si ja hem llegit un QR sortim
          if (scanned) return;

          // Obtenim el primer QR detectat
          final barcode = capture.barcodes.first;

          // Obtenim el text del QR
          final String code = barcode.rawValue ?? '';

          scanned = true;

          // Retornam el resultat a la pantalla anterior
          Navigator.pop(context, code);
        },
      ),
    );
  }
}