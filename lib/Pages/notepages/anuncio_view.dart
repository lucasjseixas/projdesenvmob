import 'package:flutter/material.dart';
import 'package:projec1/models/anuncio.dart';

class AnuncioView extends StatelessWidget {
  const AnuncioView(
      {super.key,
      required this.anuncio,
      required this.index,
      required this.anuncioApagado});

  final Anuncio anuncio;
  final int index;

  final Function(int) anuncioApagado;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Anuncio View"),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("Deseja Apagar ?"),
                      content: Text("Note ${anuncio.nome} será apagado!"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            anuncioApagado(index);
                            Navigator.of(context).pop();
                          },
                          child: const Text("APAGAR"),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text("CANCELAR"),
                        )
                      ],
                    );
                  });
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              anuncio.nome,
              style: const TextStyle(fontSize: 26),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              anuncio.descricao,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
