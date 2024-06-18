import 'package:flutter/material.dart';
import 'package:projec1/providers/anuncio_provider.dart';
import 'package:projec1/providers/themeprovider.dart';
import 'package:provider/provider.dart';
import 'pages/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<ThemeProvider>(
      create: (context) => ThemeProvider(),
    )
  ], child: const App()));
}

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AnuncioProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: Provider.of<ThemeProvider>(context).themeData,
        home: const HomePage(),
      ),
    );
  }
}
