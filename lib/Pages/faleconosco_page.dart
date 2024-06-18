import 'package:flutter/material.dart';
import 'package:projec1/providers/themeprovider.dart';
import 'package:provider/provider.dart';

class FaleConosco extends StatelessWidget {
  const FaleConosco({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Fale Conosco',
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
          'assets/images/wpp2.png',
          width: 300,
          height: 300,
        ),
      ),
    );
  }
}
