class ScanModel {

  int? id;
  String tipus;
  String valor;

  ScanModel({
    this.id,
    required this.valor,
  })
      // Si comença per http és una URL
      : tipus = valor.startsWith('http')
            ? 'http'
            : 'geo';

  factory ScanModel.fromMap(Map<String, dynamic> json) => ScanModel(
        id: json['id'],
        valor: json['valor'],
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'tipus': tipus,
        'valor': valor,
      };
}