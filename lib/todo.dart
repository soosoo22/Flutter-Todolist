import 'package:flutter/cupertino.dart';

class TodoItem {
  String name = '';
  bool isChecked = false;
  TextEditingController controller= TextEditingController();

  TodoItem({required this.name});
}