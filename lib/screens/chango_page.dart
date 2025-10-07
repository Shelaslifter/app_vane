import 'package:app_de_amor/screens/detail_screen.dart';
import 'package:flutter/material.dart';

class ChangoPage extends StatelessWidget {
  const ChangoPage({super.key});

  final List<String> changoPaths = const [
    'assets/changos/chango1.jpg',
    'assets/changos/chango2.jpg',
    'assets/changos/chango3.jpg',
    'assets/changos/changos4.jpg',
    'assets/changos/changos5.jpg',
    'assets/changos/changos6.jpg',
    'assets/changos/changos7.jpg',
    
    // Asegúrate de que los nombres de archivo sean correctos
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
          return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                // --- CÓDIGO CORREGIDO AQUÍ ---
                // Quitamos el parámetro 'imageUrl' que sobraba
                builder: (_) => DetailScreen(
                  imagePath: path,
                  heroTag: path,
                ),
              ));
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
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