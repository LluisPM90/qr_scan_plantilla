import 'package:url_launcher/url_launcher.dart';
import 'package:qr_scan/model/scan_model.dart';

class LaunchURL {

  static Future<void> obrirScan(ScanModel scan) async {

    print('TIPUS: ${scan.tipus}');
    print('VALOR: ${scan.valor}');

    Uri uri;

    if (scan.valor.startsWith('http://') ||
        scan.valor.startsWith('https://')) {

      uri = Uri.parse(scan.valor);

    } else {

      uri = Uri.parse(
        'https://www.google.com/maps/search/?api=1&query=${scan.latitud},${scan.longitud}',
      );
    }

    await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );
  }
}