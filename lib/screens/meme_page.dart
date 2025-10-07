import 'package:app_de_amor/screens/gallery_viewer_screen.dart';
import 'package:flutter/material.dart';

class MemePage extends StatelessWidget {
  const MemePage({super.key});

  final List<String> memePaths = const [
    'assets/memes/amor1.jpg',
    'assets/memes/amor2.jpg',
    'assets/memes/amor3.jpg',
    'assets/memes/amor4.jpg',
    'assets/memes/amor5.jpg',
    'assets/memes/amor6.jpg',
    'assets/memes/amor7.jpg',
    'assets/memes/amor8.jpg',
    'assets/memes/amor9.jpg',
    'assets/memes/amor10.jpg',
    'assets/memes/amor11.jpg',
    'assets/memes/amor12.jpg',
    'assets/memes/amor13.jpg',
    'assets/memes/amor14.jpg',
    'assets/memes/amor15.jpg',
    'assets/memes/amor16.mp4',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fotos Nuestras 🐵'),
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
          final bool isVideo = path.endsWith('.mp4');

          return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (_) => GalleryViewerScreen(
                  galleryItems: memePaths, 
                  initialIndex: index,    
                ),
              ));
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: isVideo
                  ? Stack(
                      fit: StackFit.expand,
                      alignment: Alignment.center,
                      children: [
                        Container(color: Colors.black),
                        const Icon(Icons.play_circle_outline, color: Colors.white, size: 50),
                      ],
                    )
                  : Hero( 
                      tag: path,
                      child: Image.asset(path, fit: BoxFit.cover),
                    ),
            ),
          );
        },
      ),
    );
  }
}