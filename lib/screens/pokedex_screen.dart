import 'package:flutter/material.dart';

import '../models/pokemon.dart';
import '../services/pokeapi_service.dart';
import '../theme/tipos.dart';

class PokedexScreen extends StatefulWidget {
  const PokedexScreen({super.key});

  @override
  State<PokedexScreen> createState() => _PokedexScreenState();
}

class _PokedexScreenState extends State<PokedexScreen> {
  final _controlador = TextEditingController();
  Future<Pokemon>? _futuroPokemon;

  void _buscar() {
    final texto = _controlador.text.trim();

    if (texto.isEmpty) return;

    setState(() {
      _futuroPokemon = obtenerPokemon(texto);
    });
  }

  @override
  void dispose() {
    _controlador.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokédex'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 16,
        ),
        child: Column(
          children: [
            TextField(
              controller: _controlador,
              decoration: const InputDecoration(
                labelText: 'Nombre o número del Pokémon',
                border: OutlineInputBorder(),
              ),
              textInputAction: TextInputAction.search,
              onSubmitted: (_) => _buscar(),
            ),

            const SizedBox(height: 12),

            FilledButton(
              onPressed: _buscar,
              child: const Text('Buscar'),
            ),

            const SizedBox(height: 24),

            Expanded(
              child:
                  _futuroPokemon == null
                      ? const Center(
                        child: Text(
                          'Busca tu Pokémon favorito',
                        ),
                      )
                      : FutureBuilder<Pokemon>(
                        future: _futuroPokemon,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }

                          if (snapshot.hasError) {
                            return Center(
                              child: Text(
                                snapshot.error.toString().replaceFirst(
                                  'Exception: ',
                                  '',
                                ),
                                style: const TextStyle(
                                  color: Colors.red,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            );
                          }

                          final pokemon = snapshot.data!;

                          return SingleChildScrollView(
                            child: Card(
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  children: [
                                    if (pokemon.imagen.isNotEmpty)
                                      Image.network(
                                        pokemon.imagen,
                                        height: 200,
                                      ),

                                    const SizedBox(height: 12),

                                    Text(
                                      '#${pokemon.id}',
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.grey,
                                      ),
                                    ),

                                    const SizedBox(height: 4),

                                    Text(
                                      pokemon.nombre.toUpperCase(),
                                      style: const TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    const SizedBox(height: 12),

                                    Wrap(
                                      spacing: 8,
                                      children: [
                                        for (final tipo in pokemon.tipos)
                                          Chip(
                                            backgroundColor:
                                                colorDeTipo(tipo),
                                            label: Text(
                                              nombreDeTipo(tipo),
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
            ),
          ],
        ),
      ),
    );
  }
}