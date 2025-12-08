import 'package:flutter/material.dart';
import 'quadra_page.dart';
import 'agenda_page.dart';

class AdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Painel do Administrador")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => QuadrasPage()));
              },
              child: Text("Cadastrar Quadras"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => AgendaPage()));
              },
              child: Text("Ver Agendamentos"),
            ),
            SizedBox(height: 30),
            TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, "/login");
              },
              child: Text("Sair"),
            )
          ],
        ),
      ),
    );
  }
}
