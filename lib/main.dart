import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scan/providers/ui_provider.dart';
import 'package:qr_scan/screens/home_screen.dart';
import 'package:qr_scan/screens/mapa_screen.dart';

void main() {

  runApp(

    MultiProvider(

      providers: [

        // Provider que gestiona la pestanya seleccionada
        ChangeNotifierProvider(
          create: (_) => UIProvider(),
        ),

      ],

      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      debugShowCheckedModeBanner: false,

      title: 'QR Reader',

      // Pantalla inicial
      initialRoute: 'home',

      // Rutes de l'aplicació
      routes: {

        'home': (_) => const HomeScreen(),

        'mapa': (_) => MapaScreen(),
      },

      theme: ThemeData(

        // Color principal de l'aplicació
        colorScheme: ColorScheme.light().copyWith(
          primary: Colors.deepPurple,
        ),

        // Configuració dels FloatingActionButton
        floatingActionButtonTheme:
            const FloatingActionButtonThemeData(
          backgroundColor: Colors.deepPurple,
        ),
      ),
    );
  }
}