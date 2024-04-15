import 'package:flutter/material.dart';
import 'LoginPages/candidato_login.dart';
import 'LoginPages/empresa_login.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Set<String> _selected = {'Modo Escuro'};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HOME PAGE'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(onPressed: (){}, icon: const Icon(Icons.settings))
        ]
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
            const Center(child: Text('Tema')),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: SegmentedButton(
                multiSelectionEnabled: false,
                segments: const <ButtonSegment<String>>[
                  ButtonSegment<String>(
                    value: 'Modo Escuro',
                    icon: Icon(Icons.brightness_4),
                  ),
                  ButtonSegment<String>(
                    value: 'Modo Claro',
                    icon: Icon(Icons.brightness_2),
                  ),
                ],
                selected: _selected,
                onSelectionChanged: updateSelected,
                showSelectedIcon: true,
                selectedIcon: const Icon(Icons.check),
              ),
            ),
            const Center(
              child: Text('Todos os direitos reservados ® - 2024'),
            ),
            const Divider(),
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

  PopupMenuItem _buildPopupMenuItem(String title) {
    return PopupMenuItem(
      child: Text(title),
    );
  }

  void updateSelected(Set<String> newSelection){
    setState(() {
      _selected = newSelection;
    });
  }
}
