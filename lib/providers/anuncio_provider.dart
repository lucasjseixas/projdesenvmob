import 'package:flutter/material.dart';
import 'package:projec1/models/anuncio.dart';

class AnuncioProvider extends ChangeNotifier {
  final List<Anuncio> anuncioList = [];

  void adicionaAnuncio(String nome, String descricao) {
    anuncioList.add(Anuncio(nome: nome, descricao: descricao));
    notifyListeners();
  }

  void removeAnuncio(Anuncio anuncio) {
    anuncioList.remove(anuncio);
    notifyListeners();
  }
}
