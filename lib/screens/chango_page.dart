import 'package:app_de_amor/screens/gallery_viewer_screen.dart'; // 1. Importa el nuevo visor unificado
import 'package:flutter/material.dart';

class ChangoPage extends StatelessWidget {
  const ChangoPage({super.key});

  final List<String> changoPaths = const [
    'assets/changos/chango1.jpg',
    'assets/changos/chango2.jpg',
    'assets/changos/chango3.jpg',
    // ... agrega aquí las rutas a todas tus fotos de changos
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Galería de Changuitos 🐵'),
        backgroundColor: Colors.brown,
        foregroundColor: Colors.white,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: changoPaths.length,
        itemBuilder: (context, index) {
          final path = changoPaths[index];
          // Esta galería no maneja videos, así que el código es más simple.

          return GestureDetector(
            onTap: () {
              // 2. Al tocar, navega al nuevo visor unificado
              Navigator.push(context, MaterialPageRoute(
                builder: (_) => GalleryViewerScreen(
                  galleryItems: changoPaths, // Le pasamos la lista completa de changos
                  initialIndex: index,     // Le decimos en qué foto empezar
                ),
              ));
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              // Mantenemos la animación Hero para la transición inicial
              child: Hero(
                tag: path,
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