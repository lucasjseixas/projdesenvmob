import 'package:flutter/material.dart';
import 'package:projec1/perfis/candidato_perfil.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CandidatoForm extends StatefulWidget {
  const CandidatoForm({super.key});

  @override
  State<CandidatoForm> createState() => _CandidatoFormState();
}

class _CandidatoFormState extends State<CandidatoForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _nomeController = TextEditingController();

  void clearTextField() {
    _nomeController.clear();
    _emailController.clear();
    _senhaController.clear();
  }

  String? validateEmailtwo(String? email) {
    RegExp emailRegex = RegExp(r'^[\w\.-]+@[\w-]+\.\w{2,3}(\.\w{2,3})?$');
    final isEmailValid = emailRegex.hasMatch(email ?? '');
    if (!isEmailValid) {
      return 'Insira um email valido*';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulario de cadastro de Candidatos'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  key: const Key('nomecandidato'),
                  controller: _nomeController,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(),
                      labelText: 'Digite seu nome completo'),
                  keyboardType: TextInputType.text,
                  validator: (nomecandidato) => nomecandidato!.length < 3
                      ? 'Seu nome precisa ter 3 letras pelo menos*'
                      : null,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  key: const Key('emailcandidato'),
                  controller: _emailController,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(),
                      labelText: 'Digite seu e-mail'),
                  keyboardType: TextInputType.emailAddress,
                  validator: validateEmailtwo,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  key: const Key('candidatosenha'),
                  obscureText: true,
                  controller: _senhaController,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.key),
                      suffixIcon: Icon(Icons.remove_red_eye),
                      border: OutlineInputBorder(),
                      labelText: 'Digite sua senha'),
                  keyboardType: TextInputType.text,
                  validator: (candidatosenha) => candidatosenha!.length < 5
                      ? 'Sua senha deve possuir pelo menos 5 caracteres*'
                      : null,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: SizedBox(
                  height: 60,
                  width: 300,
                  child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          try {
                            // Criação do usuário no Firebase Auth
                            UserCredential userCredential = await FirebaseAuth
                                .instance
                                .createUserWithEmailAndPassword(
                              email: _emailController.text,
                              password: _senhaController.text,
                            );

                            // Cadastro do candidato no Firestore
                            await FirebaseFirestore.instance
                                .collection('Candidatos')
                                .doc(userCredential.user!.uid)
                                .set({
                              'nome': _nomeController.text,
                              'email': _emailController.text,
                              'senha': _senhaController.text,
                            });

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      'Candidato cadastrado com sucesso!')),
                            );
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text(
                                      'Erro ao cadastrar o candidato: $e')),
                            );
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      child: const Text('CADASTRAR')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
