import 'package:flutter/material.dart';
import 'package:projec1/models/anuncio.dart';
import 'package:projec1/pages/notepages/anuncio_card.dart';
import 'package:projec1/pages/notepages/criar_anuncio.dart';
import 'package:projec1/providers/themeprovider.dart';
import 'package:provider/provider.dart';

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
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            },
            icon: Consumer<ThemeProvider>(
              builder: (context, themeProvider, _) => themeProvider.isDarkMode
                  ? const Icon(Icons.wb_sunny)
                  : const Icon(Icons.nightlight_round),
            ),
          ),
          Switch(
            value: Provider.of<ThemeProvider>(context).isDarkMode,
            onChanged: (value) {
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: anuncios.length,
        itemBuilder: (context, index) {
          return AnuncioCard(
              anuncio: anuncios[index],
              index: index,
              anuncioApagado: anuncioApagado);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        tooltip: 'Adicionar Vaga',
        label: const Text('Adicionar'),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) =>
                  CriarAnuncio(novoAnuncioCriado: novoAnuncioCriado),
            ),
          );
        },
        icon: const Icon(Icons.add),
      ),
    );
  }

  void novoAnuncioCriado(Anuncio anuncio) {
    anuncios.add(anuncio);
    setState(() {});
  }

  void anuncioApagado(int index) {
    anuncios.removeAt(index);
    setState(() {});
  }
}
