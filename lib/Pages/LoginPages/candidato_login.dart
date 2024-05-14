import 'package:flutter/material.dart';
import 'package:projec1/Pages/recuperar_page.dart';
import 'package:projec1/Perfis/candidato_perfil.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:projec1/pages/loginpages/forms/cadidato_form.dart';
import 'package:projec1/perfis/perfilteste.dart';

class CandidatoLoginInfo extends StatefulWidget {
  const CandidatoLoginInfo({super.key});

  @override
  State<CandidatoLoginInfo> createState() => _CandidatoLoginInfoState();
}

class _CandidatoLoginInfoState extends State<CandidatoLoginInfo> {
  String usuarioCandidato = "";
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _nomeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('LOGIN PARA CANDIDATOS'),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/particle_background.png'),
              fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.all(8),
                  child: const Text(
                    'Ainda não é cadastrado? Clique em Cadastrar',
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                ),
                TextFormField(
                  key: const Key('usuarioCandidato'),
                  controller: _emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Usuario / E-mail / CPF',
                    prefixIcon: Icon(Icons.person_2),
                  ),
                  keyboardType: TextInputType.text,
                  onChanged: (ctx) => usuarioCandidato = ctx,
                  validator: (usuario) => usuario!.length < 4
                      ? 'Usuário deve possuir pelo menos 3 caracteres*'
                      : null,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                TextFormField(
                  controller: _senhaController,
                  key: const Key('senhaCandidato'),
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Senha',
                    prefixIcon: Icon(Icons.key),
                    suffixIcon: Icon(Icons.remove_red_eye),
                  ),
                  keyboardType: TextInputType.text,
                  validator: (value) =>
                      value!.isEmpty ? 'Senha inválida' : null,
                ),
                Container(
                  constraints: const BoxConstraints(minWidth: 150.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RecuperarSenha()));
                    },
                    child: const Text(
                      'Esqueceu sua senha?',
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: SizedBox(
                        width: 100,
                        height: 60,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const CandidatoForm()));
                          },
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                          child: const Text(
                            'Cadastrar',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: SizedBox(
                        width: 100,
                        height: 60,
                        child: ElevatedButton(
                          onPressed: () async {
                            try {
                              // Fazer login com Firebase Auth
                              await FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                email: _emailController.text,
                                password: _senhaController.text,
                              );

                              // Após o login bem-sucedido, navegue para a tela que acessa os dados do Firestore
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const PerfilTeste()),
                              );
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text('Falha ao fazer login: $e')),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                          child: const Text(
                            'Logar',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
