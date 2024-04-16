import 'package:flutter/material.dart';
import 'package:projec1/pages/loginpages/forms/empresa_form.dart';
import 'package:projec1/perfis/empresa_perfil.dart';

class EmpresaLoginInfo extends StatelessWidget {
  const EmpresaLoginInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('LOGIN PARA EMPRESAS')),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 48, 71, 90),
            Color.fromARGB(255, 55, 33, 83)
          ]),
        ),
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  'Ainda não é cadastrado? Clique em Cadastrar',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const TextField(
                  key: Key('usuario'),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Usuario / E-mail / CNPJ',
                    prefixIcon: Icon(
                      Icons.business,
                    ),
                  ),
                  keyboardType: TextInputType.text,
                ),
                const TextField(
                  key: Key('senha'),
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Senha',
                    prefixIcon: Icon(
                      Icons.key,
                    ),
                    suffixIcon: Icon(
                      Icons.remove_red_eye,
                    ),
                  ),
                  keyboardType: TextInputType.text,
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Esqueceu sua senha?',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const EmpresaForm(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            'Cadastrar',
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const EmpresaPerfil(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            'Login',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
