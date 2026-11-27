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

  final bordeRedondeado = OutlineInputBorder(
    borderRadius: BorderRadius.circular(14),
    borderSide: const BorderSide(color: AppColores.borde),
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
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColores.superficie,
      hintStyle: const TextStyle(color: AppColores.textoSuave),
      prefixIconColor: AppColores.textoSuave,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      border: bordeRedondeado,
      enabledBorder: bordeRedondeado,
      focusedBorder: bordeRedondeado.copyWith(
        borderSide: const BorderSide(color: AppColores.acento, width: 1.5),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 61, 151, 229),
        foregroundColor: Colors.white,
        elevation: 0,
        minimumSize: const Size(56, 54),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColores.acento,
    ),
  );
}
