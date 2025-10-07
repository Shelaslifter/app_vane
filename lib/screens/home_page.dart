import 'package:app_de_amor/screens/chango_page.dart';
import 'package:app_de_amor/screens/frases_page.dart';
import 'package:app_de_amor/screens/meme_page.dart';
import 'package:app_de_amor/screens/razones_page.dart';
import 'package:app_de_amor/widgets/option_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 255, 175, 203),
              Color.fromARGB(255, 255, 110, 161),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Para Mi Amor ❤️',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.pacifico(
                      fontSize: 42,
                      color: Colors.white,
                    ),
                  )
                  .animate()
                  .fadeIn(delay: 300.ms, duration: 500.ms)
                  .then(delay: 200.ms)
                  .animate(onPlay: (controller) => controller.repeat(reverse: true))
                  .scaleXY(end: 1.1, duration: 1500.ms, curve: Curves.easeInOut),
                  
                  const SizedBox(height: 10),
                  Text(
                    'Elige una sorpresa:',
                    style: GoogleFonts.lato(
                      fontSize: 20,
                      color: Colors.white70,
                    ),
                  ).animate().fadeIn(delay: 500.ms, duration: 500.ms),
                  const SizedBox(height: 50),
                  Column(
                    children: [
                      OptionCard(
                        emoji: '🐵',
                        title: 'Galería de monitos',
                        description: 'monitos.',
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ChangoPage())),
                      ),
                      const SizedBox(height: 20),
                      OptionCard(
                        emoji: '💌',
                        title: 'Razones por las que te amo',
                        description: 'Una pequeña lista de un gran sentimiento.',
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const RazonesPage())),
                      ),
                      const SizedBox(height: 20),
                      OptionCard(
                        emoji: '💖',
                        title: 'Frases de Amor',
                        description: 'Mensajitos pa ti.',
                        // --- ERROR CORREGIDO AQUÍ ---
                        // Cambiamos 'FrasePage' por 'FrasesPage'
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const FrasesPage())),
                      ),
                      const SizedBox(height: 20),
                      OptionCard(
                        emoji: '🐵',
                        title: 'Fotos Nuestras',
                        description: 'Tú y yo mi amor.',
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const MemePage())),
                      ),
                    ].animate(interval: 200.ms)
                     .slideY(begin: 0.5, end: 0, duration: 400.ms, curve: Curves.easeOut)
                     .fadeIn(duration: 400.ms),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}