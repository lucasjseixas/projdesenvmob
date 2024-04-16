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
            Color.fromARGB(255, 160, 202, 236),
            Color.fromARGB(255, 187, 136, 255)
          ]),
        ),
        child: const Form(
            child: Column(
          children: [
            TextField(),
            TextField(),
            TextField(),
          ],
        )),
      ),
    );
  }
}
