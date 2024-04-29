// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/data/peli_data.dart';
import 'package:flutter_application_2/entities/pelicula.dart';
import 'package:flutter_application_2/screens/peli_detail_screen.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home';
  final List<Pelicula> pelis = peliculas;

  HomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies'),
      ),
      body: const PelisView(),
    );
  }
}

class PelisView extends StatelessWidget {
  const PelisView({Key? key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: peliculas.length,
      itemBuilder: (context, index) {
        final peli = peliculas[index];
        return Card(
          child: ListTile(
            leading: CircleAvatar( // miniatura circular god
              backgroundImage: NetworkImage(peli.imagen ?? ''), // vacio si es q no hay nada
            ),
            title: Text(peli.nombre),
            subtitle: Text('Director: ${peli.director}'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              context.pushNamed(PeliDetailScreen.name, extra: peli); // voy a la pantalla y mando como parametro la pelicula
            },
          ),
        );
      },
    );
  }
}