import 'package:flutter/material.dart';

class CandidatoPerfil extends StatelessWidget {
  const CandidatoPerfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PERFIL DO CANDIDATO'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(120),
            child: Image.asset(
              'assets/images/fotoplaceholder.png',
              fit: BoxFit.cover,
              width: 180,
              height: 180,
            ),
          ),
          const TextField(
              decoration:
                  InputDecoration()), //placeholder para centralizar a imagem
        ],
      ),
    );
  }
}
