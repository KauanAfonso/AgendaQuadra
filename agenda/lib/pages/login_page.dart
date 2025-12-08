import 'package:flutter/material.dart';
import 'agenda_page.dart';
import 'admin_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  void login() {
    String user = _userController.text.trim();
    String pass = _passController.text.trim();

    // LOGIN ADMINISTRADOR
    if (user == "admin" && pass == "123") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => AdminPage()),
      );
      return;
    }

    // LOGIN COMUM (futuramente via API)
    if (user.isNotEmpty && pass.isNotEmpty) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => AgendaPage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Usuário ou senha inválidos")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Login", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              SizedBox(height: 30),

              TextField(
                controller: _userController,
                decoration: InputDecoration(labelText: "Usuário"),
              ),
              SizedBox(height: 15),

              TextField(
                controller: _passController,
                obscureText: true,
                decoration: InputDecoration(labelText: "Senha"),
              ),
              SizedBox(height: 25),

              ElevatedButton(
                onPressed: login,
                child: Text("Entrar"),
              ),

              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/register");
                },
                child: Text("Criar conta"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
