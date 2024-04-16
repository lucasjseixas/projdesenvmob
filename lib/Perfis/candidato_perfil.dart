import 'package:flutter/material.dart';

class CandidatoPerfil extends StatefulWidget {
  final String usuarioCandidato;

  const CandidatoPerfil({super.key, required this.usuarioCandidato});

  @override
  State<CandidatoPerfil> createState() => _CandidatoPerfilState();
}

class _CandidatoPerfilState extends State<CandidatoPerfil> {
  late String usuarioCandidato;

  @override
  void initState() {
    usuarioCandidato = widget.usuarioCandidato;
    super.initState();
  }

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
          TextField(
            controller: TextEditingController(text: usuarioCandidato),
            decoration: const InputDecoration(
              labelText: 'asdf',
              border: OutlineInputBorder(),
            ),
            readOnly: true,
          ), //placeholder para centralizar a imagem
        ],
      ),
    );
  }
}
