import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:navigation_pages/views/detail_page.dart';
import 'package:navigation_pages/views/home_page.dart';
import 'package:navigation_pages/views/login_page.dart';
import 'package:navigation_pages/views/register_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:
      ThemeData(
        fontFamily: GoogleFonts.adamina().fontFamily,
          useMaterial3: false
      ),
      initialRoute: 'login',
      routes: {
        '/':(context)=>HomePage(),
        'login':(context)=>LoginPage(),
        'register':(context)=>RegisterPage(),
      },
      // home: LoginPage(),
    ),
  );
}
