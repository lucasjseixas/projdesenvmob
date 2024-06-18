import 'package:flutter/material.dart';
import 'package:projec1/providers/themeprovider.dart';
import 'package:provider/provider.dart';

class RecuperarSenha extends StatelessWidget {
  const RecuperarSenha({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Pagina de recuperação de dados',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                Provider.of<ThemeProvider>(context, listen: false)
                    .toggleTheme();
              },
              icon: Consumer<ThemeProvider>(
                builder: (context, themeProvider, _) => themeProvider.isDarkMode
                    ? const Icon(Icons.wb_sunny)
                    : const Icon(Icons.nightlight_round),
              ),
            ),
            Switch(
              value: Provider.of<ThemeProvider>(context).isDarkMode,
              onChanged: (value) {
                Provider.of<ThemeProvider>(context, listen: false)
                    .toggleTheme();
              },
            ),
          ],
        ),
        body: const Center(
          child: Image(
            image: AssetImage('assets/images/clownpassword.png'),
            width: 300,
            height: 300,
          ),
        ));
  }
}
