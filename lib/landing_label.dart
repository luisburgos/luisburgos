import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingLabel extends StatelessWidget {
  const LandingLabel(
    this.text, {
    Key? key,
    this.color = Colors.white,
  }) : super(key: key);

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.getFont('Lato').copyWith(
        color: color,
      ),
    );
  }
}
