class Quadra {
  final int? id;
  String nome;
  String tipo;
  String localizacao;

  Quadra({this.id, required this.nome, required this.tipo, required this.localizacao});

  factory Quadra.fromJson(Map<String, dynamic> json) {
    return Quadra(
      id: json['id'],
      nome: json['nome'],
      tipo: json['tipo'],
      localizacao: json['localizacao'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "nome": nome,
      "tipo": tipo,
      "localizacao": localizacao,
    };
  }
}
