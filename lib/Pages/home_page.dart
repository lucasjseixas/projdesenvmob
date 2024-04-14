import 'package:flutter/material.dart';
import 'LoginPages/candidato_login.dart';
import 'LoginPages/empresa_login.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('HOME PAGE'),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.engineering),
            tooltip: 'Opções',
            onPressed: () => {},
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EmpresaLoginInfo()),
                  );
                },
                icon: const Icon(Icons.business),
                label: const Text('Empresas'),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CandidatoLoginInfo()),
                  );
                },
                icon: const Icon(Icons.person),
                label: const Text('Candidatos'),
              )
            ],
          ),
        ],
      ),
    );
  }
}
