import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Efetue o LOGIN para continuar'),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.engineering),
            tooltip: 'Opções',
            onPressed: () => {},
          ),
        ],
      ),
      body: const CardInicial(),
    );
  }
}

class CardInicial extends StatelessWidget {
  const CardInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Card(
            child: _SampleCard(cardName: 'Candidatos', icon: Icons.person),
          ),
          Card(
            child:
                _SampleCard(cardName: 'Empresas', icon: Icons.business_sharp),
          ),
        ],
      ),
    );
  }
}

class _SampleCard extends StatelessWidget {
  const _SampleCard({required this.cardName, required this.icon});
  final String cardName;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        splashColor: const Color.fromARGB(255, 166, 33, 243).withAlpha(30),
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
