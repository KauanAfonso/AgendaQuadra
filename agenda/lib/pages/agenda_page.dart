import 'package:flutter/material.dart';
import '../services/reserva_service.dart';
import 'nova_reserva_page.dart';

class AgendaPage extends StatefulWidget {
  @override
  State<AgendaPage> createState() => _AgendaPageState();
}

class _AgendaPageState extends State<AgendaPage> {
  final service = ReservaService();
  List reservas = [];

  carregar() async {
    reservas = await service.getReservas();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    carregar();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Agenda de Quadras"),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            tooltip: "Sair",
            onPressed: () {
              Navigator.pushReplacementNamed(context, "/login");
            },
          )
        ],
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          await Navigator.push(context, MaterialPageRoute(builder: (_) => NovaReservaPage()));
          carregar();
        },
      ),

      body: reservas.isEmpty
        ? Center(child: Text("Nenhuma reserva cadastrada"))
        : ListView.builder(
          itemCount: reservas.length,
          itemBuilder: (_, i) {
            final r = reservas[i];
            return Card(
              child: ListTile(
                title: Text(r["quadra"]),
                subtitle: Text("${r["data"]} - ${r["horario"]}"),
                trailing: Text(r["cliente"]),
              ),
            );
          },
        ),
    );
  }
}
