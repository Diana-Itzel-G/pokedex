import 'package:flutter/material.dart';

/// Paleta plana: colores sólidos, sin degradados ni sombras.
class AppColores {
  static const fondo = Color(0xFFF6F5F2);
  static const superficie = Colors.white;
  static const borde = Color(0xFFE4E2DC);
  static const texto = Color(0xFF1F1F1F);
  static const textoSuave = Color(0xFF8A8780);
  static const acento = Color(0xFFE5533D);
}

ThemeData construirTema() {
  final esquema = ColorScheme.fromSeed(
    seedColor: AppColores.acento,
    primary: AppColores.acento,
    surface: AppColores.fondo,
  );

  return ThemeData(
    useMaterial3: true,
    colorScheme: esquema,
    scaffoldBackgroundColor: AppColores.fondo,
    shadowColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColores.fondo,
      foregroundColor: AppColores.texto,
      elevation: 0,
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.transparent,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: AppColores.texto,
        fontSize: 20,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.2,
      ),
    ),
  );
}
