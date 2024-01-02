import 'dart:async';

import 'package:todo_flutter_app/Ui/Base/BaseViewModel.dart';
import 'package:todo_flutter_app/Ui/Pages/Login/LoginModels/LoginUserModel.dart';
import 'package:todo_flutter_app/Ui/Pages/Login/LoginRepository.dart';

class LoginViewModel extends BaseViewModel{
  final LoginRepository _loginRepository = LoginRepository();
  StreamController<LoginUserModel> loginDataStream = StreamController();
  
  LoginViewModel() {
    errorStream = _loginRepository.errorStream;
    loadingStream = _loginRepository.loadingStream;
    loginDataStream = _loginRepository.loginDataStream;
  }  

  void userLogin(Map<String, String> params) async {
    _loginRepository.userLogin(params);
  }
}