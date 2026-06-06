import 'package:flutter/material.dart';

class UIProvider extends ChangeNotifier {

  // Índex seleccionat del BottomNavigationBar
  int _selectedMenuOpt = 0;

  // Getter
  int get selectedMenuOpt => _selectedMenuOpt;

  // Setter
  set selectedMenuOpt(int index) {

    _selectedMenuOpt = index;

    // Notifica els widgets que han de reconstruir-se
    notifyListeners();
  }
}