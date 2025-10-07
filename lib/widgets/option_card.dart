import 'package:flutter/material.dart';

class OptionCard extends StatelessWidget {
  final String emoji;
  final String title;
  final String description;
  final VoidCallback onTap;

  const OptionCard({
    super.key,
    required this.emoji,
    required this.title,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          // --- CÓDIGO CORREGIDO ---
          // Reemplazamos .withOpacity() por una versión más moderna
          color: Colors.white.withAlpha(64), // Equivalente a withOpacity(0.25)
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white.withAlpha(128)), // Equivalente a withOpacity(0.5)
        ),
        child: Row(
          children: [
            Text(
              emoji,
              style: const TextStyle(fontSize: 30),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      // Equivalente a withOpacity(0.9)
                      color: Colors.white.withAlpha(230),
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, color: Colors.white),
          ],
        ),
      ),
    );
  }
}