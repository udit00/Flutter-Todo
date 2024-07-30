import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:todo_flutter_app/Api/Api.dart';
import 'package:todo_flutter_app/Api/CommonResponse.dart';
import 'package:todo_flutter_app/Services/Storage/StorageService.dart';
import 'package:todo_flutter_app/Ui/Base/BaseViewModel.dart';
import 'package:todo_flutter_app/Ui/Pages/Login/LoginModels/LoginUserModel.dart';
import 'package:todo_flutter_app/Ui/Pages/Login/LoginRepository.dart';

class LoginViewModel extends BaseViewModel with ChangeNotifier{
  final LoginRepository _loginRepository = LoginRepository();
  StorageService storageService = StorageService();
  StreamController<LoginUserModel> loginDataStream = StreamController();
  
  LoginViewModel() {
    errorStream = _loginRepository.errorStream;
  }  


  void userLogin(String mobileNumber, String password) async {
    if(mobileNumber.isEmpty) {
      errorStream.add("Mobile Number is required.");
      return;
    } else if(password.isEmpty) {
      errorStream.add("Password is required.");
      return;
    }
    Map<String, String> params = {
      // "prm_mobileno": "7011490531",
      // "prm_password": "Udit@123",
      // "prm_useripaddress": "",
      // "prm_platform": "FLUTTER"
      "prm_mobileno": mobileNumber,
      "prm_password": password,
      "prm_useripaddress": "",
      "prm_platform": "FLUTTER"
    };
    CommonResponse apiResponse = await _loginRepository.userLogin(params);
    if(apiResponse.status == 1) {
      // List<List<LoginUserModel>> data = jsonDecode(apiResponse.data.toString());
      if(apiResponse.data != null) {
        List<dynamic> firstList = apiResponse.data as List<dynamic>;
        LoginUserModel loginUserModel = LoginUserModel.fromJson(firstList.first[0] as Map<String, dynamic>);
        saveUserDataToStorage(loginUserModel);
        loginDataStream.add(loginUserModel);
      } else {
        errorStream.add("Type Cast Error");
      }
      // debugPrint(data.first.name);
    } else {
      errorStream.add(apiResponse.message.toString());
    }

  }

  void saveUserDataToStorage(LoginUserModel loginUserModel) {
    String loginDataStr = jsonEncode(loginUserModel);
    storageService.saveStringToStorage(storageService.loginDataPref, loginDataStr);    
  }

}