import 'package:flutter/material.dart';

class CCListProvider extends ChangeNotifier {
  List<String> _carbonCopyList = [];
  addTaskToList() {
    carbonCopyList.add('');
    notifyListeners();
  }

  changeText(int index, String text) {
    _carbonCopyList[index] = text;
  }

  List<String> get carbonCopyList => _carbonCopyList;
}
