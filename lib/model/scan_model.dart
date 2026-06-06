class ScanModel {

  int? id;
  String tipus;
  String valor;

  ScanModel({
    this.id,
    required this.tipus,
    required this.valor,
  });

  factory ScanModel.fromMap(Map<String, dynamic> json) => ScanModel(
        id: json['id'],
        tipus: json['tipus'],
        valor: json['valor'],
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'tipus': tipus,
        'valor': valor,
      };
}