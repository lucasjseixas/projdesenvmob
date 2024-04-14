import 'package:flutter/material.dart';
import 'package:projec1/Pages/LoginPages/Forms/cadidato_form.dart';

final _formKey = GlobalKey<FormState>();

class CandidatoLoginInfo extends StatefulWidget {
  const CandidatoLoginInfo({super.key});

  @override
  State<CandidatoLoginInfo> createState() => _CandidatoLoginInfoState();
}

class _CandidatoLoginInfoState extends State<CandidatoLoginInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PAGINA DE LOGIN DE CANDIDATOS'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text('Ainda não é cadastrado? Clique em Cadastrar'),
              TextFormField(
                key: const Key('usuario'),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Usuario / E-mail / CPF',
                  prefixIcon: Icon(Icons.person_2),
                ),
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
                validator: (value) => value!.isEmpty ? 'Senha inválida' : null,
              ),
              TextButton(onPressed: (){}, child: const Text('Esqueceu sua senha?')),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: ((context) => const CandidatoForm()),
                            ),
                          );
                        },
                        child: const Text('Cadastrar')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: ElevatedButton(
                        onPressed: () {
                          _formKey.currentState!.validate();
                        },
                        child: const Text('Login')),
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
