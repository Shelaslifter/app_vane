import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

// Funciones para dibujar las formas (sin cambios)
Path drawHeart(Size size) {
  final path = Path();
  path.moveTo(size.width * 0.5, size.height * 0.35);
  path.cubicTo(size.width * 0.2, size.height * 0.1, -size.width * 0.25, size.height * 0.6, size.width * 0.5, size.height);
  path.moveTo(size.width * 0.5, size.height * 0.35);
  path.cubicTo(size.width * 0.8, size.height * 0.1, size.width * 1.25, size.height * 0.6, size.width * 0.5, size.height);
  path.close();
  return path;
}
Path drawMonkey(Size size) {
  final path = Path();
  path.addOval(Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: size.width / 2.5));
  path.addOval(Rect.fromCircle(center: Offset(size.width * 0.1, size.height * 0.3), radius: size.width / 5));
  path.addOval(Rect.fromCircle(center: Offset(size.width * 0.9, size.height * 0.3), radius: size.width / 5));
  return path;
}

class FrasesPage extends StatefulWidget {
  const FrasesPage({super.key});

  @override
  State<FrasesPage> createState() => _FrasesPageState();
}

class _FrasesPageState extends State<FrasesPage> {
  // --- CAMBIO 1: Empezamos en un número alto para simular el carrusel infinito ---
  static const int _initialPage = 5000;
  late PageController _pageController;
  late ConfettiController _heartController;
  late ConfettiController _monkeyController;
  int _currentPage = _initialPage;

  final List<String> frases = const [
    'Eres la casualidad más bonita que llegó a mi vida. Te quiero mucho.',
    'No sé a dónde vamos, pero sé que quiero ir contigo a todos lados.',
    'Me encantas más que el chocolate, y eso ya es decir mucho. ❤️',
    'Gracias por todas las risas y por hacer mis días más felices.',
    'Cada momento contigo es mi favorito. Eres increíble.',
    'Eres mi changuita, mi persona favorita y mi todo. 🐒',
    'Contigo aprendí que los momentos más simples se convierten en los más especiales.',
    'Pienso en ti más veces de las que respiro al día. Te amo.',
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _initialPage);
    _pageController.addListener(() {
      if (_pageController.page?.round() != _currentPage) {
        setState(() {
          _currentPage = _pageController.page!.round();
        });
      }
    });
    _heartController = ConfettiController(duration: const Duration(seconds: 1));
    _monkeyController = ConfettiController(duration: const Duration(seconds: 1));
  }

  @override
  void dispose() {
    _pageController.dispose();
    _heartController.dispose();
    _monkeyController.dispose();
    super.dispose();
  }
  
  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      height: 10.0,
      width: isActive ? 25.0 : 10.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.white.withAlpha(138),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Un Mensaje para Ti'),
        backgroundColor: Colors.redAccent,
        foregroundColor: Colors.white,
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.redAccent.shade100,
                  Colors.pinkAccent.shade200,
                ],
              ),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                PageView.builder(
                  controller: _pageController,
                  // --- CAMBIO 2: Usamos un número muy grande para simular el infinito ---
                  itemCount: 10000,
                  itemBuilder: (context, index) {
                    // --- CAMBIO 3: Usamos el operador % para repetir la lista ---
                    final actualIndex = index % frases.length;
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(30, 30, 30, 100),
                      child: Card(
                        elevation: 8,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(20, 20, 20, 80),
                                child: Text(
                                  frases[actualIndex], // Usamos el índice calculado
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontFamily: 'cursive',
                                    fontSize: 34,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 15.0),
                              child: IconButton(
                                onPressed: () {
                                  _heartController.play();
                                  _monkeyController.play();
                                },
                                icon: const Icon(
                                  Icons.favorite,
                                  color: Colors.redAccent,
                                  size: 40,
                                )
                                .animate(
                                  key: ValueKey(_currentPage),
                                  onPlay: (controller) => controller.repeat(reverse: true),
                                )
                                .scaleXY(end: 1.2, duration: 600.ms, curve: Curves.easeInOut),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                
                Positioned(
                  bottom: 40.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(frases.length, (index) {
                      // --- CAMBIO 4: El indicador también usa el operador % ---
                      return _indicator(index == _currentPage % frases.length);
                    }),
                  ),
                ),
                Positioned(
                  left: 0,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios_new, color: Colors.white.withAlpha(178), size: 30),
                    onPressed: () => _pageController.previousPage(duration: const Duration(milliseconds: 400), curve: Curves.easeInOut),
                  ),
                ),
                Positioned(
                  right: 0,
                  child: IconButton(
                    icon: Icon(Icons.arrow_forward_ios, color: Colors.white.withAlpha(178), size: 30),
                    onPressed: () => _pageController.nextPage(duration: const Duration(milliseconds: 400), curve: Curves.easeInOut),
                  ),
                ),
              ],
            ),
          ),
          ConfettiWidget(
            confettiController: _heartController,
            blastDirectionality: BlastDirectionality.explosive,
            createParticlePath: drawHeart,
            emissionFrequency: 0.05,
            numberOfParticles: 15,
            colors: const [Colors.red, Colors.pink, Colors.redAccent],
          ),
          ConfettiWidget(
            confettiController: _monkeyController,
            blastDirectionality: BlastDirectionality.explosive,
            createParticlePath: drawMonkey,
            emissionFrequency: 0.05,
            numberOfParticles: 10,
            colors: const [Colors.brown, Color(0xFF8B4513), Color(0xFFA0522D)],
          ),
        ],
      ),
    );
  }
}