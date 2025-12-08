import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/quadra.dart';

class QuadraService {
  final String baseUrl = "http://localhost:3000"; // Se usar celular use o IP da máquina

  Future<List<Quadra>> getQuadras() async {
    final response = await http.get(Uri.parse("$baseUrl/quadras"));
    final List data = json.decode(response.body);
    return data.map((e) => Quadra.fromJson(e)).toList();
  }

  Future<void> addQuadra(Quadra quadra) async {
    await http.post(
      Uri.parse("$baseUrl/quadras"),
      headers: {"Content-Type": "application/json"},
      body: json.encode(quadra.toJson()),
    );
  }

  Future<void> updateQuadra(int id, Quadra quadra) async {
    await http.put(
      Uri.parse("$baseUrl/quadras/$id"),
      headers: {"Content-Type": "application/json"},
      body: json.encode(quadra.toJson()),
    );
  }

  Future<void> deleteQuadra(int id) async {
    await http.delete(Uri.parse("$baseUrl/quadras/$id"));
  }
}
