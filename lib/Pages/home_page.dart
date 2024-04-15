import 'package:flutter/material.dart';
import 'loginpages/candidato_login.dart';
import 'loginpages/empresa_login.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SISTEMA SIVAEM'),
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
            /*
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
              ),*/
            const Padding(
              padding: EdgeInsets.only(top: 400.0),
              child: Center(
                child: Text('Todos Os Direitos Reservados ® - 2024'),
              ),
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

  /*
    PopupMenuItem _buildPopupMenuItem(String title) {
      return PopupMenuItem(
        child: Text(title),
      );
    }
  */
  /*
    Set<String> _selected = {'Modo Escuro'};
    void updateSelected(Set<String> newSelection) {
      setState(() {
        _selected = newSelection;
      });
    }
  */
}
