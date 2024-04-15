import 'package:flutter/material.dart';
import 'package:projec1/pages/home_page.dart';

final _formKeytwo = GlobalKey<FormState>();

class CandidatoForm extends StatefulWidget {
  const CandidatoForm({super.key});

  @override
  State<CandidatoForm> createState() => _CandidatoFormState();
}

class _CandidatoFormState extends State<CandidatoForm> {
  //final _dateController = TextEditingController();
  final _nomeCandidatoController = TextEditingController();
  final _emailCandidatoController = TextEditingController();
  final _emailCandidatoConfirmarController = TextEditingController();
  final _senhaCandidatoController = TextEditingController();
  final _usuarioCandidatoController = TextEditingController();

  void clearTextField() {
    _nomeCandidatoController.clear();
    _emailCandidatoController.clear();
    _emailCandidatoConfirmarController.clear();
    _senhaCandidatoController.clear();
    _usuarioCandidatoController.clear();
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
                  key: const Key('nomecandidato'),
                  controller: _nomeCandidatoController,
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
                  key: const Key('usuariocandidato'),
                  controller: _usuarioCandidatoController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Digite seu usuario'),
                  keyboardType: TextInputType.text,
                  validator: (usuariocandidato) => usuariocandidato!.length < 5
                      ? 'Seu usuario precisa ter 3 letras pelo menos*'
                      : null,
                ),
              ),
              /*
              TextFormField(
                key: const Key('enderecocandidato'),
                decoration: const InputDecoration(labelText: 'Endereço Completo'),
                keyboardType: TextInputType.streetAddress,
              ),
              TextFormField(
                controller: _dateController,
                key: const Key('datanascimentocandidato'),
                decoration: const InputDecoration(
                  labelText: 'Data de Nascimento',
                  prefixIcon: Icon(Icons.calendar_today),
                ),
                readOnly: true,
                onTap: () {
                  _selectDate();
                },
              ),*/
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  key: const Key('emailcandidato'),
                  controller: _emailCandidatoController,
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
                  key: const Key('confirmaremailcandidato'),
                  controller: _emailCandidatoConfirmarController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Confirme seu e-Mail'),
                  keyboardType: TextInputType.emailAddress,
                  validator: validateEmailtwo,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  key: const Key('candidatosenha'),
                  obscureText: true,
                  controller: _senhaCandidatoController,
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
              ElevatedButton(
                  onPressed: () {
                    if (_formKeytwo.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()),
                      );
                    }
                  },
                  child: const Text('CADASTRAR')),
              ElevatedButton(
                  onPressed: () {
                    clearTextField();
                  },
                  child: const Text('LIMPAR')),
            ],
          ),
        ),
      ),
    );
  }
/* // Funcao para criação de um calendario //

  Future<void> _selectDate() async {
    DateTime? _picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2006),
      lastDate: DateTime(2100),
    );
    if (_picked != null) { 
      setState(
        () {
          _dateController.text = _picked.toString().split(" ")[0];
        },
      );
    }
  }
*/
}
