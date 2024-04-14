import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CandidatoPerfil extends StatefulWidget {
  const CandidatoPerfil({super.key});

  @override
  State<CandidatoPerfil> createState() => _CandidatoPerfilState();
}

class _CandidatoPerfilState extends State<CandidatoPerfil> {
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
              'assets/image/fotoplaceholder.png',
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
