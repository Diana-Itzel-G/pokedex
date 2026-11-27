import 'package:flutter/material.dart';

/// Color sólido y nombre en español para cada tipo de Pokémon.
const Map<String, (Color, String)> _tipos = {
  'normal': (Color(0xFFA8A77A), 'Normal'),
  'fire': (Color(0xFFEE8130), 'Fuego'),
  'water': (Color(0xFF6390F0), 'Agua'),
  'electric': (Color(0xFFE6BC2F), 'Eléctrico'),
  'grass': (Color(0xFF7AC74C), 'Planta'),
  'ice': (Color(0xFF7FCFCB), 'Hielo'),
  'fighting': (Color(0xFFC22E28), 'Lucha'),
  'poison': (Color(0xFFA33EA1), 'Veneno'),
  'ground': (Color(0xFFD4B261), 'Tierra'),
  'flying': (Color(0xFFA98FF3), 'Volador'),
  'psychic': (Color(0xFFF95587), 'Psíquico'),
  'bug': (Color(0xFFA6B91A), 'Bicho'),
  'rock': (Color(0xFFB6A136), 'Roca'),
  'ghost': (Color(0xFF735797), 'Fantasma'),
  'dragon': (Color(0xFF6F35FC), 'Dragón'),
  'dark': (Color(0xFF705746), 'Siniestro'),
  'steel': (Color(0xFF9EA3B5), 'Acero'),
  'fairy': (Color(0xFFD685AD), 'Hada'),
};

Color colorDeTipo(String tipo) => _tipos[tipo]?.$1 ?? const Color(0xFF9E9E9E);

String nombreDeTipo(String tipo) => _tipos[tipo]?.$2 ?? tipo;
