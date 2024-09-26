import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:navigation_pages/views/detail_page.dart';
import 'package:navigation_pages/views/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:
      ThemeData(
        fontFamily: GoogleFonts.raleway().fontFamily,
          useMaterial3: false
      ),
      home: HomePage(),
    ),
  );
}
