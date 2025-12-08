import 'package:flutter/material.dart';

// IMPORTAR SUAS TELAS:
import 'pages/login_page.dart';
import 'pages/admin_page.dart';
import 'pages/agenda_page.dart';
import 'pages/quadra_page.dart';
// caso crie tela de registro de usuários depois:
// import 'pages/register_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Agenda Quadra",

      // Tela inicial = LOGIN
      initialRoute: "/login",

      routes: {
        "/login": (context) => LoginPage(),
        "/admin": (context) => AdminPage(),
        "/agenda": (context) => AgendaPage(),
        "/quadras": (context) => QuadrasPage(),
        // "/register": (context) => RegisterPage(),
      },
    );
  }
}
