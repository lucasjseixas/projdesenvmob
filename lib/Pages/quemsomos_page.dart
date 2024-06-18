import 'package:flutter/material.dart';
import 'package:projec1/providers/themeprovider.dart';
import 'package:provider/provider.dart';

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
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
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
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            },
          ),
        ],
      ),
      body: Center(
        child: Image.asset(
          'assets/images/emconstrucao.png',
          width: 300,
          height: 300,
        ),
      ),
    );
  }
}
