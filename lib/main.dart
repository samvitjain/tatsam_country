import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tatsam_country/modules/country/country_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: const Color.fromARGB(255, 247, 250, 247),
          elevation: 0,
          titleTextStyle: GoogleFonts.playfairDisplay().copyWith(
            color: Colors.black,
            fontSize: 24,
          ),
          foregroundColor: Colors.black,
        ),
        textTheme: GoogleFonts.quicksandTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: const CountryPage(),
    );
  }
}
