import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

textwidget ({
  required String text,
  double ? s1,
  FontWeight ? wt,
  Color ? color
}) {
  return Text(text,style: GoogleFonts.poppins(
    fontSize: s1,
    fontWeight: wt,
      color: color
  ),);
}

