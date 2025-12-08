import 'dart:convert';
import 'package:http/http.dart' as http;

class ReservaService {
  final String baseUrl = "http://localhost:3000";

  Future<List> getReservas() async {
    final response = await http.get(Uri.parse("$baseUrl/reservas"));
    return json.decode(response.body);
  }

  Future<bool> addReserva(int quadraId, int clienteId, String data, String horario) async {
    final response = await http.post(
      Uri.parse("$baseUrl/reservas"),
      headers: {"Content-Type": "application/json"},
      body: json.encode({
        "quadraId": quadraId,
        "clienteId": clienteId,
        "data": data,
        "horario": horario,
        "duracao": "1h" // pode permitir escolher depois
      }),
    );

    return response.statusCode == 200;
  }
}
