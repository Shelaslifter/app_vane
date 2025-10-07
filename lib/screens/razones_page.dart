import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class RazonesPage extends StatefulWidget {
  const RazonesPage({super.key});

  @override
  State<RazonesPage> createState() => _RazonesPageState();
}

class _RazonesPageState extends State<RazonesPage> {
  final ScrollController _scrollController = ScrollController();
  double _scrollOffset = 0.0;

  final List<String> razones = const [
    'Por tu increíble forma de ser.',
    'Porque me haces reír como nadie.',
    'Por cómo me cuidas y te preocupas por mí.',
    'Porque cada día contigo es una aventura.',
    'Por tu sonrisa que ilumina todo.',
    'Porque eres la persona más inteligente que conozco.',
    'Por apoyarme en todas mis locuras.',
    'Porque me haces querer ser una mejor persona.',
    'Porque amo nuestros momentos de changuitos.',
    'Simplemente... porque eres tú.',
  ];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _scrollOffset = _scrollController.offset;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Razones por las que te amo'),
        backgroundColor: Colors.deepPurpleAccent,
        foregroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          Positioned(
            top: -_scrollOffset * 0.3,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/fondo_razones.jpg',
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height,
              // --- CÓDIGO CORREGIDO ---
              color: Colors.black.withAlpha(102), // Equivalente a withOpacity(0.4)
              colorBlendMode: BlendMode.darken,
            ),
          ),
          ListView.builder(
            controller: _scrollController,
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            itemCount: razones.length,
            itemBuilder: (context, index) {
              return Card(
                // --- CÓDIGO CORREGIDO ---
                color: Colors.white.withAlpha(217), // Equivalente a withOpacity(0.85)
                margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.deepPurpleAccent,
                    child: Text(
                      '${index + 1}',
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  title: Text(
                    razones[index],
                    style: GoogleFonts.lato(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ).animate()
               .fadeIn(duration: 500.ms, delay: (100 * index).ms)
               .slideX(begin: -0.5, duration: 400.ms, curve: Curves.easeOut);
            },
          ),
        ],
      ),
    );
  }
}