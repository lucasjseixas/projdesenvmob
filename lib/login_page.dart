import 'package:flutter/material.dart';
import 'card_inicial.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('TELA DE LOGIN'),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.engineering),
            tooltip: 'Opções',
            onPressed: () => {},
          ),
        ],
      ),
      body: const CardInicial(),
    );
  }
}
