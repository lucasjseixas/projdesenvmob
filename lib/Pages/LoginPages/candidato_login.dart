import 'package:flutter/material.dart';
import 'package:projec1/Perfis/candidato_perfil.dart';
import 'package:projec1/pages/LoginPages/Forms/cadidato_form.dart';

final _formKey = GlobalKey<FormState>();

class CandidatoLoginInfo extends StatefulWidget {
  const CandidatoLoginInfo({super.key});

  @override
  State<CandidatoLoginInfo> createState() => _CandidatoLoginInfoState();
}

class _CandidatoLoginInfoState extends State<CandidatoLoginInfo> {
  String usuarioCandidato = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('LOGIN PARA CANDIDATOS')),
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
                  key: const Key('usuario'),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Usuario / E-mail / CPF',
                    prefixIcon: Icon(Icons.person_2),
                  ),
                  onChanged: (ctx) => usuarioCandidato = ctx,
                  keyboardType: TextInputType.text,
                  validator: (usuario) => usuario!.length < 4
                      ? 'Usuário deve possuir pelo menos 3 caracteres*'
                      : null,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                TextFormField(
                  key: const Key('senha'),
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
                    onPressed: () {},
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: ((context) => const CandidatoForm()),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8))),
                            child: const Text(
                              'Cadastrar',
                              style: TextStyle(fontSize: 26),
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: SizedBox(
                        width: 100,
                        height: 60,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CandidatoPerfil(
                                        usuarioCandidato: usuarioCandidato)),
                              );
                            } else {
                              return; //Colocar um aviso de erro de login e manter na pagina
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                          child: const Text(
                            'Logar',
                            style: TextStyle(fontSize: 24),
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
