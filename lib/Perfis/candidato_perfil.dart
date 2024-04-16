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
        title: const Text('Perfil do Candidato'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 73, 105, 131),
            Color.fromARGB(255, 126, 91, 172)
          ]),
        ),
        child: Column(
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
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: TextEditingController(text: usuarioCandidato),
                decoration: const InputDecoration(
                  labelText: 'asdf',
                  border: OutlineInputBorder(),
                ),
                readOnly: true,
              ),
            ),
            //placeholder para centralizar a imagem
          ],
        ),
      ),
    );
  }
}
