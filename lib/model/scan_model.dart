class ScanModel {

  // Identificador únic del registre
  int? id;

  // Tipus de QR (http o geo)
  String tipus;

  // Contingut del QR
  String valor;

  // Constructor
  ScanModel({
    this.id,
    required this.valor,
  })

      // Detectam automàticament el tipus
      : tipus = valor.startsWith('http')
            ? 'http'
            : 'geo';

  // Converteix un Map de SQLite a un objecte ScanModel
  factory ScanModel.fromMap(Map<String, dynamic> json) => ScanModel(
        id: json['id'],
        valor: json['valor'],
      );

  // Converteix l'objecte a Map per guardar-lo a SQLite
  Map<String, dynamic> toMap() => {
        'id': id,
        'tipus': tipus,
        'valor': valor,
      };
}