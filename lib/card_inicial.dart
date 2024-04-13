import 'package:flutter/material.dart';
import '/depreciado/sample_card.dart';

class CardInicial extends StatelessWidget {
  const CardInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
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
