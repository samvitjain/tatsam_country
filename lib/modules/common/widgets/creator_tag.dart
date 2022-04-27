import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreatorTag extends StatelessWidget {
  const CreatorTag({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        'Crafted with ❤ by samvit.xyz',
        style: GoogleFonts.quicksand(
          color: const Color.fromARGB(255, 38, 45, 59),
          letterSpacing: 2,
        ),
      ),
    );
  }
}
