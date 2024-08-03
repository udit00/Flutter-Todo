import 'package:flutter/material.dart';
import 'package:todo_flutter_app/Ui/Base/BaseViewModel.dart';
import 'package:todo_flutter_app/Ui/Pages/Home/models/TodoModel.dart';

class HomeViewModel extends BaseViewModel with ChangeNotifier {

  List<TodoModel> todoList = List.empty();

  void getTodoList() {
    todoList = _generateDummyList();
    notifyListeners();
  }  
  
  List<TodoModel> _generateDummyList() {
    List<TodoModel> dummyList = List.empty(growable: true);
    dummyList.add(TodoModel(id: 1, title: "UDIT", description: "", ));
    return dummyList;
  }

}