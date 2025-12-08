import 'package:flutter/material.dart';
import '../services/quadra_service.dart';
import '../services/cliente_service.dart';
import '../services/reserva_service.dart';

class NovaReservaPage extends StatefulWidget {
  @override
  State<NovaReservaPage> createState() => _NovaReservaPageState();
}

class _NovaReservaPageState extends State<NovaReservaPage> {
  final quadraService = QuadraService();
  final clienteService = ClienteService();
  final reservaService = ReservaService();

  List quadras = [];
  List clientes = [];

  String? quadraId;
  String? clienteId;

  TextEditingController data = TextEditingController();
  TextEditingController horario = TextEditingController();

  @override
  void initState() {
    super.initState();
    carregar();
  }

  carregar() async {
    quadras = await quadraService.getQuadras();
    clientes = await clienteService.getClientes();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Nova Reserva")),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            DropdownButtonFormField(
              hint: Text("Selecione a quadra"),
              items: quadras.map((q) => DropdownMenuItem(
                value: q.id.toString(),
                child: Text(q.nome),
              )).toList(),
              onChanged: (v) => quadraId = v,
            ),
            SizedBox(height: 12),

            DropdownButtonFormField(
              hint: Text("Selecione o cliente"),
              items: clientes.map((c) => DropdownMenuItem(
                value: c["id"].toString(),
                child: Text(c["nome"]),
              )).toList(),
              onChanged: (v) => clienteId = v,
            ),
            SizedBox(height: 12),

            TextField(controller: data, decoration: InputDecoration(labelText: "Data (AAAA-MM-DD)")),
            TextField(controller: horario, decoration: InputDecoration(labelText: "Horário (HH:MM)")),
            SizedBox(height: 12),

            ElevatedButton(
              onPressed: () async {
                final ok = await reservaService.addReserva(
                  int.parse(quadraId!),
                  int.parse(clienteId!),
                  data.text,
                  horario.text,
                );

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(ok ? "Reserva criada com sucesso!" : "Erro ao reservar"))
                );

                if(ok) Navigator.pop(context);
              },
              child: Text("Salvar"),
            ),
          ],
        ),
      ),
    );
  }
}
