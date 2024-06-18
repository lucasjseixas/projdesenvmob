import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:projec1/Pages/recuperar_page.dart';
import 'package:projec1/Perfis/candidato_perfil.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:projec1/pages/loginpages/forms/cadidato_form.dart';
import 'package:projec1/perfis/perfilteste.dart';
import 'package:projec1/providers/themeprovider.dart';
import 'package:provider/provider.dart';

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

  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('LOGIN PARA CANDIDATOS'),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            },
            icon: Consumer<ThemeProvider>(
              builder: (context, themeProvider, _) => themeProvider.isDarkMode
                  ? const Icon(Icons.wb_sunny)
                  : const Icon(Icons.nightlight_round),
            ),
          ),
          Switch(
            value: Provider.of<ThemeProvider>(context).isDarkMode,
            onChanged: (value) {
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                'Ainda não é cadastrado? Clique em Cadastrar',
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
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
                obscureText: _isObscured,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Senha',
                  prefixIcon: const Icon(Icons.key),
                  suffixIcon: IconButton(
                    icon: _isObscured
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _isObscured = !_isObscured;
                      });
                    },
                  ),
                ),
                keyboardType: TextInputType.text,
                validator: (value) => value!.isEmpty ? 'Senha inválida' : null,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RecuperarSenha()));
                },
                child: const Text(
                  'Esqueceu sua senha?',
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
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
    );
  }
}
