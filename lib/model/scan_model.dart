class ScanModel {

  // Identificador del registre
  int? id;

  // Tipus del QR: http o geo
  String tipus;

  // Valor llegit del QR
  String valor;

  ScanModel({
    this.id,
    required String valor,
  })  : valor = valor.trim(),
        tipus = valor.trim().toLowerCase().startsWith('http')
            ? 'http'
            : 'geo';

  // Retorna la latitud
  double get latitud {
    final coords = valor.substring(4).split(',');
    return double.parse(coords[0]);
  }

  // Retorna la longitud
  double get longitud {
    final coords = valor.substring(4).split(',');
    return double.parse(coords[1]);
  }

  factory ScanModel.fromMap(Map<String, dynamic> json) => ScanModel(
        id: json['id'],
        valor: json['valor'],
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'tipus': tipus,
        'valor': valor,
      };

  @override
  String toString() {
    return 'ScanModel(id: $id, tipus: $tipus, valor: $valor)';
  }
}