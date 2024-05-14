import 'package:flutter/material.dart';
import 'package:projec1/pages//faleconosco_page.dart';
import 'package:projec1/pages/notepages/anuncio_page.dart';
import 'package:projec1/pages/quemsomos_page.dart';
import 'package:projec1/providers/anuncio_provider.dart';
import 'package:provider/provider.dart';
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
                child: Consumer<AnuncioProvider>(
                  builder: (context, anuncioProvider, child) {
                    final anuncios = anuncioProvider.anuncioList;
                    return ListView.builder(
                      itemCount: anuncios.length,
                      itemBuilder: (context, index) {
                        final anuncio = anuncios[index];
                        return Card(
                          child: ListTile(
                            title: Text(anuncio.nome),
                            subtitle: Text(anuncio.descricao),
                            leading: const Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.edit)),
                                IconButton(
                                  onPressed: () {
                                    Provider.of<AnuncioProvider>(context,
                                            listen: false)
                                        .removeAnuncio(anuncio);
                                  },
                                  icon: const Icon(Icons.delete),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
