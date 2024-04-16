import 'package:flutter/material.dart';

class FaleConosco extends StatelessWidget {
  const FaleConosco({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Fale Conosco',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 8, 175, 78),
                Color.fromARGB(255, 255, 255, 255)
              ]),
        ),
        child: Center(
          child: Image.asset(
            'assets/images/wpp2.png',
            width: 300,
            height: 300,
          ),
        ),
      ),
    );
  }
}
