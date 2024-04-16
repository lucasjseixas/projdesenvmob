import 'package:flutter/material.dart';
import 'package:projec1/models/anuncio.dart';
import 'package:projec1/pages/notepages/anuncio_view.dart';

class AnuncioCard extends StatelessWidget {
  const AnuncioCard(
      {super.key,
      required this.anuncio,
      required this.index,
      required this.anuncioApagado});

  final Anuncio anuncio;
  final int index;
  final Function(int) anuncioApagado;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AnuncioView(
                anuncio: anuncio,
                index: index,
                anuncioApagado: anuncioApagado)));
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text(
                anuncio.nome,
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
                anuncio.descricao,
                style: const TextStyle(
                  fontSize: 18,
                ),
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
