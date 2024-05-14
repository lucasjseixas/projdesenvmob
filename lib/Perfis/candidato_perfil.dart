import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CandidatoPerfil extends StatefulWidget {
  const CandidatoPerfil({super.key});

  @override
  State<CandidatoPerfil> createState() => _CandidatoPerfilState();
}

class _CandidatoPerfilState extends State<CandidatoPerfil> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil do Candidato'),
        actions: [
          IconButton(
              onPressed: () async {
                // Fazer logout
                await FirebaseAuth.instance.signOut();
                // Navegar de volta para a tela de login
                Navigator.pop(context);
              },
              icon: const Icon(Icons.logout))
        ],
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
                controller: _nomeController,
                decoration: const InputDecoration(
                  labelText: 'Nome',
                  border: OutlineInputBorder(),
                ),
                readOnly: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                readOnly: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
