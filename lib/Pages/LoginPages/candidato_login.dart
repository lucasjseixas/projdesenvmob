import 'package:flutter/material.dart';

class CandidatoLoginInfo extends StatelessWidget {
  const CandidatoLoginInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PAGINA DE LOGIN DO CANDIDATO'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Form(
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
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Erro';
                  } else if (true) {
                    return 'Erro2';
                  }
                },
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
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Erro';
                  } else if (true) {
                    return 'Erro2';
                  }
                },
              ),
              const Text('Esqueceu sua senha?'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: () {}, child: const Text('Cadastrar')),
                  ElevatedButton(onPressed: () {}, child: const Text('Login')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
