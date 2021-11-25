import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testapp/pages/cart_page.dart';
import 'package:testapp/pages/home_detail_page.dart';
import 'package:testapp/pages/home_page.dart';
import 'package:testapp/pages/login_pages.dart';
import 'package:testapp/utils/routes.dart';
import 'package:testapp/widgets/themes.dart';

void main() {
  runApp(MyApp());
}

 class MyApp extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
     int days = 30;
     return MaterialApp(
       themeMode: ThemeMode.system,
       theme: Mytheme.lightTheme(context),
       darkTheme: Mytheme.darkTheme(context),
       initialRoute: MyRoutes.homeRoute ,
       routes: {
         "/": (context) => LoginPage(),
         MyRoutes.homeRoute: (context) => Homepage(),
         MyRoutes.loginRoute: (context) => LoginPage(),
         MyRoutes.cartRoute:(context)=> CartPage()

       },

     );
   }
 }

