import 'package:flutter/material.dart';
import 'package:projec1/pages//faleconosco_page.dart';
import 'package:projec1/pages/notepages/anuncio_page.dart';
import 'package:projec1/pages/quemsomos_page.dart';
import 'loginpages/candidato_login.dart';
import 'loginpages/empresa_login.dart';
import 'package:projec1/data/cardmain_data.dart';

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
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const QuemSomos()));
              },
            ),
            ListTile(
              title: const Text(
                'Fale Conosco',
              ),
              leading: const Icon(
                Icons.support_agent,
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const FaleConosco()));
              },
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
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 37, 60, 78),
                  Color.fromARGB(255, 15, 22, 20),
                ],
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Bem vindo a Plataforma SIVAEM',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  children: cardMainData.keys.map((String key) {
                    final cardMain = cardMainData[key];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 2),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Container(
                            height: 150,
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    height: 120,
                                    width: 120,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/search.png'),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        cardMain!.campo1,
                                        style: const TextStyle(
                                            color: Color.fromARGB(
                                                108, 150, 150, 238)),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        cardMain.campo2,
                                        style: const TextStyle(
                                            color: Color.fromARGB(
                                                255, 185, 149, 149)),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
