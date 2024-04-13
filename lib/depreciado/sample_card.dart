import 'package:flutter/material.dart';

class SampleCard extends StatelessWidget {
  const SampleCard({super.key, required this.cardName, required this.icon});
  final String cardName;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        splashColor: const Color.fromARGB(255, 28, 165, 96).withAlpha(40),
        onTap: () {},
        child: SizedBox(
          width: 300,
          height: 100,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon),
                const SizedBox(height: 8),
                Text(cardName),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
