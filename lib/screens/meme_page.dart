import 'package:app_de_amor/screens/detail_screen.dart';
import 'package:flutter/material.dart';

class MemePage extends StatelessWidget {
  const MemePage({super.key});

  // --- CAMBIO IMPORTANTE AQUÍ ---
  // Ahora es una lista de rutas a tus imágenes locales
  final List<String> memePaths = const [
    'assets/memes/meme1.jpg', // Asegúrate de que los nombres coincidan
    'assets/memes/meme2.png',
    'assets/memes/meme3.jpg',
    // ... agrega las rutas de todas tus imágenes de memes aquí
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuestros Memes 😂'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: memePaths.length,
        itemBuilder: (context, index) {
          final path = memePaths[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                // Le pasamos la ruta de la imagen local a la pantalla de detalle
                builder: (_) => DetailScreen(
                  imagePath: path,
                  heroTag: path, // El tag para la animación sigue siendo la ruta
                ),
              ));
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Hero(
                tag: path,
                // --- CAMBIO IMPORTANTE AQUÍ ---
                // Reemplazamos Image.network por Image.asset
                child: Image.asset(
                  path,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}