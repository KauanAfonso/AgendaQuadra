import 'package:flutter/material.dart';
import '../models/quadra.dart';
import '../services/quadra_service.dart';

class QuadrasPage extends StatefulWidget {
  @override
  _QuadrasPageState createState() => _QuadrasPageState();
}

class _QuadrasPageState extends State<QuadrasPage> {
  final QuadraService service = QuadraService();
  List<Quadra> quadras = [];

  final nomeCtrl = TextEditingController();
  final tipoCtrl = TextEditingController();
  final localCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadQuadras();
  }

  loadQuadras() async {
    final data = await service.getQuadras();
    setState(() => quadras = data);
  }

  openForm({Quadra? q}) {
    if (q != null) {
      nomeCtrl.text = q.nome;
      tipoCtrl.text = q.tipo;
      localCtrl.text = q.localizacao;
    } else {
      nomeCtrl.clear();
      tipoCtrl.clear();
      localCtrl.clear();
    }

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(q == null ? "Nova Quadra" : "Editar Quadra"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: nomeCtrl, decoration: InputDecoration(labelText: "Nome")),
            TextField(controller: tipoCtrl, decoration: InputDecoration(labelText: "Tipo")),
            TextField(controller: localCtrl, decoration: InputDecoration(labelText: "Localização")),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancelar"),
          ),
          ElevatedButton(
            onPressed: () async {
              final quadra = Quadra(
                nome: nomeCtrl.text,
                tipo: tipoCtrl.text,
                localizacao: localCtrl.text,
              );

              if (q == null)
                await service.addQuadra(quadra);
              else
                await service.updateQuadra(q.id!, quadra);

              Navigator.pop(context);
              loadQuadras();
            },
            child: Text("Salvar"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Quadras")),
      floatingActionButton: FloatingActionButton(
        onPressed: () => openForm(),
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: quadras.length,
        itemBuilder: (_, i) {
          final q = quadras[i];
          return ListTile(
            title: Text(q.nome),
            subtitle: Text("${q.tipo} │ ${q.localizacao}"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(icon: Icon(Icons.edit), onPressed: ()=> openForm(q: q)),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () async {
                    await service.deleteQuadra(q.id!);
                    loadQuadras();
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
