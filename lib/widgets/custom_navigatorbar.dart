import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scan/providers/ui_provider.dart';

class CustomNavigationBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    // Obtenim el provider
    final uiProvider = Provider.of<UIProvider>(context);

    return BottomNavigationBar(

      elevation: 0,

      currentIndex: uiProvider.selectedMenuOpt,

      // Quan l'usuari canvia de pestanya
      onTap: (index) {

        uiProvider.selectedMenuOpt = index;
      },

      items: const <BottomNavigationBarItem>[

        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          label: 'Mapa',
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.compass_calibration),
          label: 'Direccions',
        ),
      ],
    );
  }
}