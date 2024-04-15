import 'package:flutter/material.dart';
import 'package:projec1/models/anuncio.dart';

class AnuncioPage extends StatefulWidget {
  const AnuncioPage({super.key});

  @override
  State<AnuncioPage> createState() => _AnuncioPageState();
}

class _AnuncioPageState extends State<AnuncioPage> {
  List<Anuncio> anuncios = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OFERTAS DE VAGAS'),
      ),
      body: ListView.builder(
        itemCount: anuncios.length,
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Text(
                    anuncios[index].nome,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    anuncios[index].descricao,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void novoAnuncioCriado(Anuncio anuncio) {
    anuncios.add(anuncio);
    setState(() {});
  }

  void auncioApagado(int index) {
    anuncios.removeAt(index);
    setState(() {});
  }
}
