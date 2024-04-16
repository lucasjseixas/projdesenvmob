import 'package:flutter/material.dart';

class EmpresaPerfil extends StatelessWidget {
  const EmpresaPerfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadatro de Empresas'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 73, 105, 131),
            Color.fromARGB(255, 126, 91, 172)
          ]),
        ),
        child: const Form(
            child: Column(
          children: [
            TextField(
              readOnly: true,
            ),
            TextField(
              readOnly: true,
            ),
            TextField(
              readOnly: true,
            ),
          ],
        )),
      ),
    );
  }
}
