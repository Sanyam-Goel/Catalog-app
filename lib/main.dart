import 'package:flutter/material.dart';
import 'package:tutorials/pages/cart_page.dart';
import 'package:tutorials/pages/home_page.dart';
import 'package:tutorials/pages/login_page.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:tutorials/utils/routes.dart';
import 'package:tutorials/widgets/themes.dart';

void main(){
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.homeRoute,
      routes: {
       "/" : (context) => const HomePage(),
       MyRoutes.homeRoute : (context) => const HomePage(),
       MyRoutes.loginRoute : (context) => const LoginPage(),
       MyRoutes.cartRoute : (context) => const CartPage(),
      },
    );
  }
}

