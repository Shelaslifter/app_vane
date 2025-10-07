import 'package:app_de_amor/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// --- CONFIGURACIÓN PRINCIPAL DE LA APP ---
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Para mi Amor',
      debugShowCheckedModeBanner: false, // Quita la cinta de "Debug"
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pinkAccent),
        useMaterial3: true,
        textTheme: GoogleFonts.latoTextTheme(),
      ),
      // La pantalla inicial ahora se importa desde su propio archivo.
      home: const HomePage(),
    );
  }
}
