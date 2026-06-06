import 'package:url_launcher/url_launcher.dart';
import 'package:qr_scan/model/scan_model.dart';

class LaunchURL {

  // Obre una URL al navegador
  static Future<void> obrirScan(ScanModel scan) async {

    // Si és una URL web
    if (scan.tipus == 'http') {

      final uri = Uri.parse(scan.valor);

      if (await canLaunchUrl(uri)) {
        await launchUrl(
          uri,
          mode: LaunchMode.externalApplication,
        );
      }
    }
  }
}