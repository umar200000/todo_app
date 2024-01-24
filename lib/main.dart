import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/widgets_file/myHomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: false,
        primarySwatch: Colors.amber,
        fontFamily: GoogleFonts.montserrat().fontFamily,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}
