import 'package:flutter/material.dart';
import 'LoginPages/candidato_login.dart';
import 'LoginPages/empresa_login.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HOME PAGE'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.pink,
              ),
              child: Center(child: Text('SIVAEM')),
            ),
            ListTile(
              title: const Text('Candidato'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Empresas'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Quem Somos?'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Fale Conosco'),
              onTap: () {},
            ),
            const Divider(),
            const Center(
              child: Text('Todos os direitos reservados ® - 2024'),
            ),
          ],
        ),
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
