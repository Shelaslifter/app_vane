import 'dart:async';
import 'package:app_de_amor/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    // Creamos un temporizador que durará 3 segundos.
    Timer(const Duration(seconds: 3), () {
      // Después de los 3 segundos, navegamos a la HomePage.
      // Usamos 'pushReplacement' para que no se pueda volver atrás a esta pantalla.
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Usamos el mismo degradado para una apariencia consistente.
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 255, 175, 203),
              Color.fromARGB(255, 255, 110, 161),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Un changuito que late como un corazón.
              const Text(
                '🐒',
                style: TextStyle(fontSize: 100),
              ).animate(onPlay: (controller) => controller.repeat())
               .scaleXY(end: 1.2, duration: 600.ms, curve: Curves.easeIn)
               .then()
               .scaleXY(end: 1, duration: 600.ms, curve: Curves.easeOut),

              const SizedBox(height: 20),

              // Texto que aparece suavemente.
              Text(
                'Preparando una\nsorpresa para ti...',
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ).animate().fadeIn(delay: 500.ms, duration: 800.ms),
            ],
          ),
        ),
      ),
    );
  }
}
