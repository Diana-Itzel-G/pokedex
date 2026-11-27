import 'package:flutter/material.dart';

import 'screens/pokedex_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const MiApp());
}

class MiApp extends StatelessWidget {
  const MiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokédex mínima',
      debugShowCheckedModeBanner: false,
      theme: construirTema(),
      home: const PokedexScreen(),
    );
  }
}

