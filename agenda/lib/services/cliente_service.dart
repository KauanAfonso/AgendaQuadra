import 'dart:convert';
import 'package:http/http.dart' as http;

class ClienteService {
  final String baseUrl = "http://localhost:3000";

  Future<List> getClientes() async {
    final response = await http.get(Uri.parse("$baseUrl/clientes"));
    return json.decode(response.body);
  }

  Future<bool> addCliente(String nome, String telefone, {String contato = ""}) async {
    final response = await http.post(
      Uri.parse("$baseUrl/clientes"),
      headers: {"Content-Type": "application/json"},
      body: json.encode({
        "nome": nome,
        "telefone": telefone,
        "contato": contato,
      }),
    );
    return response.statusCode == 200;
  }
}
