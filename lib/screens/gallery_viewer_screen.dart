import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

// Este es el nuevo visor que puede manejar tanto imágenes como videos.
class GalleryViewerScreen extends StatefulWidget {
  final List<String> galleryItems;
  final int initialIndex;

  const GalleryViewerScreen({
    super.key,
    required this.galleryItems,
    required this.initialIndex,
  });

  @override
  State<GalleryViewerScreen> createState() => _GalleryViewerScreenState();
}

class _GalleryViewerScreenState extends State<GalleryViewerScreen> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Usamos un PageView para poder deslizar entre los elementos
          PageView.builder(
            controller: _pageController,
            itemCount: widget.galleryItems.length,
            itemBuilder: (context, index) {
              final path = widget.galleryItems[index];
              final bool isVideo = path.endsWith('.mp4');

              if (isVideo) {
                return _VideoItem(videoPath: path);
              } else {
                return _ImageItem(imagePath: path);
              }
            },
          ),
          // Botón para cerrar
          Positioned(
            top: 40,
            left: 10,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.white, size: 30),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          // Flecha izquierda
          Positioned.fill(
            left: 10,
            child: Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white70),
                onPressed: () {
                  _pageController.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                  );
                },
              ),
            ),
          ),
          // Flecha derecha
          Positioned.fill(
            right: 10,
            child: Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: const Icon(Icons.arrow_forward_ios, color: Colors.white70),
                onPressed: () {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Widget interno para mostrar las imágenes
class _ImageItem extends StatelessWidget {
  final String imagePath;
  const _ImageItem({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      child: Hero(
        tag: imagePath,
        child: Image.asset(imagePath),
      ),
    );
  }
}

// Widget interno para manejar la lógica de cada video
class _VideoItem extends StatefulWidget {
  final String videoPath;
  const _VideoItem({required this.videoPath});

  @override
  State<_VideoItem> createState() => __VideoItemState();
}

class __VideoItemState extends State<_VideoItem> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoPath)
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
        _controller.setLooping(true); // --- HACE QUE EL VIDEO SE REPITA ---
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _controller.value.isInitialized
          ? AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            )
          : const CircularProgressIndicator(),
    );
  }
}
