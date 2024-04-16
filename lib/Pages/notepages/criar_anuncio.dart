import 'package:flutter/material.dart';
import 'package:projec1/models/anuncio.dart';

class CriarAnuncio extends StatefulWidget {
  const CriarAnuncio({super.key, required this.novoAnuncioCriado});

  final Function(Anuncio) novoAnuncioCriado;

  @override
  State<CriarAnuncio> createState() => _CriarAnuncioState();
}

class _CriarAnuncioState extends State<CriarAnuncio> {
  final _nomeController = TextEditingController();
  final _descricaoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NOVO ANUNCIO'),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: _nomeController,
            style: const TextStyle(
              fontSize: 18,
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Nome',
            ),
          ),
          TextFormField(
            controller: _descricaoController,
            style: const TextStyle(
              fontSize: 22,
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Descrição',
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        splashColor: Colors.amber,
        onPressed: () {
          if (_nomeController.text.isEmpty) {
            return;
          }
          if (_descricaoController.text.isEmpty) {
            return;
          }

          final anuncio = Anuncio(
            nome: _nomeController.text,
            descricao: _descricaoController.text,
          );
          widget.novoAnuncioCriado(anuncio);
          Navigator.of(context).pop();
        },
        label: const Text('Salvar'),
        icon: const Icon(Icons.save),
      ),
    );
  }
}
