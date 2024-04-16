import 'package:flutter/material.dart';

class QuemSomos extends StatelessWidget {
  const QuemSomos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Quem Somos?',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 196, 183, 4),
                Color.fromARGB(255, 0, 0, 0)
              ]),
        ),
        child: Center(
          child: Image.asset(
            'assets/images/emconstrucao.png',
            width: 300,
            height: 300,
          ),
        ),
      ),
    );
  }
}
