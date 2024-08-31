import 'package:flutter/material.dart';
import 'package:todo_flutter_app/Services/Utils/UtilService.dart';
import 'package:todo_flutter_app/Ui/Base/BaseViewModel.dart';
import 'package:todo_flutter_app/Ui/Pages/Home/HomeRepository.dart';
import 'package:todo_flutter_app/Ui/Pages/Home/models/TodoModel.dart';

import '../../../Api/CommonResponse.dart';

class HomeViewModel extends BaseViewModel with ChangeNotifier {

  final HomeRepository _homeRepository = HomeRepository();
  List<TodoModel> todoList = List.empty();

  void getTodoList(String? searchStr) async {
    // todoList = _generateDummyList();
    Map<String, String> params = {
      "prm_userid": "1",
      "prm_searchstr": UtilService.isNullOrEmpty(searchStr) ? "" : searchStr!,
    };
    CommonResponse apiResponse = await _homeRepository.getTodos(params);
    if(apiResponse.status == 1) {
      // List<List<LoginUserModel>> data = jsonDecode(apiResponse.data.toString());
      if(apiResponse.data != null) {
        List<dynamic> firstList = apiResponse.data as List<dynamic>;
        print(firstList);
        // LoginUserModel loginUserModel = LoginUserModel.fromJson(firstList.first as List<Map<String, dynamic>>);
        // saveUserDataToStorage(loginUserModel);
        // loginDataStream.add(loginUserModel);
      } else {
        errorStream.add("Type Cast Error");
      }
      // debugPrint(data.first.name);
    } else {
      errorStream.add(apiResponse.message.toString());
    }
    notifyListeners();
  }  
  
  // List<TodoModel> _generateDummyList() {
  //   List<TodoModel> dummyList = List.empty(growable: true);
  //   dummyList.add(TodoModel(id: 1, title: "UDIT", description: "", ));
  //   dummyList.add(TodoModel(id: 2, title: "AMIT", description: "", ));
  //   dummyList.add(TodoModel(id: 3, title: "GAURAV", description: "", ));
  //   return dummyList;
  // }

}