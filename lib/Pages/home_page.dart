import 'package:flutter/material.dart';
import 'package:projec1/pages/notepages/anuncio_page.dart';
import 'loginpages/candidato_login.dart';
import 'loginpages/empresa_login.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'SISTEMA SIVAEM',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings,
            ),
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
              child: Center(
                child: Text(
                  'SIVAEM',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            ListTile(
              title: const Text(
                'Candidatos',
              ),
              leading: const Icon(
                Icons.person,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CandidatoLoginInfo(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Empresas'),
              leading: const Icon(
                Icons.business_sharp,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EmpresaLoginInfo(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text(
                'Portal de Vagas',
              ),
              leading: const Icon(
                Icons.work,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AnuncioPage(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text(
                'Quem Somos?',
              ),
              leading: const Icon(
                Icons.info,
              ),
              onTap: () {},
            ),
            ListTile(
              title: const Text(
                'Fale Conosco',
              ),
              leading: const Icon(
                Icons.support_agent,
              ),
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
              padding: EdgeInsets.only(
                top: 400.0,
              ),
              child: Center(
                child: Text(
                  'Todos Os Direitos Reservados ® - 2024',
                ),
              ),
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
