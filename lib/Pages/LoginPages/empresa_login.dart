import 'package:flutter/material.dart';
import 'package:projec1/perfis/empresa_perfil.dart';

class EmpresaLoginInfo extends StatelessWidget {
  const EmpresaLoginInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('LOGIN PARA EMPRESAS')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text('Ainda não é cadastrado? Clique em Cadastrar'),
              const TextField(
                key: Key('usuario'),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Usuario / E-mail / CNPJ',
                  prefixIcon: Icon(Icons.business),
                ),
                keyboardType: TextInputType.text,
              ),
              const TextField(
                key: Key('senha'),
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Senha',
                  prefixIcon: Icon(Icons.key),
                  suffixIcon: Icon(Icons.remove_red_eye),
                ),
                keyboardType: TextInputType.text,
              ),
              const Text('Esqueceu sua senha?'),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Cadastrar'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const EmpresaPerfil()));
                      },
                      child: const Text('Login'),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
