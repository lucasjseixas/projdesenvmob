import 'package:flutter/material.dart';
import 'package:projec1/pages/home_page.dart';

final _formKeytwo = GlobalKey<FormState>();

class EmpresaForm extends StatefulWidget {
  const EmpresaForm({super.key});

  @override
  State<EmpresaForm> createState() => _EmpresaFormState();
}

class _EmpresaFormState extends State<EmpresaForm> {
  //final _dateController = TextEditingController();
  final _nomeEmpresaController = TextEditingController();
  final _emailEmpresaController = TextEditingController();
  final _emailEmpresaConfirmarController = TextEditingController();
  final _senhaEmpresaController = TextEditingController();
  final _usuarioEmpresaController = TextEditingController();

  void clearTextField() {
    _nomeEmpresaController.clear();
    _emailEmpresaController.clear();
    _emailEmpresaConfirmarController.clear();
    _senhaEmpresaController.clear();
    _usuarioEmpresaController.clear();
  }

  String? validateEmailtwo(String? email) {
    RegExp emailRegex = RegExp(r'^[\w\.-]+@[\w-]+\.\w{2,3}(\.\w{2,3})?$');
    final isEmailValid = emailRegex.hasMatch(email ?? '');
    if (!isEmailValid) {
      return 'Insira um email válido*';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulario de cadastro de Empresas'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/particle_background.png'),
              fit: BoxFit.cover),
        ),
        child: Form(
          key: _formKeytwo,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  key: const Key('nomecempresa'),
                  controller: _nomeEmpresaController,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(),
                      labelText: 'Digite o nome da empresa completo'),
                  keyboardType: TextInputType.text,
                  validator: (nomeempresa) => nomeempresa!.length < 3
                      ? 'O nome precisa ter 3 letras pelo menos*'
                      : null,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  key: const Key('usuarioempresa'),
                  controller: _usuarioEmpresaController,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(),
                      labelText: 'Digite o usuario'),
                  keyboardType: TextInputType.text,
                  validator: (usuarioempresa) => usuarioempresa!.length < 5
                      ? 'O usuario precisa ter 3 letras pelo menos*'
                      : null,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  key: const Key('emailempresa'),
                  controller: _emailEmpresaController,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(),
                      labelText: 'Digite o e-mail da empresa'),
                  keyboardType: TextInputType.emailAddress,
                  validator: validateEmailtwo,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  key: const Key('confirmaremailempresa'),
                  controller: _emailEmpresaConfirmarController,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(),
                      labelText: 'Confirme o e-mail da empresa'),
                  keyboardType: TextInputType.emailAddress,
                  validator: validateEmailtwo,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  key: const Key('empresasenha'),
                  obscureText: true,
                  controller: _senhaEmpresaController,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.key),
                      suffixIcon: Icon(Icons.remove_red_eye),
                      border: OutlineInputBorder(),
                      labelText: 'Digite a senha'),
                  keyboardType: TextInputType.text,
                  validator: (empresasenha) => empresasenha!.length < 5
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
                      onPressed: () {
                        if (_formKeytwo.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      child: const Text('OK')),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: SizedBox(
                  height: 60,
                  width: 300,
                  child: ElevatedButton(
                      onPressed: () {
                        clearTextField();
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      child: const Text('LIMPAR')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
