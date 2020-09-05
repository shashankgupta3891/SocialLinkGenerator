import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class CCListModel extends ChangeNotifier {
  List<String> carbonCopyList = [];
  addTaskToList() {
    carbonCopyList.add('');
    notifyListeners();
  }
}
