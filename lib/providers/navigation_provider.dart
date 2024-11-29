// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';

class NavigationProvider extends ChangeNotifier {
  final controller = SidebarXController(selectedIndex: 0, extended: true);

  bool isLoading = false;

  void loading(bool state) {
    isLoading = state;
    notifyListeners();
  }

  void notify() {
    notifyListeners();
  }
}
