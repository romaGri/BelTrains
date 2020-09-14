import 'package:bel_trains/core/common/index.dart';
import 'package:flutter/cupertino.dart';

class ShellProviderModel extends ChangeNotifier {
  final List<Pages> pages = [
    Pages.shell,
  ];

  int selectedItemIndex = 0;

  Pages get selectedItem => pages[selectedItemIndex];

  void onTappedItem(int index) {
    selectedItemIndex = index;
    notifyListeners();
  }
}
