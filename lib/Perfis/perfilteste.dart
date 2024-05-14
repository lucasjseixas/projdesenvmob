import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projec1/pages/home_page.dart';
import 'package:projec1/providers/anuncio_provider.dart';
import 'package:provider/provider.dart';

class PerfilTeste extends StatefulWidget {
  const PerfilTeste({super.key});

  @override
  State<PerfilTeste> createState() => _PerfilTesteState();
}

class _PerfilTesteState extends State<PerfilTeste> {
  String? email = FirebaseAuth.instance.currentUser!.email;
  final TextEditingController _nomeanunciocontroller = TextEditingController();
  final TextEditingController _descricaoanunciocontroller =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PERFIL TESTE'),
      ),
      body: Center(
        child: Column(
          children: [
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('Candidatos')
                  .where('email', isEqualTo: email)
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Text('Erro: ${snapshot.error}'),
                  );
                }
                if (snapshot.data!.docs.isEmpty) {
                  return const Center(
                    child: Text('Nenhum dado encontrado para este usuário.'),
                  );
                }
                var userData =
                    snapshot.data!.docs[0].data() as Map<String, dynamic>;
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Nome:', style: TextStyle(fontSize: 18)),
                      TextField(
                        controller:
                            TextEditingController(text: userData['nome']),
                        readOnly: true,
                      ),
                      const SizedBox(height: 16),
                      const Text('Email:', style: TextStyle(fontSize: 18)),
                      TextField(
                        controller:
                            TextEditingController(text: userData['email']),
                        readOnly: true,
                      ),
                    ],
                  ),
                );
              },
            ),
            ElevatedButton.icon(
              onPressed: () async {
                _displayTextInputDialog();
              },
              label: const Text('ADICIONAR ANUNCIO'),
              icon: const Icon(Icons.save),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () async {
          // Excluir conta do Firestore
          await FirebaseFirestore.instance
              .collection('Candidatos')
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .delete();

          // Excluir conta do Firebase Auth
          await FirebaseAuth.instance.currentUser!.delete();

          // Navegar de volta para a tela de login
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        },
        tooltip: 'Excluir Conta',
        child: const Icon(Icons.delete),
      ),
    );
  }

  void _displayTextInputDialog() async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Adicione um Anuncio'),
            content: Column(
              children: [
                TextField(
                  controller: _nomeanunciocontroller,
                  decoration: const InputDecoration(hintText: "Nome"),
                ),
                TextField(
                  controller: _descricaoanunciocontroller,
                  decoration: const InputDecoration(hintText: "Descrição"),
                ),
              ],
            ),
            actions: <Widget>[
              MaterialButton(
                color: Theme.of(context).colorScheme.primary,
                textColor: Colors.white,
                child: const Text('OK'),
                onPressed: () {
                  final nome = _nomeanunciocontroller.text;
                  final descricao = _descricaoanunciocontroller.text;
                  if (nome.isNotEmpty && descricao.isNotEmpty) {
                    Provider.of<AnuncioProvider>(context, listen: false)
                        .adicionaAnuncio(nome, descricao);
                    Navigator.of(context).pop;
                    _nomeanunciocontroller.clear();
                    _descricaoanunciocontroller.clear();
                  }
                },
              ),
            ],
          );
        });
  }
}
