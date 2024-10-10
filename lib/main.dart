import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:navigation_pages/firebase_options.dart';
import 'package:navigation_pages/views/detail_page.dart';
import 'package:navigation_pages/views/home_page.dart';
import 'package:navigation_pages/views/login_page.dart';
import 'package:navigation_pages/views/register_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

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
