import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Mytheme{

  static ThemeData lightTheme(BuildContext context) => ThemeData(
    primarySwatch: Colors.deepPurple,
   fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: Colors.white,
      canvasColor: creamColor,
      buttonColor: bluish,
      accentColor: Colors.black,
      appBarTheme: AppBarTheme(
      color: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        textTheme: Theme.of(context).textTheme
  ),
  );
  static ThemeData darkTheme(BuildContext context) => ThemeData(
    brightness: Brightness.dark,
      fontFamily: GoogleFonts.poppins().fontFamily,
    cardColor: Colors.black,
    canvasColor: darkcreamcolor,
    buttonColor: lightBluishColor,
    accentColor: Colors.white,
    appBarTheme: AppBarTheme(
        color: Colors.black,
        elevation: 0.0,
        toolbarTextStyle: TextStyle(color: Colors.white),
        iconTheme: IconThemeData(color: Colors.black),



    )
  );

  static Color creamColor = Color(0xfff5f5f5);
  static Color darkcreamcolor = Colors.grey.shade900 ;
  static Color bluish = Color(0xff403b58);
  static Color lightBluishColor = Colors.indigo.shade500;
}