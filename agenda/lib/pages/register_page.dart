import 'package:flutter/material.dart';
import '../services/cliente_service.dart';

class RegisterPage extends StatelessWidget {
  final nome = TextEditingController();
  final telefone = TextEditingController();

  final service = ClienteService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Registrar Cliente")),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(controller: nome, decoration: InputDecoration(labelText: "Nome")),
            TextField(controller: telefone, decoration: InputDecoration(labelText: "Telefone")),

            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                final ok = await service.addCliente(nome.text, telefone.text);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(ok ? "Cliente cadastrado!" : "Erro ao cadastrar"))
                );

                if(ok) Navigator.pop(context);
              },
              child: Text("Cadastrar"),
            )
          ],
        ),
      ),
    );
  }
}
