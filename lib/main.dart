import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/screen/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'In-News',
      debugShowCheckedModeBanner: false,
      // darkTheme: ThemeData(
      //   backgroundColor: Colors.white,
      //     brightness: Brightness.dark,
      //     primarySwatch: Colors.blue,
      //     textTheme: textTheme,
      //     inputDecorationTheme: InputDecorationTheme(
      //       filled: true,
      //       fillColor: Colors.grey.shade800,
      //       enabledBorder: OutlineInputBorder(
      //           borderRadius: BorderRadius.circular(8),
      //           borderSide: BorderSide(color: Colors.transparent)),
      //       contentPadding: EdgeInsets.symmetric(horizontal: 16),
      //       focusedBorder: OutlineInputBorder(
      //           borderRadius: BorderRadius.circular(8),
      //           borderSide: BorderSide(color: Colors.transparent)),
      //     )),
      theme: ThemeData(
        backgroundColor: Colors.white,
       //   primarySwatch: Colors.blue,
          textTheme: textTheme,
          appBarTheme: AppBarTheme(color: Colors.blue.shade900),
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: Colors.grey.shade100,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.transparent)),
            contentPadding: EdgeInsets.symmetric(horizontal: 16),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.transparent)),
          )),
      home: Home(),
    );
  }
}

var textTheme = TextTheme(
  headline1: GoogleFonts.montserrat(
      fontSize: 97, fontWeight: FontWeight.w300, letterSpacing: -1.5),
  headline2: GoogleFonts.montserrat(
      fontSize: 61, fontWeight: FontWeight.w300, letterSpacing: -0.5),
  headline3: GoogleFonts.montserrat(fontSize: 48, fontWeight: FontWeight.w400),
  headline4: GoogleFonts.montserrat(
      fontSize: 34, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  headline5: GoogleFonts.montserrat(fontSize: 24, fontWeight: FontWeight.w400),
  headline6: GoogleFonts.montserrat(
      fontSize: 20, fontWeight: FontWeight.w500, letterSpacing: 0.15),
  subtitle1: GoogleFonts.montserrat(
      fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.15),
  subtitle2: GoogleFonts.montserrat(
      fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
  bodyText1: GoogleFonts.montserrat(
      fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
  bodyText2: GoogleFonts.montserrat(
      fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  button: GoogleFonts.montserrat(
      fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
  caption: GoogleFonts.montserrat(
      fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
  overline: GoogleFonts.montserrat(
      fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
);
