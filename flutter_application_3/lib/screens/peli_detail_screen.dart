import 'package:flutter/material.dart';
import 'package:flutter_application_2/entities/pelicula.dart';

class PeliDetailScreen extends StatelessWidget {
  static const String name = 'peli_detail_screen';
  final Pelicula peli;
  const PeliDetailScreen({super.key, required this.peli});

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Detail'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (peli.imagen != null)
              Image.network(peli.imagen!),
            Text('Title: ${peli.nombre}'),
            Text('Director: ${peli.director}'),
            Text('Year: ${peli.ano}'),
          ],
        ),
      ),
    );
  }
}