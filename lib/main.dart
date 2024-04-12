import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Efetue LOGIN para continuar'),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.engineering),
            tooltip: 'Opções',
            onPressed: () => {},
          ),
        ],
      ),
    );
  }
}

class cardInicial extends StatelessWidget {
  const cardInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      
    );
  }
}