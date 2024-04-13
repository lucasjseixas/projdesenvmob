import 'package:flutter/material.dart';
import 'sample_card.dart';

class CardInicial extends StatelessWidget {
  const CardInicial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Card(
            child: SampleCard(cardName: 'Candidatos', icon: Icons.person),
          ),
          Card(
            child: SampleCard(cardName: 'Empresas', icon: Icons.business_sharp),
          ),
        ],
      ),
    );
  }
}
